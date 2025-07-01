import 'package:todo/model/project_model.dart';
import 'package:todo/model/task_model.dart';
import 'package:todo/model/user_model.dart';

class MockData{

  static List<UserModel> listUserMock = [
    UserModel("Alice", "u001", "assets/avaters/avatar_1.jpg"),
    UserModel("Bob", "u002", "assets/avaters/avatar_1.jpg"),
    UserModel("Diana", "u003", "assets/avaters/avatar_1.jpg"),
    UserModel("Urgot", "u004", "assets/avaters/avatar_1.jpg"),
  ];


  static List<TaskModel> listTaskMock = [
    TaskModel(
      "Design Homepage",
      DateTime(2025, 7, 10),
      [listUserMock[0], listUserMock[1]], // Alice + Bob
      listUserMock[2], // Diana tạo
      ["Sketch layout", "Create prototype"],
      "Design the homepage for the new project.",
      "High",
      "p001",
    ),
    TaskModel(
      "Build Login Page",
      DateTime(2025, 7, 11),
      [listUserMock[0]], // Alice
      listUserMock[3], // Urgot
      ["Design UI", "Implement logic"],
      "Create login functionality",
      "High",
      "p001",
    ),
    TaskModel(
      "Setup Database",
      DateTime(2025, 7, 13),
      [listUserMock[0], listUserMock[2]], // Alice + Diana
      listUserMock[1], // Bob
      ["ERD design", "Table creation"],
      "Prepare the database schema",
      "Medium",
      "p002",
    ),
    TaskModel(
      "Write Unit Tests",
      DateTime(2025, 7, 16),
      [listUserMock[0]], // Alice
      listUserMock[1], // Bob
      ["Login test", "Register test"],
      "Ensure all flows are tested",
      "Low",
      "p002",
    ),
    TaskModel(
      "Setup Database",
      DateTime(2025, 7, 13),
      [listUserMock[0], listUserMock[2]], // Alice + Diana
      listUserMock[1], // Bob
      ["ERD design", "Table creation"],
      "Prepare the database schema",
      "Medium",
      "p002",
    ),
    TaskModel(
      "Write Unit Tests",
      DateTime(2025, 7, 16),
      [listUserMock[0]], // Alice
      listUserMock[1], // Bob
      ["Login test", "Register test"],
      "Ensure all flows are tested",
      "Low",
      "p002",
    ),
  ];

  
  static List<ProjectModel> listProjectMock = [
    ProjectModel(
      projectId: "p001",
      projectName: "Frontend Redesign",
      taskDeadLine: DateTime(2025, 7, 20),
      taskAssigned: [listUserMock[0], listUserMock[1]], // Alice + Bob
      taskCreatedBy: listUserMock[2], // Diana
      listTask: listTaskMock.where((task) => task.projectId == "p001").toList(),
    ),
    ProjectModel(
      projectId: "p002",
      projectName: "Backend System",
      taskDeadLine: DateTime(2025, 7, 25),
      taskAssigned: [listUserMock[0], listUserMock[2]], // Alice + Diana
      taskCreatedBy: listUserMock[3], // Urgot
      listTask: listTaskMock.where((task) => task.projectId == "p002").toList(),
    ),
  ];

}