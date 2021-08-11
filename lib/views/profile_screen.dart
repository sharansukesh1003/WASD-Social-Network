import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram_custom_ui/constants/constants.dart';
import 'package:flutter_instagram_custom_ui/models/post_model.dart';
import 'package:flutter_instagram_custom_ui/models/user_model';
import 'package:flutter_instagram_custom_ui/widgets/custom_drawer.dart';
import 'package:flutter_instagram_custom_ui/widgets/post_carousel.dart';
import 'package:flutter_instagram_custom_ui/widgets/profile_clipper.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({this.user});
  final User? user;
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late PageController _yourPostPageController;
  late PageController _favouritesPageController;

  @override
  void initState() {
    super.initState();
    _yourPostPageController =
        PageController(initialPage: 0, viewportFraction: 0.8);
    _favouritesPageController =
        PageController(initialPage: 0, viewportFraction: 0.8);
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ConstantColors constantColors = ConstantColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constantColors.secondaryColor,
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                ClipPath(
                  clipper: ProfileClipper(),
                  child: Image(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: double.infinity,
                    image: AssetImage(
                      widget.user!.backgroundImageUrl.toString(),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  child: IconButton(
                    icon: Icon(Icons.menu),
                    iconSize: 30.0,
                    color: Colors.white,
                    onPressed: () => _scaffoldKey.currentState!.openDrawer(),
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  child: Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black45,
                            offset: Offset(0, 2),
                            blurRadius: 5.0),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        widget.user!.profileImageUrl.toString(),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: Text(
                widget.user!.name.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: [
                    Text(
                      'Followers',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      widget.user!.followers.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Following',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      widget.user!.following.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            PostsCarousel(
                pageController: _yourPostPageController,
                title: 'Your Posts',
                size: 80.0,
                posts: [
                  Post(
                      imageUrl: 'assets/images/post0.jpg',
                      author: User(),
                      title: 'Game-Title',
                      location: 'Caption',
                      likes: 102,
                      comments: 37),
                  Post(
                    imageUrl: 'assets/images/post1.jpg',
                    author: User(),
                    title: 'Game-Title',
                    location: 'Caption',
                    likes: 532,
                    comments: 129,
                  ),
                  Post(
                    imageUrl: 'assets/images/post2.jpg',
                    author: User(),
                    title: 'Game-Title',
                    location: 'Caption',
                    likes: 985,
                    comments: 213,
                  )
                ]),
            PostsCarousel(
              pageController: _favouritesPageController,
              title: 'Favourites',
              size: 80.0,
              posts: [
                Post(
                  imageUrl: 'assets/images/post3.jpg',
                  author: User(),
                  title: 'Game-Title',
                  location: 'Caption',
                  likes: 402,
                  comments: 25,
                ),
                Post(
                  imageUrl: 'assets/images/post4.jpg',
                  author: User(),
                  title: 'Game-Title',
                  location: 'Caption',
                  likes: 628,
                  comments: 74,
                ),
                Post(
                  imageUrl: 'assets/images/post5.jpg',
                  author: User(),
                  title: 'Game-Title',
                  location: 'Caption',
                  likes: 299,
                  comments: 28,
                )
              ], //// Type Casting as Post
            ),
            SizedBox(
              height: 50.0,
            )
          ],
        ),
      ),
    );
  }
}
