import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import '../components/Header.dart';
import '../components/nav.dart';
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
            backgroundColor: docbarbk1,
            body: Center(
              child: Column(
                children: <Widget>[
                  Header(
                      title:'Dr First name'
                  ),
                  nav(
                    left:'Back',
                    right:'Patient Profile',
                    onPressed: () {
                      Navigator.of(context).pop();
                    },

                    visible: false,
                  ),
                  _comm(),
                  _reports(),
                  _address(),


                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}

class _comm extends StatelessWidget {
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
              color: buttonColor1,
            ),
            padding: EdgeInsets.all(15.0),
            shape: CircleBorder(
                side: BorderSide(color: buttonColor1)

            )
          ),
          RawMaterialButton(
            onPressed: () {},
            elevation: 2.0,
            fillColor: Colors.white,
            child: Icon(
              Icons.call,
              size: 35.0,
              color: buttonColor1,
            ),
            padding: EdgeInsets.all(15.0),
            shape: CircleBorder(
                side: BorderSide(color: buttonColor1)
            ),
          ),
          RawMaterialButton(
            onPressed: () {},
            elevation: 2.0,
            fillColor: Colors.white,
            child: Icon(
              Icons.message,
              size: 35.0,
              color: buttonColor1,
            ),
            padding: EdgeInsets.all(15.0),
            shape: CircleBorder(
                side: BorderSide(color: buttonColor1)
            ),
          )
        ],
      ),
    );
  }
}

class _address extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
   child: Card(
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       mainAxisAlignment: MainAxisAlignment.center,
       children: <Widget>[
         ListTile(
           title: const Text('Contact Details'),
           subtitle: Text(
             'Personal Details',
             style: TextStyle(color: Colors.black.withOpacity(0.6)),
           ),
         ),
         Divider(),
         ListTile(
           title: const Text('Contact Details'),
         ),

         Divider(),
         ListTile(
           title: const Text('Contact Details'),
         ),
         Divider(),
         ListTile(
           title: const Text('Contact Details'),
         ),
         Divider(),

       ],
     ),
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
             // color: Colors.blue,
              textColor: buttonColor1,
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
             // color: Colors.blue,
              textColor: buttonColor1,
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
