import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instaclone/core/short._widget.dart';
import 'package:instaclone/home/followers_account_page.dart';
import 'package:instaclone/home/widgets/post_save_widget.dart';
import 'package:instaclone/home_api/intagration_api.dart';
import 'package:instaclone/home_api/repo_api.dart';

import 'package:like_button/like_button.dart';

class HomepostWidget extends StatefulWidget {
  const HomepostWidget({
    super.key,
  });

  @override
  State<HomepostWidget> createState() => _HomepostWidgetState();
}

class _HomepostWidgetState extends State<HomepostWidget> {
  late Future<List<HomeIntialApi>> getdata;
  @override
  void initState() {
    super.initState();
    getdata = HomeIntagrationApi().gethomeitems();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getdata,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData && snapshot.data != null) {
            return Column(
              children: List.generate(
                  snapshot.data!.length,
                  (index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FollowersAccountPage(
                                        followersdata: snapshot.data![index]),
                                  ));
                            },
                            leading: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(snapshot.data![index].profil),
                              radius: 25,
                            ),
                            title: Text(snapshot.data![index].name),
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
                                    image: NetworkImage(
                                        snapshot.data![index].post),
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
                                                                  snapshot
                                                                      .data![
                                                                          index]
                                                                      .profil),
                                                        ),
                                                        title: Text(snapshot
                                                            .data![index].name),
                                                        trailing: const Icon(
                                                            Icons.send),
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
                                      image: snapshot.data![index].post,
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
                                  "${snapshot.data![index].liks.toString()} Liks",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(snapshot.data![index].tags),
                                Text(
                                    "${snapshot.data![index].comments.toString()}  commets")
                              ],
                            ),
                          ),
                        ],
                      )),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return const Text('No Dta');
          }
        });
  }
}
