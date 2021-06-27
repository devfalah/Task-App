import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/helper/constance.dart';

class TodoCard extends StatelessWidget {
  final String? title;
  final bool isDone;
  final void Function(bool?)? onChanged;
  final void Function()? onLongPress;

  const TodoCard({
    this.title,
    required this.isDone,
    this.onChanged,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 8.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 20.0,
                height: 20.0,
                child: Checkbox(
                  activeColor: mainColor,
                  value: isDone,
                  onChanged: onChanged,
                ),
              ),
              SizedBox(width: 12),
              Text(
                title ?? "(Unnamed Todo)",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Color(0xFF211551),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: onLongPress,
            icon: Icon(
              FontAwesomeIcons.trash,
              color: mainColor,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }
}
