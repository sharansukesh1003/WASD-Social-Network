import 'package:flutter/material.dart';
import 'package:flutter_instagram_custom_ui/data/data.dart';
import 'package:flutter_instagram_custom_ui/models/user_model';

class FollowingUser extends StatelessWidget {
  const FollowingUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
          child: Text(
            'Following',
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
            width: 70.0,
            child: Divider(
              thickness: 3.0,
              color: Colors.deepPurpleAccent,
            ),
          ),
        ),
        Container(
          height: 80.0,
          child: ListView.builder(
              padding: EdgeInsets.only(left: 10.0),
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                User user = users[index];
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 3, color: Colors.deepPurpleAccent),
                        shape: BoxShape.circle),
                    height: 60.0,
                    width: 60.0,
                    margin: EdgeInsets.all(10.0),
                    child: ClipOval(
                      child: Image(
                        height: 60.0,
                        width: 60.0,
                        fit: BoxFit.cover,
                        image: AssetImage(
                          user.profileImageUrl.toString(),
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
