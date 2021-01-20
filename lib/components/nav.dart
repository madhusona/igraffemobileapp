import 'package:flutter/material.dart';
import '../constants.dart';

class nav extends StatelessWidget {
  final String left, right;
  final VoidCallback onPressed, onPressed1;
  final bool visible;

  const nav(
      {Key key,
      this.left,
      this.right,
      this.onPressed,
      this.onPressed1,
      this.visible})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: docbarbk,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FlatButton(
              color: docbarbk,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(4.0),
              splashColor: docbarbk1,
              onPressed: onPressed,
              child: Row(
                children: <Widget>[
                  Icon(Icons.arrow_back),
                  Text(
                    left,
                    style: TextStyle(fontSize: 20.0,fontFamily: 'Quicksand'),
                  ),
                ],
              )),
          Visibility(
            visible: visible,
            child: FlatButton(
                color: docbarbk,
                textColor: Colors.white,
                //disabledColor: Colors.grey,
                //disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: docbarbk1,
                onPressed: onPressed1,
                child: Row(
                  children: <Widget>[
                    Text(
                      right,
                      style: TextStyle(fontSize: 20.0,fontFamily: 'Quicksand'),
                    ),
                    Icon(Icons.arrow_forward),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
