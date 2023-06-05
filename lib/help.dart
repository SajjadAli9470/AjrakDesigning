import 'package:flutter/material.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await showModalBottomSheet(
            barrierColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) {
              return Dialog(
                backgroundColor: Colors.transparent,
                child: Container(
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    // height: 500,
                    child: GuidePage()),
              );
            });
      },
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
          ),
          child: const Icon(
            Icons.live_help,
            color: Colors.lightBlue,
            size: 40,
          )),
    );
  }
}

class GuidePage extends StatelessWidget {
  final List<GuideItem> guideItems = [
    GuideItem(
      image: 'assets/widgetsImages/pattren.png',
      title: 'Pattrens',
      description:
          'You can get the multiple pattrens on clicking above pattren icon',
    ),
    GuideItem(
      image: 'assets/widgetsImages/border.png',
      title: 'Borders',
      description:
          'You can get the multiple Borders on clicking above Borders icon',
    ),
    GuideItem(
      image: 'assets/widgetsImages/background.png',
      title: 'Background',
      description: 'You can select multiple background on clicking above icon',
    ),
    GuideItem(
      image: 'assets/widgetsImages/ratio.png',
      title: 'Ratio',
      description:
          'You can set ratio of Designing Container on clicking above icon ',
    ),
  ];

  GuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: PageView.builder(
        itemCount: guideItems.length,
        itemBuilder: (context, index) {
          final item = guideItems[index];
          return GuideItemCard(
            image: item.image,
            title: item.title,
            description: item.description,
            isLastPage: index == guideItems.length - 1,
          );
        },
      ),
    );
  }
}

class GuideItem {
  final String image;
  final String title;
  final String description;

  GuideItem(
      {required this.image, required this.title, required this.description});
}

class GuideItemCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final bool isLastPage;

  const GuideItemCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.isLastPage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 200,
            height: 200,
          ),
          const SizedBox(height: 32.0),
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16.0),
          Text(
            description,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32.0),
          if (isLastPage)
            ElevatedButton(
              onPressed: () {
                
                Navigator.of(context).pop();
              
                // Perform action when the user finishes the guide
              },
              child: const Text('Get Started'),
            ),
          if (!isLastPage)
            InkWell(
              onTap: () {
                
              },
              child: const Icon(
                Icons.arrow_forward,
                size: 48.0,
                color: Colors.blue,
              ),
            ),
        ],
      ),
    );
  }
}
