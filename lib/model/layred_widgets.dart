import 'dart:ui';

import 'package:flutter/cupertino.dart';

class LayeredWidget{
  final int id;
  final List<double>? scale;
  final List<Offset>? position;
  final List<Color>? color;
  final Widget child;
 
  

  LayeredWidget({ required this.id, this.scale,this.position, this.color,required this.child});
  
}