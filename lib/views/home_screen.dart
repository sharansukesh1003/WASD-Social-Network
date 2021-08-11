import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram_custom_ui/constants/constants.dart';
import 'package:flutter_instagram_custom_ui/data/data.dart';
import 'package:flutter_instagram_custom_ui/widgets/custom_drawer.dart';
import 'package:flutter_instagram_custom_ui/widgets/following_user.dart';
import 'package:flutter_instagram_custom_ui/widgets/post_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  //tab controller is required for instantiating a TabBar object.
  //_tabController.index provides the current index of the tab which,
  // can be used in the build method for dynamically rendering data.
  late TabController _tabController;
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  ConstantColors constantColors = ConstantColors();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constantColors.secondaryColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'WASD.',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorWeight: 3.0,
          labelColor: Colors.white,
          labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20.0,
          ),
          tabs: <Widget>[
            Tab(
              text: 'Feed',
            ),
            Tab(
              text: 'Trending',
            )
          ],
        ),
      ),
      drawer: CustomDrawer(),
      body: ListView(
        children: <Widget>[
          FollowingUser(),
          PostsCarousel(
            pageController: _pageController,
            title: 'Posts',
            posts: posts,
            size: 40.0,
          ),
        ],
      ),
    );
  }
}
