import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management/common/models/task_model.dart';
import 'package:task_management/features/todo/controllers/todo/todo_provider.dart';
import 'package:task_management/features/todo/widgets/todo_tiles.dart';

import '../../../common/utils/constants.dart';
import '../pages/update_task.dart';

class TodayTask extends ConsumerWidget {
  const TodayTask({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Task> listData = ref.watch(todoStateProvider);
    String today = ref.read(todoStateProvider.notifier).getToday();
    var todayList = listData
        .where((element) =>
            element.isCompleted == 0 && element.date!.contains(today))
        .toList();
    return ListView.builder(
        itemCount: todayList.length,
        itemBuilder: (context, index) {
          final data = todayList[index];
          bool isCompleted =
              ref.read(todoStateProvider.notifier).getStaus(data);
          dynamic color = ref.read(todoStateProvider.notifier).getRandomColor();
          return TODOTile(
            delete: () {
              ref.read(todoStateProvider.notifier).deleteTodo(data.id ?? 0);
            },
            title: data.title,
            description: data.description,
            start: data.startTime,
            end: data.endTime,
            color: color,
            editWidget: GestureDetector(
              onTap: () {
                  titles = data.title.toString();
                  descriptions = data.description.toString();
                MaterialPageRoute(
                  builder: (context) => UpdateTask(id: data.id??0,),
                );
              },
              child: const Icon(MaterialCommunityIcons.circle_edit_outline),
            ),
            switcher: Switch(
                value: isCompleted,
                onChanged: (value) {
                  ref.read(todoStateProvider.notifier).markAsCompleted(
                      data.id ?? 0,
                      data.title.toString(),
                      data.description.toString(),
                      1,
                      data.date.toString(),
                      data.startTime.toString(),
                      data.endTime.toString());
                }),
          );
        });
  }
}
