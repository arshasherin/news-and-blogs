import 'dart:developer';
import 'package:flutter/material.dart';
import '../services/newsblogs_services.dart';
import '../view/widget/model_tab.dart';

class NewsblogsViewModel extends ChangeNotifier {
  Webservice webservice = Webservice();
  int currentIndex = 0;
  int _currentPage = 0;
  int get currentPage => _currentPage;
  Map<String, dynamic>? cateData;
  Map<String, dynamic>? blogData;
  Map<String,dynamic>? blogdetails;

  List blogCategory = [];
  List BlogList =[];
  List<Widget> myTabs = [];

  get blog {
    return cateData;
  }

  setCurrentPage(int val) {
    _currentPage = val;
    notifyListeners();
  }

  fetchBlogCategory() async {
    cateData = await webservice.fetchBlogCategory();
    if (cateData!["status"] == true) {
      blogCategory = cateData!["blogs_category"];
      log("Total BlogCategory : ${blogCategory.length}");
      for (int i = 0; i < blogCategory.length; i++) {
        log("working");
        log(blogCategory[i]['name']);
        // print(model.category[i].name);
        My_Tab tab = My_Tab(
          tabName: blogCategory[i]["name"],
        );

        myTabs.add(tab);
      }
    } else {
      log("error while geting data from ......");
    }
    notifyListeners();
  }

  fetchBlogDataByCategory({required int id})async{
   blogData = await webservice.fetchBlogByCategory(id: id);
    if(blogData!=null){
      BlogList = blogData!['results'];
      
    }else{
      log("null list");
    }
    notifyListeners();
  }

   fetchBlogDetailsByBlogId(int blogId)async{
   blogdetails = await webservice.fetchBlogDetailsById(blogId);
   if(blogdetails!["status"]==true){
       
     return blogdetails;
    }else{
    log("error while fetching blog details");
   }
    notifyListeners();

   }
}