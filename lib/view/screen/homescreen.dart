import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import '../../constants/common.dart/colors.dart';
import '../../model/newsblogs_view_model.dart';
import '../widget/latest_news_container.dart';
import '../widget/tab_bar.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({super.key});

  @override
  State<Home_screen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Home_screen> {
  @override
  void initState() {
    super.initState();
    final vm = Provider.of<NewsblogsViewModel>(context, listen: false);
    vm.fetchBlogCategory();
  }

  int initPosition = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          title: Column(
            children: const [
              SizedBox(
                height: 30,
              ),
              Text(
                "News & Blogs",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          backgroundColor: backgroundColor,
          elevation: 0,
        ),
      ),
      body: Consumer<NewsblogsViewModel>(
          builder: (context, value, child) => Tab_bar_View(
              itemCount: value.myTabs.length,
              tabBuilder: (context, index) => Tab(
                    icon: value.myTabs[index],
                  ),
              pageBuilder: (context, index) => Center(
                      child: Column(children: [
                    Expanded(
                        child: SafeArea(
                            child: LatestNewsContainer(
                      id: value.blogCategory[index]['id'],
                    )))
                  ])),
              onPositionChange: (index) {
                initPosition = index;
              },
              onScroll: (position) => log(''),
              initPosition: initPosition)),
    );
  }
}
