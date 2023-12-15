import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instaclone/core/short._widget.dart';
import 'package:instaclone/home_api/repo_api.dart';
// import 'package:instagram/core/short._widget.dart';
// import 'package:instagram/home_api/repo_api.dart';
import 'package:like_button/like_button.dart';

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
              style: TextStyle(color: Colors.white),
            ),
            trailing: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
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
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20)),
                  height: 40,
                  width: 200,
                  child: TextField(
                    decoration: InputDecoration(),
                  )),
              width10,
              LikeButton(),
              width10,
              Icon(
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
