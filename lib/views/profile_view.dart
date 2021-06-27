import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tasks/core/controllers/auth_controller.dart';
import 'package:tasks/helper/cache_helper.dart';
import 'package:tasks/helper/constance.dart';

import 'widgets/profile_list_item.dart';

class ProfileView extends StatelessWidget {
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ThemeSwitcher(
      builder: (BuildContext context) => Scaffold(
        body: Column(
          children: [
            SizedBox(height: size.height * .05),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back)),
                  profileInfo(size),
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0, top: 9.0),
                    child: themeSwitcher(),
                  )
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: Column(
                children: <Widget>[
                  ProfileListItem(
                    icon: FontAwesomeIcons.edit,
                    text: 'Edit Name',
                  ),
                  ProfileListItem(
                    icon: FontAwesomeIcons.github,
                    text: 'Github Repo',
                  ),
                  ProfileListItem(
                    icon: FontAwesomeIcons.peopleArrows,
                    text: 'Help & Support',
                  ),
                  ProfileListItem(
                    icon: FontAwesomeIcons.signOutAlt,
                    text: 'Logout',
                    hasNavigation: false,
                    onTap: () {
                      controller.signOut();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget profileInfo(Size size) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * .08),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              controller.user!.photoURL ?? personPlaceholderImage,
            ),
            radius: 80.0,
          ),
          SizedBox(height: 10.0),
          Text(
            controller.user!.displayName ?? "Name",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            controller.user!.email!,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget themeSwitcher() => ThemeSwitcher(
        builder: (context) {
          return AnimatedCrossFade(
            duration: Duration(milliseconds: 300),
            crossFadeState:
                ThemeProvider.of(context)!.brightness == Brightness.dark
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
            firstChild: GestureDetector(
              onTap: () {
                ThemeSwitcher.of(context)!.changeTheme(
                  theme: kLightTheme,
                  reverseAnimation: true,
                );
                CacheHelper.putData(key: "isDark", value: false);
              },
              child: Icon(
                Icons.wb_sunny_outlined,
              ),
            ),
            secondChild: GestureDetector(
              onTap: () {
                ThemeSwitcher.of(context)!.changeTheme(theme: kDarkTheme);
                CacheHelper.putData(key: "isDark", value: true);
              },
              child: Icon(
                Icons.wb_sunny,
              ),
            ),
          );
        },
      );
}
