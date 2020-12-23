import 'package:flutter/material.dart';
import 'package:graffe/screens/PatientDetail.dart';
import 'package:graffe/screens/doctorRegister.dart';
import 'package:graffe/screens/doctorhome.dart';
import 'package:graffe/screens/doctorlogin.dart';
import 'package:graffe/screens/welcomescreen.dart';
import '../screens/Patientprofile.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {

      case '/welcome':
        return MaterialPageRoute(builder: (_) => Welcomescreen());     

      case '/doctorRegister':
        if (args is String) {          
          return MaterialPageRoute(builder: (_) => DoctorRegister(data: args));
        }
        return _errorRoute();

      case '/doclogin':
        if (args is String) {
          return MaterialPageRoute(builder: (_) => Doctorlogin(data: args));
        }
        return _errorRoute();
      case '/dochome':
        if (args is String) {
          return MaterialPageRoute(builder: (_) => Doctorhome(data: args));
        }
        return _errorRoute();
      case '/patientdetail':
        if (args is String) {
          return MaterialPageRoute(builder: (_) => PatientDetail(data: args));
        }
        return _errorRoute();
      case '/patientprofile':
        if (args is String) {
          return MaterialPageRoute(builder: (_) => Patientprofile(data: args));
        }
        return _errorRoute();

      default:
        return _errorRoute();
        
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error: Critial routing error'),
        ),
        body: Center(
          child: Text('ERROR:Critial routing error'),
        ),
      );
    });
  }
}

