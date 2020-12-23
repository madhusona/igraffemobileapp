import 'package:flutter/material.dart';

import '../constants.dart';

class InputFieldRound extends StatefulWidget {

  final TextEditingController txtcontroller;
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const InputFieldRound({
    this.txtcontroller,
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,    
  }) : super(key: key);

@override
  __InputFieldRoundState createState() => __InputFieldRoundState();

}


class __InputFieldRoundState extends State<InputFieldRound>{

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
        maxLength: usercodelength,
        controller: widget.txtcontroller,
        onChanged: widget.onChanged,
        cursorColor: textboxcolor1,
        decoration: InputDecoration(
          icon: Icon(            
            widget.icon,
            color: textboxicon,
          ),
          hintText: widget.hintText,
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
