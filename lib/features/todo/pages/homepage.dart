import 'package:flutter/material.dart';
import 'package:task_management/common/utils/constants.dart';
import 'package:task_management/common/widgets/appstyle.dart';
import 'package:task_management/common/widgets/height_spacer.dart';
import 'package:task_management/common/widgets/reusable_text.dart';
import 'package:task_management/common/widgets/width_spacer.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ReusableText(
                text: "Dummy Text to check",
                style: appStyle(26, AppConst.kGreen, FontWeight.bold)),

          const WidthSpacer(h: 20,),
                
          ReusableText(
                text: "Dummy Text to check",
                style: appStyle(26, AppConst.kGreen, FontWeight.bold)),
          
        ],
      ),
    );
  }
}