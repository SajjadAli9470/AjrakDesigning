import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matrix_gesture_detector_pro/matrix_gesture_detector_pro.dart';

import 'blocs/bloc/history_bloc.dart';

class OverlayedWidget extends StatefulWidget {
  final int id;
  final Widget child;
  const OverlayedWidget(
      {super.key, Color? color, required this.child, required this.id});

  @override
  State<OverlayedWidget> createState() => _OverlayedWidgetState();
}

class _OverlayedWidgetState extends State<OverlayedWidget> {
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<Matrix4> notifier = ValueNotifier(Matrix4.identity());
    return MatrixGestureDetector(
      onMatrixUpdate: (m, tm, sm, rm) {
        notifier.value = m;
      },
      child: AnimatedBuilder(
        animation: notifier,
        builder: (ctx, widgetchild) {
          return Transform(
            transform: notifier.value,
            child: Align(
              alignment: Alignment.center,
              child: FittedBox(
                  fit: BoxFit.contain,
                  child: BlocBuilder<HistoryBloc, HistoryState>(
                    builder: (context, state) {
                      return Container(
                        decoration: (state.histroyList.last.selectedItem)==widget.id ? BoxDecoration(
                  border: Border.all(color: Colors.black,width: 2),
                  borderRadius: BorderRadius.circular(5),
                ) : null,child: widget.child);
                    },
                  )),
            ),
          );
        },
      ),
    );
  }
}
