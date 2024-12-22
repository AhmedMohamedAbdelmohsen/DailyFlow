import 'package:daily_flow/app/constants.dart';
import 'package:daily_flow/app/extension.dart';
import 'package:daily_flow/data/responses/task/task_response.dart';
import 'package:daily_flow/domain/model/task/task_model.dart';

extension TaskResponseMapper on TaskResponse? {
  TaskModel toDomain() {
    return TaskModel(
      this?.id.orZero() ?? Constants.zero,
      this?.userId.orZero() ?? Constants.zero,
      this?.description.orEmpty() ?? Constants.empty,
      this?.date.orEmpty() ?? Constants.empty,
      this?.startTime.orEmpty() ?? Constants.empty,
      this?.endTime.orEmpty() ?? Constants.empty,
      this?.category.orEmpty() ?? Constants.empty,
      this?.completed.orZero() ?? Constants.zero,
      this?.author.orEmpty() ?? Constants.empty,
      this?.message.orEmpty() ?? Constants.empty,
      this?.meta.toDomain(),
    );
  }
}

extension MetaResponseMapper on MetaResponse? {
  MetaModel toDomain() {
    return MetaModel(
      this?.notes.orEmpty() ?? Constants.empty,
      this?.priority.orEmpty() ?? Constants.empty,
      this?.assignedTo.orEmpty() ?? Constants.empty,
    );
  }
}
