import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management/common/utils/constants.dart';
import 'package:task_management/features/todo/controllers/todo/todo_provider.dart';
import 'package:task_management/features/todo/controllers/xpension_provider.dart';

import '../../../common/widgets/xpansion_tiles.dart';
import '../pages/update_task.dart';
import 'todo_tiles.dart';

class DayAfterTomorrow extends ConsumerWidget {
  const DayAfterTomorrow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todo = ref.watch(todoStateProvider);

    var color = ref.read(todoStateProvider.notifier).getRandomColor();
    String dayAfter = ref.read(todoStateProvider.notifier).getDayAfter();
    var dayafterTask =
        todo.where((element) => element.date!.contains(dayAfter));
    return XPensionTiles(
        text: DateTime.now()
            .add(const Duration(days: 2))
            .toString()
            .substring(5, 10),
        text2: "Day after tomorrow task ",
        onExpansionChanged: (bool expanded) {
          ref.read(xpensionStateProvider.notifier).setStart(!expanded);
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
          for (final todo in dayafterTask)
            TODOTile(
              title: todo.title,
              description: todo.description,
              color: color,
              start: todo.startTime,
              end: todo.endTime,
              delete: () {
                ref.read(todoStateProvider.notifier).deleteTodo(todo.id ?? 0);
              },
              editWidget: GestureDetector(
                onTap: () {
                  titles = todo.title.toString();
                  descriptions = todo.description.toString();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdateTask(
                        id: todo.id ?? 0,
                      ),
                    ),
                  );
                },
                child: const Icon(MaterialCommunityIcons.circle_edit_outline),
              ),
              switcher: const SizedBox.shrink(),
            )
        ]);
  }
}
