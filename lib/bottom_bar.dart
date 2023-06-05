import 'package:design_ajrak2/background.dart';
import 'package:design_ajrak2/Delete.dart';
import 'package:design_ajrak2/help.dart';
import 'package:design_ajrak2/patterns.dart';
import 'package:design_ajrak2/ratio.dart';
import 'package:flutter/material.dart';

import 'border.dart';

class ButtomBar extends StatefulWidget {
  const ButtomBar({super.key});

  @override
  State<ButtomBar> createState() => _ButtomBarState();
}

class _ButtomBarState extends State<ButtomBar> {
  @override
  Widget build(BuildContext context) {
    return   SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 80 ,
        
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
          ),
          child: const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  Pattrens(),
                  Borders(),
                  BackGround(),
                  Ratio(),
                  Delete(), 
                  Help()

                  // LayersUp(),
                  // LayersDown()
              ],
            ),
          ),
        )
      )   
    
    ;
  }
}