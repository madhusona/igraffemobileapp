import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';

class Patientprofile extends StatelessWidget {
  final String data;
  const Patientprofile({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: Colors.white,

        ),
    child: Theme(
    data: Theme.of(context).copyWith(
    //accentColor: const Color(0xFFFCB69F).withOpacity(0.2),
    accentColor: docbarbk,
    ),
       child: SafeArea(
           child: Scaffold(
               backgroundColor: Colors.transparent,
               appBar: AppBar(
                 title: Text("Doctor Name")
               ),
               body:Center(
                   child: Column(
                     children: <Widget>[
                       _Header(),
                       _nav(),
                       _reports(),
                     ],
                   )
               )

           )
       )
    ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              'Doctor Name',
              textAlign: TextAlign.left,
              style: GoogleFonts.architectsDaughter(
                fontSize: 26,
                color: const Color(0xFFB96320),
                fontWeight: FontWeight.bold,
              ),
            ),


          ),
          Container(
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://4.img-dpreview.com/files/p/E~C667x0S5333x4000T1200x900~articles/3925134721/0266554465.jpeg'),
            )
          )

        ],
      ),

    );
  }
}

class _nav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RawMaterialButton(
            onPressed: () {},
            elevation: 2.0,
            fillColor: Colors.white,
            child: Icon(
              Icons.edit,
              size: 35.0,
            ),
            padding: EdgeInsets.all(15.0),
            shape: CircleBorder(),
          ),
          RawMaterialButton(
            onPressed: () {},
            elevation: 2.0,
            fillColor: Colors.redAccent,
            child: Icon(
              Icons.call,
              size: 35.0,
            ),
            padding: EdgeInsets.all(15.0),
            shape: CircleBorder(),
          ),
          RawMaterialButton(
            onPressed: () {},
            elevation: 2.0,
            fillColor: Colors.redAccent,
            child: Icon(
              Icons.message,
              size: 35.0,
            ),
            padding: EdgeInsets.all(15.0),
            shape: CircleBorder(),
          ),
        ],
      ),
    );
  }
}

class _reports extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(4.0),
              splashColor: Colors.blueAccent,

              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Row(
                children: <Widget>[

                  Text(
                    "Medical Reports",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Icon(Icons.assignment),
                ],
              )

          ),
          FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              onPressed: () {
                Navigator.of(context).pushNamed('/patientprofile',arguments:"checking");
              },
              child: Row(
                children: <Widget>[

                  Text(
                    "Appointment",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Icon(Icons.content_paste),
                ],
              )
          )
        ],
      ),
    );
  }
}
