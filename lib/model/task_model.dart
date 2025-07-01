import 'package:todo/model/user_model.dart';

class TaskModel {
  final String projectId;
  final String taskName;
  final DateTime taskDeadLine;
  final List<UserModel> taskAssigned;
  final UserModel taskCreatedBy;
  final List<String> subTasks;
  final String descriptions;
  final String urgent;

  TaskModel(
      this.taskName,
      this.taskDeadLine,
      this.taskAssigned,
      this.taskCreatedBy,
      this.subTasks,
      this.descriptions,
      this.urgent,
      this.projectId,
      );
}
