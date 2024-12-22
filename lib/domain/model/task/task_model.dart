import 'package:daily_flow/data/responses/task/task_response.dart';
import 'package:flutter/material.dart';

class TaskMainModel {
  int id;
  TaskResponse taskRequest;

  TaskMainModel(this.id, this.taskRequest);
}

class TaskModel {
  num id;
  num userId;
  String description;
  String date;
  String startTime;
  String endTime;
  String category;
  bool completed;
  String author;
  String message;
  Color? color;
  MetaModel? meta;

  TaskModel(
    this.id,
    this.userId,
    this.description,
    this.date,
    this.startTime,
    this.endTime,
    this.category,
    this.completed,
    this.author,
    this.message,
    this.meta,
      {
    this.color,
  });
}
class TaskDataModel {
  num id;
  num userId;
  String description;
  String date;
  String startTime;
  String endTime;
  String category;
  num completed;
  String author;
  String message;
  Color? color;
  MetaModel? meta;

  TaskDataModel(
    this.id,
    this.userId,
    this.description,
    this.date,
    this.startTime,
    this.endTime,
    this.category,
    this.completed,
    this.author,
    this.message,
    this.meta,
      {
    this.color,
  });
}

class MetaModel {
  String notes;
  String priority;
  String assignedTo;

  MetaModel(
    this.notes,
    this.priority,
    this.assignedTo,
  );
}
