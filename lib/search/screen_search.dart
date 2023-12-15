import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instaclone/home_api/intagration_api.dart';
import 'package:instaclone/home_api/repo_api.dart';
import 'package:instaclone/search/post_view_page.dart';
import 'package:instaclone/search/searchdata.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  late Future<List<HomeIntialApi>> getdata;
  @override
  void initState() {
    super.initState();
    getdata = HomeIntagrationApi().gethomeitems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CupertinoTextField(
          onTap: () {
            showSearch(context: context, delegate: SearchUsers());
          },
          placeholder: 'Search',
          prefix: const Icon(Icons.search),
        ),
      ),
      body: FutureBuilder(
          future: getdata,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasData && snapshot.data != null) {
              return ListView(
                  children: List.generate(
                      5,
                      (index) => Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: StaggeredGrid.count(
                              crossAxisSpacing: 3,
                              mainAxisSpacing: 3,
                              crossAxisCount: 3,
                              children: [
                                BigPostCard(post: snapshot.data![index].post),
                                SmolpostCard(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => SearchPost(
                                              sendpost:
                                                  snapshot.data![index + 2 + 3],
                                            ),
                                          ));
                                    },
                                    post: snapshot.data![index + 2 + 3].post),
                                SmolpostCard(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => SearchPost(
                                                sendpost: snapshot
                                                    .data![index + 4 + 5]),
                                          ));
                                    },
                                    post: snapshot.data![index + 4 + 5].post),
                                SmolpostCard(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => SearchPost(
                                              sendpost:
                                                  snapshot.data![index + 6 + 7],
                                            ),
                                          ));
                                    },
                                    post: snapshot.data![index + 6 + 7].post),
                                SmolpostCard(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => SearchPost(
                                              sendpost:
                                                  snapshot.data![index + 8],
                                            ),
                                          ));
                                    },
                                    post: snapshot.data![index + 8].post),
                              ],
                            ),
                          )));
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return const Text('No Data');
            }
          }),
    );
  }
}

// ignore: must_be_immutable
class SmolpostCard extends StatelessWidget {
  String post;
  Function() onTap;
  SmolpostCard({
    required this.onTap,
    required this.post,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1,
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.amber,
            image:
                DecorationImage(image: NetworkImage(post), fit: BoxFit.cover),
          ),
          child: InkWell(onTap: onTap),
        ));
  }
}

// ignore: must_be_immutable
class BigPostCard extends StatelessWidget {
  String post;

  BigPostCard({
    required this.post,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 2,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.amber,
            image:
                DecorationImage(image: NetworkImage(post), fit: BoxFit.cover),
          ),
          height: 100,
          width: 100,
        ));
  }
}
