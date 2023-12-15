import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  String Buttonname;
  ButtonWidget({
    required this.Buttonname,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: 150,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(20)),
        child: TextButton(
            onPressed: () {},
            child: Text(
              Buttonname,
              style: TextStyle(color: Colors.black),
            )));
  }
}
