import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram_custom_ui/models/post_model.dart';

class PostsCarousel extends StatelessWidget {
  final PageController pageController;
  final String? title;
  final List<Post> posts;
  final double? size;
  PostsCarousel(
      {required this.pageController,
      required this.posts,
      this.title,
      this.size});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
          child: Text(
            title.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SizedBox(
            width: size,
            child: Divider(
              thickness: 3.0,
              color: Colors.deepPurpleAccent,
            ),
          ),
        ),
        Container(
          height: 400.0,
          child: PageView.builder(
              physics: BouncingScrollPhysics(),
              controller: pageController,
              itemCount: posts.length,
              itemBuilder: (BuildContext context, int index) {
                Post post = posts[
                    index]; //if the list is not null for sure then use bang[!] operator.
                return AnimatedBuilder(
                  animation: pageController,
                  builder: (BuildContext context, Widget? widget) {
                    double value = 1.0;
                    if (pageController.position.hasContentDimensions) {
                      //// the below function gives the distance of the page controller from the next and previous index
                      value = pageController.page! - index;
                      value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
                    }
                    return Center(
                      child: SizedBox(
                        height: Curves.easeInOut.transform(value) * 400,
                        child: widget,
                      ),
                    );
                  },
                  child: Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 2),
                                  blurRadius: 5.0)
                            ]),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image(
                            height: 400.0,
                            width: 300.0,
                            image: AssetImage(post.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 10.0,
                        right: 10.0,
                        bottom: 10.0,
                        child: Container(
                          padding: EdgeInsets.all(15.0),
                          height: 110.0,
                          decoration: BoxDecoration(
                            color: Colors.white54,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15.0),
                              bottomRight: Radius.circular(15.0),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                post.title,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(post.location,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16.0),
                                  overflow: TextOverflow.ellipsis),
                              SizedBox(height: 20.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      ),
                                      SizedBox(width: 5.0),
                                      Text(post.likes.toString(),
                                          style: TextStyle(fontSize: 16.0),
                                          overflow: TextOverflow.ellipsis)
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.comment,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      SizedBox(width: 5.0),
                                      Text(post.comments.toString(),
                                          style: TextStyle(fontSize: 16.0),
                                          overflow: TextOverflow.ellipsis)
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
