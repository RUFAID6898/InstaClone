import 'package:flutter/material.dart';
import 'package:instaclone/account/Screen_account.dart';
import 'package:instaclone/account/widgets/button_widget.dart';
import 'package:instaclone/core/short._widget.dart';
import 'package:instaclone/home_api/repo_api.dart';
import 'package:instaclone/search/post_view_page.dart';

// ignore: must_be_immutable
class FollowersAccountPage extends StatelessWidget {
  HomeIntialApi followersdata;
  FollowersAccountPage({super.key, required this.followersdata});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(followersdata.name),
        ),
        body: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // width10,
                CircleAvatar(
                  backgroundImage: NetworkImage(followersdata.profil),
                  radius: 50,
                ),
                // width10,
                const Column(
                  children: [
                    Text(
                      '1',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text('Post')
                  ],
                ),
                // width10,
                Column(
                  children: [
                    Text(
                      followersdata.comments.toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                    const Text('Following')
                  ],
                ),
                // width10,
                Column(
                  children: [
                    Text(
                      followersdata.liks.toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                    const Text('Followers')
                  ],
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25, top: 5),
              child: Text(
                'Photographer',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            hight20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonWidget(Buttonname: 'Follow'),
                ButtonWidget(Buttonname: 'Share Profile'),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15)),
                  child: const Icon(Icons.person_add_alt),
                ),
              ],
            ),
            hight10,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(1,
                      (index) => HighLightWidget(image: followersdata.post))),
            ),
            const DefaultTabController(
              length: 2,
              child: TabBar(tabs: [
                Tab(
                  icon: Icon(Icons.add_box_outlined),
                ),
                Tab(
                  icon: Icon(Icons.person_outline_sharp),
                )
              ]),
            ),
            Column(
                children: List.generate(
              1,
              (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: List.generate(
                      1,
                      (index) => Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          SearchPost(sendpost: followersdata),
                                    ));
                              },
                              child:
                                  AccountPostWidget(image: followersdata.post),
                            ),
                          )),
                ),
              ),
            ))
          ],
        ));
  }
}
