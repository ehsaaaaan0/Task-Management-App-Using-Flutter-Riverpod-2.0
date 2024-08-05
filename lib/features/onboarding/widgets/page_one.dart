import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/common/utils/constants.dart';
import 'package:task_management/common/widgets/appstyle.dart';
import 'package:task_management/common/widgets/height_spacer.dart';
import 'package:task_management/common/widgets/reusable_text.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: AppConst.kHeight,
        width: AppConst.kWidth,
        color: AppConst.kBkDark,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Image.asset("assets/images/todo.png"),
            ),
            const HeightSpacer(hight: 100),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ReusableText(
                    text: "ToDo with Rivarpod",
                    style: appStyle(30, AppConst.kLight, FontWeight.w600)),
                const HeightSpacer(hight: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Text(
                      "Welcome! Do you want to ceate a task fast and with ease",
                      textAlign: TextAlign.center,
                      style:
                          appStyle(16, AppConst.kGrayLight, FontWeight.normal)),
                )
              ],
            )
          ],
        ));
  }
}
