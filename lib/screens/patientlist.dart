import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../modal/patient.dart';

class Patientlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Patient>>(
      future:_fetchpatients(),
      builder: (context,snapshot){
        if(snapshot.hasData){
          List<Patient> data = snapshot.data;
       //   return _patientsListView(data);
        }
      },

    );
  }
}


Future<List<Patient>> _fetchpatients() async {

  final patientsListAPIUrl = 'https://jsonplaceholder.typicode.com/posts';
  final response = await http.get(patientsListAPIUrl);

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((job) => new Patient.fromJson(job)).toList();
  } else {
    throw Exception('Failed to load jobs from API');
  }
}