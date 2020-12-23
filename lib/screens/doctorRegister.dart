import 'package:flutter/material.dart';
import 'package:graffe/components/Buttonblue.dart';
import 'package:graffe/components/Inputround.dart';
import 'package:graffe/components/Logoimage.dart';
import 'package:graffe/components/iputpasscode.dart';
import 'package:graffe/screens/background.dart';

class DoctorRegister extends StatefulWidget {
  DoctorRegister({Key key, this.data}) : super(key: key);
  final String data;
  @override
  __DoctorRegisterState createState() => __DoctorRegisterState();
}

class __DoctorRegisterState extends State<DoctorRegister> {
  TextEditingController userid = new TextEditingController();
  TextEditingController usepass = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          LogoImage(width1: 0.20, height1: 0.20, size1: size),
          Container(
            child: Text(
              'Welcome to iGraffe ' + widget.data,
              style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          SizedBox(height: size.height * 0.03),
          InputFieldRound(
            hintText: "Phone Number",
            txtcontroller: userid,            
            onChanged: (value) {},
          ),
          PasswordField(
            pswcontroller: usepass,
            onChanged: (value) {},
          ),
          SizedBox(height: size.height * 0.03),
          Buttonblue(
            text: "Login",
            textColor: Colors.white,
            press: () {
              //print(userid.text);
              //print(usepass.text);
              Background().setUser(userid.text);
              Navigator.of(context)
                  .pushNamed('/dochome', arguments: 'Doctor');
            },
          ),
          Container(
            child: Text(
              'Forgot passcode ?',
              style: TextStyle(
                  color: Color(0xFF34338a),
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          SizedBox(height: size.height * 0.05),
          Container(
            child: Text(
              'New User Registration',
              style: TextStyle(
                  color: Color(0xFF34338a),
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
        ],
      ),
    )));
  }
}
