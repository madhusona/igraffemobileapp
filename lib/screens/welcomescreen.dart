import 'package:flutter/material.dart';
import 'package:graffe/components/Buttonblue.dart';
import 'package:graffe/components/Logoimage.dart';

class Welcomescreen extends StatelessWidget {
  const Welcomescreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
      child: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          LogoImage(width1: 0.35, height1: 0.35, size1: size),
          Text(
            'iGraffe\n',
            style: TextStyle(
                fontFamily: 'Courgette',
                fontWeight: FontWeight.bold,
                fontSize: 36),
          ),
          Center(
            child: Text(
              'Welcome ! lets setup your account,\n tell us who you are ?\n',
              style: TextStyle(fontFamily: 'Quicksand', fontSize: 24),
            ),
          ),
          Buttonblue(
            text: "Doctor",
            textColor: Colors.white,
            press: () {
              Navigator.of(context)
                  .pushNamed('/doctorRegister', arguments: 'Doctor');
            },
          ),
          SizedBox(height: size.height * .05),
          Buttonblue(
            text: "Patient",
            textColor: Colors.white,
            press: () {
              Navigator.of(context).pushNamed('/patientdetail',arguments:'check');
            },
          ),
        ],
      )),
    ));
  }
}
