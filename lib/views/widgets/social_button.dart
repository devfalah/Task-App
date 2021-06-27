import 'package:flutter/material.dart';

class SocialIconButton extends StatelessWidget {
  final void Function()? onTap;
  final IconData iconData;
  final Color? color;
  const SocialIconButton(
      {required this.onTap, required this.iconData, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap!,
      child: CircleAvatar(
        radius: 25.0,
        backgroundColor: Colors.white,
        child: Icon(iconData, color: color),
      ),
    );
  }
}
