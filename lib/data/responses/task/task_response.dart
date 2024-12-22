import 'package:json_annotation/json_annotation.dart';

part 'task_response.g.dart';

@JsonSerializable()
class TaskResponse {
  @JsonKey(name: 'id')
  num? id;
  @JsonKey(name: 'user_id')
  num? userId;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'date')
  String? date;
  @JsonKey(name: 'startTime')
  String? startTime;
  @JsonKey(name: 'endTime')
  String? endTime;
  @JsonKey(name: 'category')
  String? category;
  @JsonKey(name: 'completed')
  bool? completed;
  @JsonKey(name: 'author')
  String? author;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'meta')
  MetaResponse? meta;

  TaskResponse(
      {this.id,
      this.userId,
      this.description,
      this.date,
      this.startTime,
      this.endTime,
      this.category,
      this.completed,
      this.author,
      this.message,
      this.meta});

  factory TaskResponse.fromJson(Map<String, dynamic> json) =>
      _$TaskResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TaskResponseToJson(this);
}

@JsonSerializable()
class TaskDataResponse {
  @JsonKey(name: 'id')
  num? id;
  @JsonKey(name: 'user_id')
  num? userId;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'date')
  String? date;
  @JsonKey(name: 'startTime')
  String? startTime;
  @JsonKey(name: 'endTime')
  String? endTime;
  @JsonKey(name: 'category')
  String? category;
  @JsonKey(name: 'completed')
  num? completed;
  @JsonKey(name: 'author')
  String? author;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'meta')
  MetaResponse? meta;

  TaskDataResponse(
      {this.id,
      this.userId,
      this.description,
      this.date,
      this.startTime,
      this.endTime,
      this.category,
      this.completed,
      this.author,
      this.message,
      this.meta});

  factory TaskDataResponse.fromJson(Map<String, dynamic> json) =>
      _$TaskDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TaskDataResponseToJson(this);
}

@JsonSerializable()
class MetaResponse {
  @JsonKey(name: 'notes')
  String? notes;

  @JsonKey(name: 'priority')
  String? priority;

  @JsonKey(name: 'assigned_to')
  String? assignedTo;

  MetaResponse({
    this.notes,
    this.priority,
    this.assignedTo,
  });

  factory MetaResponse.fromJson(Map<String, dynamic> json) =>
      _$MetaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MetaResponseToJson(this);
}
