// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskResponse _$TaskResponseFromJson(Map<String, dynamic> json) => TaskResponse(
      id: json['id'] as num?,
      userId: json['user_id'] as num?,
      description: json['description'] as String?,
      date: json['date'] as String?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      category: json['category'] as String?,
      completed: json['completed'] as bool?,
      author: json['author'] as String?,
      message: json['message'] as String?,
      meta: json['meta'] == null
          ? null
          : MetaResponse.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TaskResponseToJson(TaskResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'description': instance.description,
      'date': instance.date,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'category': instance.category,
      'completed': instance.completed,
      'author': instance.author,
      'message': instance.message,
      'meta': instance.meta,
    };

TaskDataResponse _$TaskDataResponseFromJson(Map<String, dynamic> json) =>
    TaskDataResponse(
      id: json['id'] as num?,
      userId: json['user_id'] as num?,
      description: json['description'] as String?,
      date: json['date'] as String?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      category: json['category'] as String?,
      completed: json['completed'] as num?,
      author: json['author'] as String?,
      message: json['message'] as String?,
      meta: json['meta'] == null
          ? null
          : MetaResponse.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TaskDataResponseToJson(TaskDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'description': instance.description,
      'date': instance.date,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'category': instance.category,
      'completed': instance.completed,
      'author': instance.author,
      'message': instance.message,
      'meta': instance.meta,
    };

MetaResponse _$MetaResponseFromJson(Map<String, dynamic> json) => MetaResponse(
      notes: json['notes'] as String?,
      priority: json['priority'] as String?,
      assignedTo: json['assigned_to'] as String?,
    );

Map<String, dynamic> _$MetaResponseToJson(MetaResponse instance) =>
    <String, dynamic>{
      'notes': instance.notes,
      'priority': instance.priority,
      'assigned_to': instance.assignedTo,
    };
