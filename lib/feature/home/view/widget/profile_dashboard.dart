import 'package:flutter/material.dart';
import 'package:todo/core/constant/app_style.dart';

class ProfileDashBoard extends StatelessWidget {
  const ProfileDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hi, AAA',style:  AppTextStyle.dashboardWelcome,),
            Text('5 tasks for you today',style:  AppTextStyle.textHint),
          ],
        ),
        const CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage('assets/avaters/Avatar 4.jpg'),
        ),
      ],
    );
  }
}
