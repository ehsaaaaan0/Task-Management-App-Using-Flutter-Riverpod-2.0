import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/common/utils/constants.dart';
import 'package:task_management/common/widgets/custom_outline_btn.dart';
import 'package:task_management/common/widgets/height_spacer.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

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
            const HeightSpacer(hight: 50),
            CustomOutlineBtn(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                height: AppConst.kHeight * 0.06,
                width: AppConst.kWidth * 0.9,
                color3: AppConst.kLight,
                text: "Login with a phone number")
          ],
        ));
  }
}
