import 'package:flutter/material.dart';
import 'package:instaclone/core/short._widget.dart';
import 'package:instaclone/home_api/repo_api.dart';

import 'package:like_button/like_button.dart';

// ignore: must_be_immutable
class StoryViewWidget extends StatelessWidget {
  HomeIntialApi senddata;
  StoryViewWidget({super.key, required this.senddata});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: 740,
          decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: NetworkImage(senddata.post), fit: BoxFit.cover)),
        ),
        SafeArea(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(senddata.profil),
              backgroundColor: Colors.black,
            ),
            title: Text(
              senddata.name,
              style: const TextStyle(color: Colors.white),
            ),
            trailing: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.highlight_remove,
                  color: Colors.white,
                )),
          ),
        ),
        hight10,
        Positioned(
          bottom: 10,
          left: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20)),
                  height: 40,
                  width: 200,
                  child: const TextField(
                    decoration: InputDecoration(),
                  )),
              width10,
              const LikeButton(),
              width10,
              const Icon(
                Icons.send,
                color: Colors.black,
              )
            ],
          ),
        )
      ],
    ));
  }
}
