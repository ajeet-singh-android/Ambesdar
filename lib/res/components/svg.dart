import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgImage extends StatelessWidget {
  SvgImage({super.key,required this.icon,required this.height,required this.width,this.color,this.voidCallback});
  String icon;
  double height;
  double width;
  Color? color = null;
  Function? voidCallback;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: voidCallback != null ? () => voidCallback!() : null,
      child: SvgPicture.asset(
        icon,
        width: width,
        height: height,
        color: color,
        fit: BoxFit.cover,
      ),
    );
  }
}
