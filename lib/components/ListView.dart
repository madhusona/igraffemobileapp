import 'package:flutter/material.dart';

class ListView extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const ListView({
    this.title,
    Key key,
    this.subtitle,
    this.icon = Icons.person,
     }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}
