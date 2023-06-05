// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

import 'package:design_ajrak2/model/history_model.dart';

import 'blocs/bloc/history_bloc.dart';
import 'blocs/bloc/layred_bloc.dart';
import 'bottom_bar.dart';
import 'design_var.dart';

class design_area extends StatefulWidget {
  const design_area({super.key});

  @override
  State<design_area> createState() => _design_areaState();
}

class _design_areaState extends State<design_area> {
  ScreenshotController screenshotController = ScreenshotController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HistoryBloc>().add(add_history(
        history: History(
            layers: null,
            backgroundColor: selectedColor,
            ratio: ratio,
            selectedItem: -1,
            border: '')));
  }

  @override
  Widget build(BuildContext context) {
    Widget capturedContainer = Container(
      padding: const EdgeInsets.all(0),
      child: BlocBuilder<HistoryBloc, HistoryState>(
        builder: (context, hstate) {
          ratio = hstate.histroyList.isNotEmpty
              ? hstate.histroyList.last.ratio
              : ratio;
          selectedColor = hstate.histroyList.isNotEmpty
              ? hstate.histroyList.last.backgroundColor
              : selectedColor;
          var border = hstate.histroyList.isNotEmpty
              ? hstate.histroyList.last.border
              : "";
          return GestureDetector(
            onTap: () {
              context.read<HistoryBloc>().add(add_history(
                  history: History(
                      border: hstate.histroyList.last.border,
                      selectedItem: -1,
                      layers: hstate.histroyList.last.layers,
                      backgroundColor: selectedColor,
                      ratio: ratio,
                      matrix: hstate.histroyList.last.matrix)));
            },
            child: AspectRatio(
              aspectRatio: ratio,
              child: Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    image: border != '' &&
                            (hstate.histroyList.last.border != null)
                        ? DecorationImage(
                            image: AssetImage(hstate.histroyList.last.border!),
                            fit: BoxFit.fill)
                        : null,
                    color: selectedColor,
                    borderRadius: BorderRadius.circular(10)),
                child: BlocBuilder<LayredBloc, LayredState>(
                  builder: (context, state) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        ...state.layredList.map(
                          (e) {
                            return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    context.read<HistoryBloc>().add(add_history(
                                        history: History(
                                            border:
                                                hstate.histroyList.last.border,
                                            selectedItem: e.id,
                                            layers:
                                                hstate.histroyList.last.layers,
                                            backgroundColor: selectedColor,
                                            ratio: ratio,
                                            matrix: hstate
                                                .histroyList.last.matrix)));
                                  });
                                },
                                child: e.child);
                          },
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );

    return Scaffold(
        backgroundColor: greyColor,
        appBar: AppBar(
          title: Text(
            'Ajrak Designing',
            style: TextStyle(color: ajrakColor),
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(10),
              top: Radius.circular(10),
            ),
          ),
          actions: [
            BlocBuilder<HistoryBloc, HistoryState>(
              builder: (context, hstate) {
                return InkWell(
                  onTap: () {
                    context.read<HistoryBloc>().add(add_history(
                        history: History(
                            border: hstate.histroyList.last.border,
                            selectedItem: -1,
                            layers: hstate.histroyList.last.layers,
                            backgroundColor: selectedColor,
                            ratio: ratio,
                            matrix: hstate.histroyList.last.matrix)));

                    screenshotController
                        .capture(delay: const Duration(milliseconds: 10))
                        .then((capturedImage) async {
                      ShowCapturedWidget(context, capturedImage!);
                    }).catchError((onError) {
                      print(onError);
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: ajrakColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text('Capture'),
                  ),
                );
              },
            )
          ],
        ),
        body: Center(
            child: Screenshot(
                controller: screenshotController, child: capturedContainer)),
        bottomNavigationBar: const ButtomBar());
  }

  Future<dynamic> ShowCapturedWidget(
      BuildContext context, Uint8List capturedImage) {
    return showDialog(
      useSafeArea: false,
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.memory(capturedImage)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    await saveImageToDevice(capturedImage, context);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      'Save',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}



Future<void> saveImageToDevice(
    Uint8List capturedImage, BuildContext context) async {
  // Get the directory where the file will be saved
  Directory appDir = await getApplicationDocumentsDirectory();
  String appPath = appDir.path;

  // Generate a unique filename for the image
  String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  String filePath = '$appPath/image_$timestamp.png';

  // Write the image data to the file
  File imageFile = File(filePath);
  await imageFile.writeAsBytes(capturedImage);
  List<String> cutPath = filePath.split('/');

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return CustomDialog(
          path:
              '${cutPath[cutPath.length - 2]}/${cutPath[cutPath.length - 1]}');
    },
  );

  // Show a message or perform any additional operations
  print('Image saved to: $filePath');
}

class CustomDialog extends StatelessWidget {
  String path;
  CustomDialog({
    super.key,
    required this.path,
  });
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: _buildDialogContent(context),
    );
  }

  Widget _buildDialogContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Image Saved',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          const SizedBox(height: 16.0),
          Text(
            path,
            style: const TextStyle(fontSize: 16.0),
          ),
          const SizedBox(height: 24.0),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }
}
