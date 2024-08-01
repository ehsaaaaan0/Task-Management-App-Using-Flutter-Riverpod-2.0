import 'package:flutter/material.dart';

class WidthSpacer extends StatelessWidget {
  const WidthSpacer({
    super.key, required this.h,
  });
  final double h;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: h,
    );
  }
}
