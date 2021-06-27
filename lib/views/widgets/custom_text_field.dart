import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final String hintText;
  final IconData iconData;

  const CustomTextFiled({
    Key? key,
    this.validator,
    this.onSaved,
    required this.hintText,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 55,
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(100.0),
        border: Border.all(
          width: 1,
          color: Color(0xff89898),
        ),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: "$hintText",
          hintStyle: TextStyle(
            fontSize: 16,
            color: Color(0xff767676),
          ),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
          suffixIcon: Icon(iconData),
        ),
        onSaved: onSaved,
        validator: validator,
      ),
    );
  }
}
