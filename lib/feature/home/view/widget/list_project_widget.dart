import 'package:flutter/material.dart';
import 'package:todo/core/utils/mock_utils.dart';
import 'package:todo/feature/home/view/widget/project_tile.dart';
import 'package:todo/model/project_model.dart';

class ListProjectWidget extends StatelessWidget {
  const ListProjectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getListProject(),
        builder: (context, snapshot){
          List<ProjectModel> list = [];
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No tasks found.'));
          }
          list = snapshot.data!;
          return ListView.builder(
            scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (context, index){
                return ProjectTile(project: list[index],);
              });
        });
  }
}
