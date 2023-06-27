import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import '../../constants/common.dart/colors.dart';
import '../../model/newsblogs_view_model.dart';
import '../widget/blog_details.dart';

class Blog_details extends StatefulWidget {
  final int blogId;
   Blog_details({super.key,required this.blogId});

  @override
  State<Blog_details> createState() => _Blog_detailsState();
}

class _Blog_detailsState extends State<Blog_details> {
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
   Provider.of<NewsblogsViewModel>(context,listen: false).fetchBlogDetailsByBlogId(widget.blogId);
   setState(() {
     
   });
  }
  @override
  Widget build(BuildContext context) {
      final vm = Provider.of<NewsblogsViewModel>(context,listen: false);

    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(50), child: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,)),
      body: vm.blogdetails==null?const Center(child:  CircularProgressIndicator(),): SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                            
               Consumer<NewsblogsViewModel>(
                builder: (context, value, child) {
                  Map<String,dynamic> data = value.blogdetails!['blog'];
                  return                  SingleBlog(content:data["content"], title: data["title"], image: data['image'], height: 200,updatedAt: data['created_at'],);

                })
        ],),
      ),
    );
  }
}