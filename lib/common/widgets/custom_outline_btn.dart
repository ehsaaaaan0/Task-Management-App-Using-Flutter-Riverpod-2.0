import 'package:flutter/material.dart';
import 'package:task_management/common/widgets/appstyle.dart';
import 'package:task_management/common/widgets/reusable_text.dart';

class CustomOutlineBtn extends StatelessWidget {
  const CustomOutlineBtn(
      {super.key,
      this.onTap,
      required this.height,
      required this.width,
      this.color2,
      required this.color3, required this.text});
  final void Function()? onTap;
  final double height;
  final double width;
  final Color? color2;
  final Color color3;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: color2,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              border: Border.all(width: 1, color: color3)),
          child: Center(
            child: ReusableText(
                text: text, style: appStyle(18, color3, FontWeight.bold)),
          ),
        ));
  }
}
