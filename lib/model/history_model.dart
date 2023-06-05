// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:design_ajrak2/model/layred_widgets.dart';

class History {
  final LayeredWidget? layers;
  final Matrix4? matrix;
  final Color backgroundColor;
  final double ratio;
  final int selectedItem;
  final String? border;
  History({
    this.layers,
    this.matrix,
    required this.backgroundColor,
    required this.ratio,
    required this.selectedItem,
    this.border,
  });
}
