import 'package:flutter/material.dart';
import 'package:todo/core/constant/app_style.dart';
import 'package:todo/core/utils/valid_utils.dart';
import 'package:todo/model/task_model.dart';
import 'package:todo/model/user_model.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({super.key, required this.task});

  final TaskModel task;

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool ticked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.paddingDashBoard),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(AppSize.paddingMenu),
        decoration: BoxDecoration(
          color: ticked ? Colors.white70 : Colors.white,
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          Checkbox(
            value: ticked,
            onChanged: (value) {
              print(value);
              setState(() {
                if(value != null) {
                  ticked = value;
                }
              });
            },
          ),
          const SizedBox(width: AppSize.paddingDashBoard,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.task.taskName,
                  style: AppTextStyle.textBodyTile,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(formatDate(widget.task.taskDeadLine),style: AppTextStyle.textSubBody)
              ],
            ),
          ),
          SizedBox(
              width: 50,
              child: listUser(widget.task.taskAssigned))
        ],),
      ),
    );
  }

  Widget listUser(List<UserModel> list) {
    const double avatarSize = 32;
    const double overlap = 20;

    final showCount = list.length > 2 ? 2 : list.length;
    final showList = list.sublist(0, showCount);
    final totalAvatars = list.length > 2 ? 2 : list.length;

    return SizedBox(
      height: avatarSize,
      width: totalAvatars * (avatarSize - overlap) + overlap,
      child: Stack(
        children: [
          // Hiển thị avatar thật
          for (int i = 0; i < showList.length; i++)
            Positioned(
              left: i * (avatarSize - overlap),
              child: CircleAvatar(
                radius: avatarSize / 2,
                backgroundImage: AssetImage(showList[i].pathImage),
              ),
            ),

          if (list.length > 2)
            Positioned(
              left: showCount * (avatarSize - overlap),
              child: CircleAvatar(
                radius: avatarSize / 2,
                backgroundColor: Colors.grey[50],
                child: Text(
                  '+${list.length - 2}',
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                ),
              ),
            ),
        ],
      ),
    );

  }

}
