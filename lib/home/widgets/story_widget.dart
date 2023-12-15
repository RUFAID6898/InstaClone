import 'package:flutter/material.dart';
import 'package:instaclone/home/widgets/story_view_widget.dart';
import 'package:instaclone/home_api/intagration_api.dart';
import 'package:instaclone/home_api/repo_api.dart';

class StoryWidget extends StatefulWidget {
  const StoryWidget({
    // required this.index,
    super.key,
  });

  @override
  State<StoryWidget> createState() => _StoryWidgetState();
}

class _StoryWidgetState extends State<StoryWidget> {
  late Future<List<HomeIntialApi>> getstorydata;
  @override
  void initState() {
    super.initState();
    getstorydata = HomeIntagrationApi().gethomeitems();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getstorydata,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData && snapshot.data != null) {
            return Row(
              children: List.generate(
                  snapshot.data!.length,
                  (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => StoryViewWidget(
                                      senddata: snapshot.data![index]),
                                ));
                          },
                          child: Column(
                            children: [
                              StoryAvathar(
                                onlie: true,
                                image: snapshot.data![index].profil,
                              ),
                              Text(snapshot.data![index].name)
                            ],
                          ),
                        ),
                      )),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return const Text('No data');
          }
        });
  }
}

// ignore: must_be_immutable
class StoryAvathar extends StatelessWidget {
  bool onlie = false;
  String image;
  StoryAvathar({
    required this.image,
    required this.onlie,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
          border: onlie
              ? Border.all(color: Colors.green, width: 3)
              : Border.all(color: Colors.yellow, width: 0),
          image: DecorationImage(image: NetworkImage(image)),
          color: Colors.amber,
          borderRadius: BorderRadius.circular(100)),
    );
  }
}
