import 'dart:convert';

Task taskFromJson(String str) => Task.fromJson(json.decode(str));

String taskToJson(Task data) => json.encode(data.toJson());

class Task {
    int? id;
    String? title;
    String? description;
    int? isCompleted;
    String? date;
    String? startTime;
    String? endTime;
    int? reminde;
    String? repeat;

    Task({
        this.id,
        this.title,
        this.description,
        this.isCompleted,
        this.date,
        this.startTime,
        this.endTime,
        this.reminde,
        this.repeat,
    });

    factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        isCompleted: json["isCompleted"],
        date: json["date"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        reminde: json["reminde"],
        repeat: json["repeat"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "isCompleted": isCompleted,
        "date": date,
        "startTime": startTime,
        "endTime": endTime,
        "reminde": reminde,
        "repeat": repeat,
    };
}
