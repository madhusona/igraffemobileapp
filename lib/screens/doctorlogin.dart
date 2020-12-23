import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graffe/components/Buttonblue.dart';
import 'package:graffe/components/Logoimage.dart';
import 'package:graffe/components/iputpasscode.dart';
import 'package:graffe/screens/background.dart';

class Doctorlogin extends StatefulWidget{
  final String data;

  Doctorlogin({
    Key key,
    @required this.data,
  }) : super(key: key);
  
@override
  _DoctorloginState createState() => _DoctorloginState();
}

class _DoctorloginState extends State<Doctorlogin>{
  
  TextEditingController usepass = new TextEditingController();
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          LogoImage(width1: 0.20, height1: 0.20, size1: size),
          Container(
            child: Center(
              child: Text(
                'Welcome to iGraffe ' + widget.data,
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
          SizedBox(height: size.height * 0.03),          
          PasswordField(
            pswcontroller: usepass,
            onChanged: (value) {},
          ),
          SizedBox(height: size.height * 0.03),
          Buttonblue(
            text: "Login",
            textColor: Colors.white,
            press: () {
              Background().deluser();
              Navigator.of(context).pushNamed('/dochome', arguments: 'Doctor');
            },
          ),
        ])
        )
    );
  }
}