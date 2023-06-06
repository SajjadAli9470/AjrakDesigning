import 'dart:ui';

import 'package:design_ajrak2/auth/user_auth.dart';
import 'package:design_ajrak2/main.dart';
import 'package:design_ajrak2/screens/Dashboard.dart';
import 'package:design_ajrak2/screens/GetLogged.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';

class Drawwer extends StatefulWidget {
  const Drawwer({super.key});

  @override
  State<Drawwer> createState() => _DrawwerState();
}

class _DrawwerState extends State<Drawwer> with TickerProviderStateMixin {
  late KFDrawerController _drawerController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _drawerController = KFDrawerController(
      initialPage: Dashboard(),
      items: [
        KFDrawerItem.initWithPage(
          text: const Text('Dashboard', style: TextStyle(color: Colors.white)),
          icon: const Icon(Icons.home, color: Colors.white),
          page: Dashboard(),
        ),
        // KFDrawerItem.initWithPage(
        //   text:
        //       const Text('Development', style: TextStyle(color: Colors.white)),
        //   icon: const Icon(Icons.home, color: Colors.white),
        // ),
        // KFDrawerItem.initWithPage(
        //   text: const Text('Impelementation',
        //       style: TextStyle(color: Colors.white)),
        //   icon: const Icon(Icons.home, color: Colors.white),
        // ),
        // KFDrawerItem.initWithPage(
        //   text: const Text('Testing', style: TextStyle(color: Colors.white)),
        //   icon: const Icon(Icons.home, color: Colors.white),
        // ),
        // KFDrawerItem.initWithPage(
        //   text: const Text('Delivery', style: TextStyle(color: Colors.white)),
        //   icon: const Icon(Icons.home, color: Colors.white),
        // ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
            image: AssetImage("assets/airpics.webp"),
            fit: BoxFit.cover,
          ),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [const Color.fromARGB(255, 255, 255, 255), Colors.grey],
            tileMode: TileMode.repeated,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: KFDrawer(
            controller: _drawerController,
            header: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'VR AUTOMOTIVE SYSTEM',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 15),
                  ),
                  Container(
                    // color: Colors.red,
                    // margin: const EdgeInsets.all(0),
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Image.asset(
                      'assets/vr.webp',
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                ],
              ),
            ),
            footer: KFDrawerItem(
              text: const Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
              icon: const Icon(
                Icons.logout_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                Auth().signOut();
                Navigator.of(context).push(CupertinoPageRoute(
                  fullscreenDialog: true,
                  builder: (BuildContext context) {
                    return const GetLoggedIN();
                  },
                ));
              },
            ),
          ),
        ),
      ),
    );
  }
}
