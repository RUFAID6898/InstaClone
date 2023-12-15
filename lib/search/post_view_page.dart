import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instaclone/core/short._widget.dart';
import 'package:instaclone/home/widgets/post_save_widget.dart';
import 'package:instaclone/home_api/repo_api.dart';

import 'package:like_button/like_button.dart';

// ignore: must_be_immutable
class SearchPost extends StatelessWidget {
  HomeIntialApi sendpost;

  SearchPost({
    required this.sendpost,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
          children: List.generate(
              7,
              (index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(sendpost.profil),
                          radius: 25,
                        ),
                        title: Text(sendpost.name),
                        trailing: const Icon(Icons.more_horiz_rounded),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: double.infinity,
                        height: 350,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            image: DecorationImage(
                                image: NetworkImage(sendpost.post),
                                fit: BoxFit.cover)),
                      ),
                      hight10,
                      Row(children: [
                        const SizedBox(
                          width: 7,
                        ),
                        const LikeButton(
                          circleSize: 10,
                        ),
                        width10,
                        const Icon(
                          Icons.chat_bubble_outline,
                          size: 30,
                        ),
                        width10,
                        IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(30),
                                          topLeft: Radius.circular(30))),
                                  height: 500,
                                  child: ListView(
                                    children: [
                                      hight20,
                                      const CupertinoTextField(
                                        cursorWidth: 1.0,
                                        suffix: Icon(Icons.people_outlined),
                                        prefix: Icon(Icons.search),
                                        placeholder: 'Search',
                                      ),
                                      Column(
                                          children: List.generate(
                                              10,
                                              (index) => ListTile(
                                                    leading: CircleAvatar(
                                                      backgroundImage:
                                                          NetworkImage(
                                                              sendpost.profil),
                                                    ),
                                                    title: Text(sendpost.name),
                                                    trailing:
                                                        const Icon(Icons.send),
                                                  )))
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.send,
                            size: 30,
                          ),
                        ),
                        const SizedBox(
                          width: 200,
                        ),
                        IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SavedWidget(
                                  image: sendpost.post,
                                );
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.bookmark_border_outlined,
                            size: 30,
                          ),
                        )
                      ]),
                      Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${sendpost.liks.toString()} Liks",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(sendpost.tags),
                            Text("${sendpost.comments.toString()}  commets")
                          ],
                        ),
                      ),
                    ],
                  ))),
    );
  }
}
