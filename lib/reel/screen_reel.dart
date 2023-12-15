import 'package:flutter/material.dart';
import 'package:instaclone/home/followers_account_page.dart';
import 'package:instaclone/home_api/intagration_api.dart';
import 'package:instaclone/home_api/repo_api.dart';

import 'package:like_button/like_button.dart';

class ScreenReels extends StatefulWidget {
  const ScreenReels({Key? key}) : super(key: key);

  @override
  State<ScreenReels> createState() => _ScreenReelsState();
}

class _ScreenReelsState extends State<ScreenReels> {
  late Future<List<HomeIntialApi>> getdata;

  @override
  void initState() {
    super.initState();

    getdata = HomeIntagrationApi().gethomeitems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getdata,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return PageView.builder(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Container(
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          image: DecorationImage(
                              image: NetworkImage(snapshot.data![index].post),
                              fit: BoxFit.cover),
                        ),
                      ),
                      const Positioned(
                        top: 20,
                        left: 10,
                        child: Text(
                          'Reels',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 20,
                        child: Column(
                          children: [
                            const LikeButton(
                              size: 30,
                            ),
                            Text(
                              '${snapshot.data![index].liks} likes',
                              style: const TextStyle(color: Colors.white),
                            ),
                            const SizedBox(height: 20),
                            const Icon(
                              Icons.comment_outlined,
                              size: 30,
                              color: Colors.white,
                            ),
                            Text(
                              '${snapshot.data![index].comments} Comt',
                              style: const TextStyle(color: Colors.white),
                            ),
                            const SizedBox(height: 20),
                            const Icon(
                              Icons.send,
                              size: 30,
                              color: Colors.white,
                            ),
                            Text(
                              '${snapshot.data![index].liks}Share',
                              style: const TextStyle(color: Colors.white),
                            ),
                            const SizedBox(height: 20),
                            const Icon(
                              Icons.more_horiz_sharp,
                              size: 30,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 10,
                        bottom: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          FollowersAccountPage(
                                              followersdata:
                                                  snapshot.data![index]),
                                    ));
                              },
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        snapshot.data![index].profil),
                                    radius: 25,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    snapshot.data![index].name,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  OutlinedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.transparent),
                                    ),
                                    onPressed: () {},
                                    child: const Text(
                                      'Follow',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              snapshot.data![index].tags,
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              "${snapshot.data![index].comments.toString()} others",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
