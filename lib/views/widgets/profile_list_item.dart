import 'package:flutter/material.dart';

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool hasNavigation;
  final void Function()? onTap;

  const ProfileListItem({
    required this.icon,
    required this.text,
    this.onTap,
    this.hasNavigation = true,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size.height * 0.08,
        margin: EdgeInsets.symmetric(
          horizontal: 30.0,
        ).copyWith(
          bottom: 15,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Theme.of(context).backgroundColor,
        ),
        child: Row(
          children: <Widget>[
            Icon(
              this.icon,
            ),
            SizedBox(width: 20),
            Text(
              this.text,
            ),
            Spacer(),
            if (this.hasNavigation)
              Icon(
                Icons.arrow_right,
              ),
          ],
        ),
      ),
    );
  }
}
