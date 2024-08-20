import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management/common/utils/constants.dart';
import 'package:task_management/common/widgets/appstyle.dart';
import 'package:task_management/common/widgets/custom_outline_btn.dart';
import 'package:task_management/common/widgets/custom_text.dart';
import 'package:task_management/common/widgets/height_spacer.dart';

class AddTask extends ConsumerStatefulWidget {
  const AddTask({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTaskState();
}

class _AddTaskState extends ConsumerState<AddTask> {
  final TextEditingController title = TextEditingController();
  final TextEditingController desc = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              const HeightSpacer(hight: 20),
              CustomTextField(
                hintText: "Add title",
                controller: title,
                hintStyle: appStyle(16, AppConst.kGrayLight, FontWeight.w600),
              ),
              const HeightSpacer(hight: 20),
              CustomTextField(
                hintText: "Add description",
                controller: desc,
                hintStyle: appStyle(16, AppConst.kGrayLight, FontWeight.w600),
              ),
              const HeightSpacer(hight: 20),
              CustomOutlineBtn(
                  onTap: () {
                    
                  },
                height: 52.h,
                width: AppConst.kWidth,
                color3: AppConst.kLight,
                text: "Set Date",
                color2: AppConst.kBlueLight,
              ),
              const HeightSpacer(hight: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                CustomOutlineBtn(
                  onTap: () {
                    
                  },
                height: 52.h,
                width: AppConst.kWidth*0.4,
                color3: AppConst.kLight,
                text: "Start Time",
                color2: AppConst.kBlueLight,
              ),
              CustomOutlineBtn(
                  onTap: () {
                    
                  },
                height: 52.h,
                width: AppConst.kWidth*0.4,
                color3: AppConst.kLight,
                text: "End Time",
                color2: AppConst.kBlueLight,
              ),
                ],
              ),
              const HeightSpacer(hight: 20),

                CustomOutlineBtn(
                    onTap: () {
                    
                  },
                height: 52.h,
                width: AppConst.kWidth,
                color3: AppConst.kLight,
                text: "Submit",
                color2: AppConst.kGreen,
              ),
            ],
          ),
        ));
  }
}
