import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;

  const CustomButton({Key? key, this.onTap, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 300,
        height: 55,
        decoration: BoxDecoration(
          color: Color(0xffFD8C00),
          borderRadius: BorderRadius.circular(100.0),
          border: Border.all(
            width: 1,
            color: Color(0xff89898),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
