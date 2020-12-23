import 'package:flutter/material.dart';
import '../constants.dart';
import 'PatientListHome.dart';
class Doctorhome extends StatelessWidget {
final String data;

  const Doctorhome({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
        length: choices.length,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(
              color: buttonColor1, //change your color here
            ),
            title: const Text('Dr. Firstname',style: TextStyle(
              color: textboxcolor1,
            ),),

            elevation: 0,

            bottom: TabBar(
                unselectedLabelColor: textboxcolor1,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: docbarbk,
                borderRadius: BorderRadius.circular(50),
              ),

              tabs: [
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: textboxcolor1, width: 1)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Patient List"),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: textboxcolor1, width: 1)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Appointment"),
                    ),
                  ),
                )
              ]
            ),
          ),
          body: TabBarView(
           children:[
             PatientListHome(),
             PatientListHome(),

           ]
          ),
        ),
      );
  }
}

class Choice {
  final String title;
  final IconData icon;
  const Choice({this.title, this.icon});
}

const List<Choice> choices = <Choice>[
  Choice(title: 'Patient List', icon: Icons.person),
  Choice(title: 'Appointments', icon: Icons.supervisor_account),

];

class ChoicePage extends StatelessWidget {
  const ChoicePage({Key key, this.choice}) : super(key: key);
  final Choice choice;




  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Container(
      color: Colors.white,
      child: Center(
       // child: PatientListHome()
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[


          ],
        ),



      ),
    );
  }
}