import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management/common/models/task_model.dart';
import 'package:task_management/common/utils/constants.dart';
import 'package:task_management/common/widgets/appstyle.dart';
import 'package:task_management/common/widgets/custom_outline_btn.dart';
import 'package:task_management/common/widgets/custom_text.dart';
import 'package:task_management/common/widgets/height_spacer.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;
import 'package:task_management/features/todo/controllers/dates/dates_provider.dart';
import 'package:task_management/features/todo/controllers/todo/todo_provider.dart';

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
    var scheduleDate = ref.watch(dateStateProvider);
    var startDate = ref.watch(startTimeStateProvider);
    var finishDate = ref.watch(finishTimeStateProvider);

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
                  picker.DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(2024, 1, 1),
                      theme: const picker.DatePickerTheme(
                          doneStyle:
                              TextStyle(color: AppConst.kGreen, fontSize: 16)),
                      onConfirm: (date) {
                    print(date.toString());
                    ref
                        .read(dateStateProvider.notifier)
                        .setDate(date.toString());
                  }, currentTime: DateTime.now(), locale: picker.LocaleType.en);
                },
                height: 52.h,
                width: AppConst.kWidth,
                color3: AppConst.kLight,
                text: scheduleDate == ""
                    ? "Set Date"
                    : scheduleDate.toString().substring(0, 10),
                color2: AppConst.kBlueLight,
              ),
              const HeightSpacer(hight: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomOutlineBtn(
                    onTap: () {
                      picker.DatePicker.showDateTimePicker(context,
                          showTitleActions: true, onConfirm: (date) {
                        ref
                            .read(startTimeStateProvider.notifier)
                            .setStart(date.toString());
                      }, locale: picker.LocaleType.en);
                    },
                    height: 52.h,
                    width: AppConst.kWidth * 0.4,
                    color3: AppConst.kLight,
                    text: startDate.toString() == ""
                        ? "Start Time"
                        : startDate.toString().substring(10, 16),
                    color2: AppConst.kBlueLight,
                  ),
                  CustomOutlineBtn(
                    onTap: () {
                      picker.DatePicker.showDateTimePicker(context,
                          showTitleActions: true, onConfirm: (date) {
                        ref
                            .read(finishTimeStateProvider.notifier)
                            .setEnd(date.toString());
                      }, locale: picker.LocaleType.en);
                    },
                    height: 52.h,
                    width: AppConst.kWidth * 0.4,
                    color3: AppConst.kLight,
                    text: finishDate.toString() == ""
                        ? "End Time"
                        : finishDate.toString().substring(10, 16),
                    color2: AppConst.kBlueLight,
                  ),
                ],
              ),
              const HeightSpacer(hight: 20),
              CustomOutlineBtn(
                onTap: () {
                  if (title.text.isNotEmpty &&
                      desc.text.isNotEmpty &&
                      scheduleDate.toString().isNotEmpty &&
                      startDate.toString().isNotEmpty &&
                      finishDate.toString().isNotEmpty) {
                    Task task = Task(
                        title: title.text,
                        description: desc.text,
                        isCompleted: 0,
                        date: scheduleDate.toString(),
                        startTime: startDate.toString().substring(10, 16),
                        endTime: finishDate.toString().substring(10, 16),
                        reminde: 0,
                        repeat: "yes");
                    ref.read(todoStateProvider.notifier).addItem(task);
                    ref.read(finishTimeStateProvider.notifier).setEnd("");
                    ref.read(startTimeStateProvider.notifier).setStart("");
                    ref.read(dateStateProvider.notifier).setDate("");
                    Navigator.pop(context);
                  } else {
                    //TODO create alert dialog
                    print("failed to add task");
                  }
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
