import 'package:flutter/material.dart';
import 'package:instaclone/account/widgets/button_widget.dart';
import 'package:instaclone/core/short._widget.dart';
import 'package:instaclone/home_api/intagration_api.dart';
import 'package:instaclone/home_api/repo_api.dart';
import 'package:instaclone/search/post_view_page.dart';
// import 'package:instagram/account/widgets/button_widget.dart';
// import 'package:instagram/core/short._widget.dart';
// import 'package:instagram/home/screen_home.dart';
// import 'package:instagram/home_api/intagration_api.dart';
// import 'package:instagram/home_api/repo_api.dart';
// import 'package:instagram/reel/screen_reel.dart';
// import 'package:instagram/search/post_view_page.dart';
// import 'package:instagram/home/widgets/story_widget.dart';

class ScreenAccount extends StatefulWidget {
  const ScreenAccount({super.key});

  @override
  State<ScreenAccount> createState() => _ScreenAccountState();
}

class _ScreenAccountState extends State<ScreenAccount> {
  late Future<List<HomeIntialApi>> getstorydata;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getstorydata = HomeIntagrationApi().gethomeitems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'ru_fi_id',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: const [
            Icon(Icons.add_box_outlined),
            width10,
            Icon(Icons.density_medium_rounded),
            width10
          ],
        ),
        body: FutureBuilder(
            future: getstorydata,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData && snapshot.data != null) {
                return ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // width10,
                        CircleAvatar(
                          backgroundImage:
                              NetworkImage(snapshot.data![10].profil),
                          radius: 50,
                        ),
                        // width10,
                        Column(
                          children: [
                            Text(
                              '0',
                              style: TextStyle(fontSize: 20),
                            ),
                            Text('Post')
                          ],
                        ),
                        // width10,
                        Column(
                          children: [
                            Text(
                              snapshot.data![1].liks.toString(),
                              style: TextStyle(fontSize: 20),
                            ),
                            Text('Following')
                          ],
                        ),
                        // width10,
                        Column(
                          children: [
                            Text(
                              snapshot.data![1].comments.toString(),
                              style: TextStyle(fontSize: 20),
                            ),
                            Text('Followers')
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25, top: 5),
                      child: Text(
                        'Photographer',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
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
                          child: Icon(Icons.person_add_alt),
                        ),
                      ],
                    ),
                    hight10,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: List.generate(
                              7,
                              (index) => HighLightWidget(
                                    image: snapshot.data![index].post,
                                  ))),
                    ),
                    DefaultTabController(
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
                              3,
                              (index) => Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => SearchPost(
                                                  sendpost:
                                                      snapshot.data![index]),
                                            ));
                                      },
                                      child: AccountPostWidget(
                                        image: snapshot.data![index].post,
                                      ),
                                    ),
                                  )),
                        ),
                      ),
                    ))
                  ],
                );
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return Text('No Data');
              }
            }));
  }
}

class AccountPostWidget extends StatelessWidget {
  String image;
  AccountPostWidget({
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
          color: Colors.amber,
          image:
              DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)),
    );
  }
}

class HighLightWidget extends StatelessWidget {
  String image;
  HighLightWidget({
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
            image:
                DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(100),
            color: Colors.amber),
      ),
    );
  }
}
