import 'package:flutter/material.dart';
import '../constants.dart';

class Header extends StatelessWidget {
  final String title, fontfamily;
  final Color color, textColor;
  final double fontsize;
  const Header(
      {Key key,
      this.title,
      this.color = docbarbk1,
      this.textColor = textcolor1,
      this.fontsize = 20,
      this.fontfamily = 'Quicksand'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(color: color),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: fontsize,
                fontFamily: fontfamily,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
