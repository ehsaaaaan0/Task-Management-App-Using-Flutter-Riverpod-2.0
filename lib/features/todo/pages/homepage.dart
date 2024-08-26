import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management/common/models/task_model.dart';
import 'package:task_management/common/utils/constants.dart';
import 'package:task_management/common/widgets/appstyle.dart';
import 'package:task_management/common/widgets/custom_text.dart';
import 'package:task_management/common/widgets/height_spacer.dart';
import 'package:task_management/common/widgets/reusable_text.dart';
import 'package:task_management/common/widgets/width_spacer.dart';
import 'package:task_management/common/widgets/xpansion_tiles.dart';
import 'package:task_management/features/todo/controllers/todo/todo_provider.dart';
import 'package:task_management/features/todo/controllers/xpension_provider.dart';
import 'package:task_management/features/todo/pages/add.dart';
import 'package:task_management/features/todo/widgets/todo_tiles.dart';

import '../widgets/today_task.dart';

class Homepage extends ConsumerStatefulWidget {
  const Homepage({super.key});

  @override
  ConsumerState<Homepage> createState() => _HomepageState();
}

class _HomepageState extends ConsumerState<Homepage>
    with TickerProviderStateMixin {
  final TextEditingController search = TextEditingController();
  late final TabController tabController =
      TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    ref.watch(todoStateProvider.notifier).refresh();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(85),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(
                          text: "Dashboard",
                          style:
                              appStyle(18, AppConst.kLight, FontWeight.bold)),
                      Container(
                        width: 25.w,
                        height: 25.h,
                        decoration: const BoxDecoration(
                          color: AppConst.kLight,
                          borderRadius: BorderRadius.all(Radius.circular(9)),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AddTask()));
                          },
                          child: const Icon(
                            Icons.add,
                            color: AppConst.kBkDark,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const HeightSpacer(hight: 20),
                CustomTextField(
                  hintText: "Search",
                  controller: search,
                  prefixIcon: Container(
                    padding: EdgeInsets.all(14.h),
                    child: GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        AntDesign.search1,
                        color: AppConst.kGrayLight,
                      ),
                    ),
                  ),
                  suffixIcon: const Icon(
                    FontAwesome.sliders,
                    color: AppConst.kGrayLight,
                  ),
                ),
                const HeightSpacer(hight: 15),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ListView(
              children: [
                const HeightSpacer(hight: 25),
                Row(
                  children: [
                    const Icon(
                      FontAwesome.tasks,
                      size: 20,
                      color: AppConst.kLight,
                    ),
                    const WidthSpacer(h: 10),
                    ReusableText(
                        text: "Today's Task",
                        style: appStyle(18, AppConst.kLight, FontWeight.bold))
                  ],
                ),
                const HeightSpacer(hight: 25),
                Container(
                  decoration: BoxDecoration(
                      color: AppConst.kLight,
                      borderRadius:
                          BorderRadius.all(Radius.circular(AppConst.kRadius))),
                  child: TabBar(
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: BoxDecoration(
                          color: AppConst.kGrayLight,
                          borderRadius: BorderRadius.all(
                              Radius.circular(AppConst.kRadius))),
                      controller: tabController,
                      labelPadding: EdgeInsets.zero,
                      isScrollable: false,
                      labelColor: AppConst.kBlueLight,
                      labelStyle:
                          appStyle(24, AppConst.kBlueLight, FontWeight.w700),
                      unselectedLabelColor: AppConst.kLight,
                      tabs: [
                        Tab(
                          child: SizedBox(
                            width: AppConst.kWidth * 0.5,
                            child: Center(
                              child: ReusableText(
                                  text: "Pending",
                                  style: appStyle(
                                      16, AppConst.kBkDark, FontWeight.bold)),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            padding: EdgeInsets.only(left: 30.w),
                            width: AppConst.kWidth * 0.5,
                            child: Center(
                              child: ReusableText(
                                  text: "Completed",
                                  style: appStyle(
                                      16, AppConst.kBkDark, FontWeight.bold)),
                            ),
                          ),
                        )
                      ]),
                ),
                const HeightSpacer(hight: 20),
                SizedBox(
                  height: AppConst.kHeight * 0.3,
                  width: AppConst.kWidth,
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppConst.kRadius)),
                    child: TabBarView(controller: tabController, children: [
                      Container(
                          color: AppConst.kBkLight,
                          height: AppConst.kHeight * 0.3,
                          child: const TodayTask()),
                      Container(
                        color: AppConst.kBkLight,
                        height: AppConst.kHeight * 0.3,
                      )
                    ]),
                  ),
                ),
                const HeightSpacer(hight: 20),
                XPensionTiles(
                    text: "Tomorrow's Task",
                    text2: "Tomorrow's tasks are shown here",
                    onExpansionChanged: (bool expanded) {
                      ref
                          .read(xpensionStateProvider.notifier)
                          .setStart(!expanded);
                    },
                    trailing: Padding(
                      padding: EdgeInsets.only(right: 12.w),
                      child: ref.watch(xpensionStateProvider)
                          ? const Icon(
                              AntDesign.circledown,
                              color: AppConst.kLight,
                            )
                          : const Icon(
                              AntDesign.closecircleo,
                              color: AppConst.kBlueLight,
                            ),
                    ),
                    children: [
                      TODOTile(
                        start: "03:00",
                        end: "04:00",
                        switcher: Switch(value: true, onChanged: (value) {}),
                      )
                    ]),
                const HeightSpacer(hight: 20),
                XPensionTiles(
                    text: DateTime.now()
                        .add(const Duration(days: 2))
                        .toString()
                        .substring(5, 10),
                    text2: "Tomorrow's tasks are shown here",
                    onExpansionChanged: (bool expanded) {
                      ref
                          .read(xpensionState0Provider.notifier)
                          .setStart(!expanded);
                    },
                    trailing: Padding(
                      padding: EdgeInsets.only(right: 12.w),
                      child: ref.watch(xpensionState0Provider)
                          ? const Icon(
                              AntDesign.circledown,
                              color: AppConst.kLight,
                            )
                          : const Icon(
                              AntDesign.closecircleo,
                              color: AppConst.kBlueLight,
                            ),
                    ),
                    children: [
                      TODOTile(
                        start: "03:00",
                        end: "04:00",
                        switcher: Switch(value: true, onChanged: (value) {}),
                      )
                    ]),
              ],
            ),
          ),
        ));
  }
}
