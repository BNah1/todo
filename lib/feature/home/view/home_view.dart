import 'package:flutter/material.dart';
import 'package:todo/core/constant/app_string.dart';
import 'package:todo/core/constant/app_tab.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin{
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: AppTab.listTabView.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: AppTab.listTabView.length,
      child: Stack(
        children: [
          Scaffold(
            // appBar: AppBar(
            //   title:  const Text(AppString.appName),
            // ),
            bottomNavigationBar: TabBar(
              labelColor: Colors.pink,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.pink,
              tabs: AppTab.getHomeScreenTabs(_tabController.index),
              controller: _tabController,
              onTap: (index) {
                setState(() {});
              },
            ),
            body: AppTab.tabView(_tabController),
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 50,
            child: _buttonAdd
          ),
        ],
      ),
    );
  }

  final Widget _buttonAdd = Center(
    child: Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const Center(
        child: Text(
          '+',
          style: TextStyle(
            color: Colors.white,
            fontSize: 50,
          ),
        ),
      ),
    ),
  );

}
