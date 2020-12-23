import 'package:shared_preferences/shared_preferences.dart';

class Background {

  //  function to get the user details if already logged in inthe same device
  getUser() async {
    SharedPreferences prefs;
    String graffeid = prefs.getString("igraffeuser");
    return graffeid;
  }

  //  function to set the user details if already logged in inthe same device
  setUser(String graffeid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("igraffeuser", graffeid);
  }

  // function to delte user preferances
  deluser() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("igraffeuser");
  }
  
}
