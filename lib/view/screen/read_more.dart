import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import '../../model/newsblogs_view_model.dart';
import '../widget/blog_details.dart';

class Read_more extends StatefulWidget {
  final int id;
  const Read_more({super.key,required this.id});

  @override
  State<Read_more> createState() => _ReadMoreState();
}
  
class _ReadMoreState extends State<Read_more> {
 
  @override
  Widget build(BuildContext context) {
        final vm = Provider.of<NewsblogsViewModel>(context,listen: false);

    return Scaffold(
      appBar: PreferredSize(child: AppBar(
        title: Text("Latest News"),
      ), preferredSize: Size.fromHeight(50)),
      body:vm.BlogList==null? const CircularProgressIndicator(): SingleChildScrollView(
        child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: vm.BlogList.length,
            itemBuilder: (ctx,index){
              return Consumer<NewsblogsViewModel>(
                builder: (context, value, child) {
                   log(vm.BlogList.length.toString());
                  //  log(vm.BlogList.toList());
                   final data = vm.BlogList[index];
                  return   SingleBlog(content: data["content"], title: data["title"], image: data["image"], height: 130);
                }
                
               );
            })
        ],
        ),
      ),
    );
  }
}