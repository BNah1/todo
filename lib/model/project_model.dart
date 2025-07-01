import 'package:todo/model/task_model.dart';
import 'package:todo/model/user_model.dart';

class ProjectModel {
  final String projectId;
  final String projectName;
  final DateTime taskDeadLine;
  final List<UserModel> taskAssigned;
  final UserModel taskCreatedBy;
  final List<TaskModel> listTask;

  ProjectModel({
    required this.projectId,
    required this.projectName,
    required this.taskDeadLine,
    required this.taskAssigned,
    required this.taskCreatedBy,
    required this.listTask,
  });
}
