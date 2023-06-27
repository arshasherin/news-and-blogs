import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../constants/url.dart';

class SingleBlog extends StatelessWidget {
  final String title, content, image, updatedAt;
  final double height;
  const SingleBlog(
      {super.key,
      required this.content,
      required this.title,
      required this.image,
      required this.height,
      this.updatedAt = ""});
  erro() {
    return const Text("Error");
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: NetworkImage('$imageUrl$image'),
                    fit: BoxFit.fitWidth,
                    onError: (exception, stackTrace) {
                      return erro();
                    },
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                  ),
                  if (height == 200)
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20,bottom: 20),
                        child: Text(updatedAt,style: TextStyle(color: Colors.green),),
                      ),
                    ),
                  Text(
                    content,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}