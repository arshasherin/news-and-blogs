import 'dart:developer';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:news_and_blogs/constants/url.dart';
import 'package:news_and_blogs/services/newsblogs_services.dart';
import 'package:provider/provider.dart';
import '../../constants/sample_data.dart';
import '../../model/newsblogs_view_model.dart';
import '../screen/blog_screen.dart';
import '../screen/read_more.dart';
import 'blog_details.dart';

class LatestNewsContainer extends StatefulWidget {
  final int id;
  const LatestNewsContainer({super.key, required this.id});

  @override
  State<LatestNewsContainer> createState() => _LatestNewsContainerState();
}

class _LatestNewsContainerState extends State<LatestNewsContainer> {
  @override
  void initState() {
    // TODO: implement  initState(){
    // TODO: implement initState
    super.initState();
    final vm = Provider.of<NewsblogsViewModel>(context, listen: false);
    vm.fetchBlogDataByCategory(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsblogsViewModel>(context, listen: false);

    log('blog list: ${vm.BlogList.length}');
    return vm.BlogList == null
        ? const CircularProgressIndicator()
        : SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 200,
                  child: Stack(
                    children: [
                      PageView.builder(
                        onPageChanged: (val) {
                          vm.setCurrentPage(val);
                        },
                        itemCount: 2,
                        itemBuilder: (_, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 0),
                            child: ClipRRect(
                              child: Hero(
                                tag: index,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    child: Image.network(
                                      carosi[index],
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: DotsIndicator(
                              dotsCount: carosi.length,
                              position: vm.currentPage.toDouble(),
                              decorator: const DotsDecorator(
                                activeColor: Color.fromARGB(255, 102, 231, 205),
                                color: Color.fromARGB(255, 207, 207, 207),
                                size: const Size.square(7.0),
                                activeSize: const Size(10.0, 6.0),
                                activeShape: CircleBorder(),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "🔥Latest News",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => Read_more(
                                            id: widget.id,
                                          )));
                            },
                            child: const Text(
                              "Read More",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: vm.BlogList.length,
                    itemBuilder: (ctx, index) {
                      final data = vm.BlogList[index];
                      log("datacount--" + vm.BlogList[index].toString());
                      log(
                        "message==" + imageUrl + data["image"],
                      );
                      // print("news and vlogs==="+ValueKey.length.toString());
                      return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Blog_details(
                                          blogId: data['id'],
                                        )));
                          },
                          child: SingleBlog(
                            title: data["title"],
                            content: data['content'],
                            image: imageUrl + data["image"],
                            height: 130,
                          ));
                    })
              ],
            ),
          );
  }
}
