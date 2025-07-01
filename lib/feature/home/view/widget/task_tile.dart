import 'package:flutter/material.dart';
import 'package:todo/core/constant/app_style.dart';
import 'package:todo/model/task_model.dart';
import 'package:todo/model/user_model.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.paddingDashBoard),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(AppSize.paddingMenu),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppSize.borderTile),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Row(
            children: [
              Checkbox(
                value: false,
                onChanged: (value) {
                },
              ),
              const SizedBox(width: AppSize.paddingDashBoard,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(task.taskName,style: AppTextStyle.textBodyTile,),
                  Text(task.taskDeadLine.toString(),style: AppTextStyle.textHint)
                ],
              ),
            ],
          ),
          listUser(task.taskAssigned)
        ],),
      ),
    );
  }

  Widget listUser(List<UserModel> list){
    return Container(
      padding: const EdgeInsets.all(AppSize.paddingMenu),
      child: Row(
        children: list.map((e) => CircleAvatar(
          backgroundImage: AssetImage(e.pathImage),
        )).toList(),
      ),
    );
  }
}
