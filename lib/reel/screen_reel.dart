import 'package:flutter/material.dart';
import 'package:instaclone/home/followers_account_page.dart';
import 'package:instaclone/home_api/intagration_api.dart';
import 'package:instaclone/home_api/repo_api.dart';
// import 'package:instagram/home_api/intagration_api.dart';
// import 'package:instagram/home_api/repo_api.dart';
import 'package:like_button/like_button.dart';
// import 'package:video_player/video_player.dart';

class ScreenReels extends StatefulWidget {
  const ScreenReels({Key? key}) : super(key: key);

  @override
  State<ScreenReels> createState() => _ScreenReelsState();
}

class _ScreenReelsState extends State<ScreenReels> {
  // late VideoPlayerController _controller;
  late Future<List<HomeIntialApi>> getdata;

  @override
  void initState() {
    super.initState();
    // _controller = VideoPlayerController.network(
    //     'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4');

    // _controller.initialize().then((_) {
    //   setState(() {});
    // });

    // _controller.setLooping(true);
    getdata = HomeIntagrationApi().gethomeitems();
  }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

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
                      // Container(
                      //   color: Colors.black,
                      //   height: 300,
                      //   width: 300,
                      //   child: _controller.value.isInitialized
                      //       ? AspectRatio(
                      //           aspectRatio: _controller.value.aspectRatio,
                      //           child: VideoPlayer(_controller),
                      //         )
                      //       : Container(),
                      // ),
                      Positioned(
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
                            LikeButton(
                              size: 30,
                            ),
                            Text(
                              '${snapshot.data![index].liks} likes',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(height: 20),
                            Icon(
                              Icons.comment_outlined,
                              size: 30,
                              color: Colors.white,
                            ),
                            Text(
                              '${snapshot.data![index].comments} Comt',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(height: 20),
                            Icon(
                              Icons.send,
                              size: 30,
                              color: Colors.white,
                            ),
                            Text(
                              '${snapshot.data![index].liks}Share',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(height: 20),
                            Icon(
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
                                  SizedBox(width: 10),
                                  Text(
                                    snapshot.data![index].name,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  OutlinedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.transparent),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      'Follow',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              snapshot.data![index].tags,
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "${snapshot.data![index].comments.toString()} others",
                              style: TextStyle(color: Colors.white),
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
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
