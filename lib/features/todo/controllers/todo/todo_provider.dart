import 'dart:math';

import 'package:pinput/pinput.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task_management/common/healpers/db_helper.dart';
import 'package:task_management/common/models/task_model.dart';

import '../../../../common/utils/constants.dart';

part 'todo_provider.g.dart';

@riverpod
class TodoState extends _$TodoState {
  @override
  List<Task> build() {
    return [];
  }

  void refresh() async {
    final data = await DbHelper.getItems();
    state = data.map((e) => Task.fromJson(e)).toList();
  }

  void addItem(Task task) async {
    await DbHelper.createItem(task);
    refresh();
  }

  dynamic getRandomColor() {
    Random random = Random();
    int randomIndex = random.nextInt(colorr.length);
    return colorr[randomIndex];
  }

  void updateItem(int id, String title, String desc, int isCompleted,
      String date, String startTime, String endTime) async {
    await DbHelper.updateItem(
        id, title, desc, isCompleted, date, startTime, endTime);
    refresh();
  }

  Future<void> deleteTodo(int id) async {
    await DbHelper.deleteItem(id);
    refresh();
  }

  void markAsCompleted(int id, String title, String desc, int isCompleted,
      String date, String startTime, String endTime) async {
    await DbHelper.updateItem(id, title, desc, 1, date, startTime, endTime);
    refresh();
  }

//today
  String getToday() {
    DateTime today = DateTime.now();
    return today.toString().substring(0, 10);
  }

  //tomorrow
  String getTomorrow() {
    DateTime tomorrow = DateTime.now().add(Duration(days: 1));
    return tomorrow.toString().substring(0, 10);
  }

  List<String> last30days() {
    DateTime datAfterTomo = DateTime.now();
    DateTime oneMonthAgo = datAfterTomo.subtract(const Duration(days: 30));
    List<String> dates = [];
    for (int i = 0; i < 30; i++) {
      DateTime date = oneMonthAgo.add(Duration(days: i));
      dates.add(date.toString().substring(0, 10));
    }
    return dates;
  }

  bool getStaus(Task task) {
    bool? isCompleted;
    if (task.isCompleted == 0) {
      isCompleted = false;
    } else {
      isCompleted = true;
    }
    return isCompleted;
  }
}
