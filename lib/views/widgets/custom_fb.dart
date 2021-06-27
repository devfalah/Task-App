import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final void Function()? onTap;

  const CustomFloatingActionButton({
    required this.icon,
    required this.color,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
      onTap: onTap,
    );
  }
}
