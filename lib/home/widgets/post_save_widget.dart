import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SavedWidget extends StatelessWidget {
  String image;
  SavedWidget({
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30))),
      child: Column(
        children: [
          Container(
            height: 100,
            color: const Color.fromARGB(221, 83, 82, 82),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Container(
                  height: 100,
                  width: 70,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(image), fit: BoxFit.cover),
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20)),
                ),
                title: const Text(
                  "Saved",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  "Private",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                trailing: const Icon(
                  Icons.bookmark,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
