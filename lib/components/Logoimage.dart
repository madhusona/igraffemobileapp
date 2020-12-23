import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  final double width1;
  final double height1;
  const LogoImage({
    Key key,
    this.height1, 
    this.width1, this.size1,        
  }) : super(key: key);

  final Size size1;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Image(
      image: AssetImage('assets/images/grafee5.png'),
      width: size1.width * width1,
      height: size1.height * height1,
    ));
  }
}
