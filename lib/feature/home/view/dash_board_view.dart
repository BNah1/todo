import 'package:flutter/material.dart';
import 'package:todo/core/constant/app_style.dart';
import 'package:todo/feature/home/view/widget/list_project_widget.dart';
import 'package:todo/feature/home/view/widget/list_task_widget.dart';
import 'package:todo/feature/home/view/widget/profile_dashboard.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSize.paddingDashBoard, horizontal: AppSize.paddingDashBoard),
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          const ProfileDashBoard(),
          const SizedBox(
            height: 30,
          ),
          containTile(
              'Your project',
              const SizedBox(height: 200, child: ListProjectWidget()),
              'See all',
                  () {}),
          const SizedBox(height: 30,),
          Expanded(
            child: containTile(
                'Your tasks',
                Expanded(child: ListTaskWidget()),
                'Add tasks',
                () {}),
          ),
        ],
      ),
    );
  }

  Widget containTile(
      String title, Widget child, String action, VoidCallback tap) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,style: AppTextStyle.dashboardTitle,),
            InkWell(onTap: tap, child: Text(action,style: AppTextStyle.dashboardAction,)),
          ],
        ),
        const SizedBox(height: AppSize.paddingDashBoard,),
        child
      ],
    );
  }
}
