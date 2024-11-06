import 'package:flutter/material.dart';
import '../main.dart';

extension EmptySpace on double {
  SizedBox get height => SizedBox(height: toDouble());
  SizedBox get width => SizedBox(width: toDouble());
}

extension EmptySpace1 on num {
  SizedBox get height => SizedBox(height: toDouble());
  SizedBox get width => SizedBox(width: toDouble());
}

extension SizeExtension on BuildContext  {
  SizedBox mheight(double factor){
    return SizedBox(height: rheight*factor);
  }
}

extension EmptySpace3 on BuildContext  {
  SizedBox mwidth(double factor){
    return SizedBox(width: rwidth*factor,);
  }
}