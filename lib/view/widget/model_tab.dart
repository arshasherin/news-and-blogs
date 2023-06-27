import 'package:flutter/material.dart';

class My_Tab extends StatelessWidget {
  final String tabName;
   My_Tab({super.key, required this.tabName});

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 150,
      child: Container(
        padding: EdgeInsets.all(8),
        // decoration: BoxDecoration(
        //     color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
        child: Text(tabName)
      ),
    );
  }
}