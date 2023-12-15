import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instaclone/home/widgets/masseging_page.dart';
import 'package:instaclone/home/widgets/story_widget.dart';
import 'package:instaclone/home_api/intagration_api.dart';
import 'package:instaclone/home_api/repo_api.dart';
import 'package:instaclone/search/searchdata.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late Future<List<HomeIntialApi>> getcontacts;
  @override
  void initState() {
    super.initState();
    getcontacts = HomeIntagrationApi().gethomeitems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: FutureBuilder(
          future: getcontacts,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData && snapshot.data != null) {
              return ListView(children: [
                CupertinoTextField(
                  onTap: () {
                    showSearch(context: context, delegate: SearchUsers());
                  },
                  prefix: const Icon(Icons.search),
                  placeholder: 'Search',
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          StoryAvathar(
                            onlie: false,
                            image: '',
                          ),
                          Positioned(
                            left: 5,
                            child: Container(
                              height: 30,
                              width: 70,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 183, 182, 182),
                                  borderRadius: BorderRadius.circular(15)),
                              child: const Row(
                                children: [
                                  Icon(Icons.music_note),
                                  Text('music')
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Column(
                  children: List.generate(
                      10,
                      (index) => ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MessagingPage(
                                        chatperson: snapshot.data![index]),
                                  ));
                            },
                            leading: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(snapshot.data![index].profil),
                              radius: 30,
                            ),
                            title: Text(snapshot.data![index].name),
                            subtitle: const Text('Send'),
                            trailing: const Icon(Icons.camera_alt_outlined),
                          )),
                )
              ]);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return const Text('NO internet');
            }
          }),
    );
  }
}
