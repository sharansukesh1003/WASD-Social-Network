import 'package:flutter/material.dart';
import 'package:flutter_instagram_custom_ui/constants/constants.dart';
import 'package:flutter_instagram_custom_ui/data/data.dart';
import 'package:flutter_instagram_custom_ui/views/home_screen.dart';
import 'package:flutter_instagram_custom_ui/views/login_screen.dart';
import 'package:flutter_instagram_custom_ui/views/profile_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerOption(Icon icon, String title, void Function() onTap) {
      return ListTile(
          leading: icon,
          title: Text(
            title,
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),
          onTap: onTap);
    }

    ConstantColors constantColors = ConstantColors();
    return Drawer(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: constantColors.secondaryColor,
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                Image(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: double.infinity,
                  image: AssetImage(
                    currentUser.backgroundImageUrl.toString(),
                  ),
                  fit: BoxFit.cover,
                ),
                Positioned(
                    left: 25.0,
                    top: MediaQuery.of(context).size.height * 0.20,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          height: 100.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 3.0, color: Colors.white),
                          ),
                          child: ClipOval(
                            child: Image(
                              image: AssetImage(
                                currentUser.profileImageUrl.toString(),
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            currentUser.name.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ))
              ],
            ),
            _buildDrawerOption(
              Icon(
                Icons.dashboard,
                color: Colors.white,
              ),
              'Home',
              () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => HomeScreen(),
                ),
              ),
            ),
            _buildDrawerOption(
                Icon(Icons.chat, color: Colors.white), 'Chat', () {}),
            _buildDrawerOption(Icon(Icons.location_on, color: Colors.white),
                'Location', () {}),
            _buildDrawerOption(
              Icon(Icons.account_circle, color: Colors.white),
              'Your Profile',
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProfileScreen(
                    user: currentUser,
                  ),
                ),
              ),
            ),
            _buildDrawerOption(
                Icon(Icons.settings, color: Colors.white), 'Settings', () {}),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: _buildDrawerOption(
                  Icon(Icons.logout, color: Colors.white),
                  'Logout',
                  () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => LoginScreen(),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
