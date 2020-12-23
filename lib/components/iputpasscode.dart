import 'package:flutter/material.dart';

import '../constants.dart';
class PasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController pswcontroller;

  const PasswordField({
    Key key,
    this.onChanged,
    this.pswcontroller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextField(
        keyboardType: TextInputType.number,
        controller: pswcontroller,
        obscureText: true,
        maxLength: passcodelength,
        onChanged: onChanged,
        cursorColor: textboxcolor1,
        decoration: InputDecoration(
          hintText: "Pass code",
          icon: Icon(
            Icons.lock,
            color: textboxicon,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: textboxicon,
          ),
          border: InputBorder.none,
        ),
        style: TextStyle(
          color: textboxtextcolor,
          fontSize: 20.0,
          fontFamily: 'Quicksand', 
        ),
      ),
    );
  }
}