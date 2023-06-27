import 'package:flutter/material.dart';
import 'package:news_and_blogs/view/screen/homescreen.dart';
import 'package:provider/provider.dart';
import 'model/newsblogs_view_model.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
         ChangeNotifierProvider(create: ((context) => NewsblogsViewModel())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter demo',
        theme: ThemeData(
         useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
         home: Home_screen(
          
        )
      ));
    
  }
}