import 'package:flutter/material.dart';
import 'package:graffe/router/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(AppController());
}

//--------------------------------------------------------------------------------------------

class AppController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //print(Background().checkUser());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Graffe the mobile Doc',
      home: LoadingPage(), //  loading page
      theme: ThemeData(
        fontFamily: 'Quicksand',
        scaffoldBackgroundColor: Colors.brown[100],
      ),
      onGenerateRoute: Router.generateRoute,
    );
  }
}

//--------------------------------------------------------------------------------------------
// inital loading page for cheking user and loading aproprate pages
//
class LoadingPage extends StatefulWidget {
  LoadingPage({Key key}) : super(key: key);

  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  String exittxt = 'Press Back to exit';
  @override
  void initState() {
    super.initState();
    loadPage();    
  }

  loadPage() {
    getUserStatus().then((userStatus) {      
      if (userStatus == null) {
        Navigator.of(context).pushNamed('/welcome');
      } else {
        Navigator.of(context).pushNamed('/doclogin', arguments: userStatus);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: CircularProgressIndicator(),
        ),
        Text(
          exittxt,
          style: TextStyle(fontFamily: 'Quicksand', fontSize: 24),
        ),
      ],
    )));
  }
}
//--------------------------------------------------------------------------------------------
// get if the user is already logged in succesfully

Future<String> getUserStatus() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String userStatus = prefs.getString("igraffeuser");
  return userStatus;
}
