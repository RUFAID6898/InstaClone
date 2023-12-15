import 'package:flutter/material.dart';

// ignore: must_be_immutable
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
              style: const TextStyle(color: Colors.black),
            )));
  }
}
