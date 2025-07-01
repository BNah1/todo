import 'package:flutter/material.dart';
import 'package:todo/core/constant/app_style.dart';
import 'package:todo/model/project_model.dart';
import 'package:todo/model/user_model.dart';

class ProjectTile extends StatelessWidget {
  const ProjectTile({super.key, required this.project});

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.paddingDashBoard),
      child: Container(
        width: size.width/2 - 30,
        height: size.height/4 - 30,
        margin: const EdgeInsets.symmetric(vertical: 8),
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
        Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(AppSize.paddingMenu),
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                    image: AssetImage('assets/Backgrounds/Spline.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(AppSize.paddingDashBoard), topRight: Radius.circular(AppSize.paddingDashBoard),
                ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppSize.paddingMenu),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Icon(Icons.search,color: Colors.white,),
                          Text('...', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSize.paddingDashBoard,),
                    Text(project.projectName),
                    const SizedBox(height: AppSize.paddingDashBoard,),
                    Text(project.listTask.length.toString()),
                    const SizedBox(height: AppSize.paddingDashBoard,),
                  ],),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.paddingMenu),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      listUser(project.taskAssigned), Text('%85')
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget listUser(List<UserModel> list){
    return Container(
      padding: const EdgeInsets.all(AppSize.paddingMenu),
      child: Row(
        children: list.map((e) => CircleAvatar(
          radius: 15,
          backgroundImage: AssetImage(e.pathImage),
        )).toList(),
      ),
    );
  }
}
