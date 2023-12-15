import 'package:flutter/material.dart';
import 'package:instaclone/core/short._widget.dart';
import 'package:instaclone/home/followers_account_page.dart';
import 'package:instaclone/home_api/repo_api.dart';
// import 'package:instagram/core/short._widget.dart';
// import 'package:instagram/home/followers_account_page.dart';
// import 'package:instagram/home_api/repo_api.dart';
import 'package:custom_clippers/custom_clippers.dart';

class MessagingPage extends StatefulWidget {
  HomeIntialApi chatperson;
  MessagingPage({super.key, required this.chatperson});

  @override
  State<MessagingPage> createState() => _MessagingPageState();
}

class _MessagingPageState extends State<MessagingPage> {
  List mesggaes = [];

  TextEditingController _messagecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 90,
          leading: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back)),
              CircleAvatar(
                backgroundImage: NetworkImage(widget.chatperson.profil),
              ),
            ],
          ),
          title: Text(widget.chatperson.name),
          actions: [
            Icon(Icons.call_outlined),
            width10,
            Icon(Icons.videocam_outlined),
            width10
          ],
        ),
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              // height: 700,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(top: 200),
                child: ListView.builder(
                  itemCount: mesggaes.length,
                  itemBuilder: (context, index) {
                    return Container(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipPath(
                          clipper: UpperNipMessageClipperTwo(MessageType.send),
                          child: Container(
                            padding: EdgeInsets.only(
                                top: 10, bottom: 10, left: 10, right: 20),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 204, 202, 202)),
                            child: Text(mesggaes[index]),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Positioned(
              left: 20,
              bottom: 5,
              child: Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(child: Icon(Icons.camera_alt_outlined)),
                    Container(
                      width: 200,
                      child: TextField(
                          decoration: InputDecoration(
                              suffix: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      mesggaes.add(_messagecontroller.text);
                                      _messagecontroller.clear();
                                    });
                                  },
                                  icon: Icon(Icons.send)))),
                    ),
                    Icon(Icons.mic),
                    Icon(Icons.emoji_emotions_outlined),
                    Icon(Icons.image),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 120,
              top: 10,
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.chatperson.profil),
                    radius: 50,
                  ),
                  Text(widget.chatperson.name),
                  Text("${widget.chatperson.liks.toString()} Followers"),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.transparent)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FollowersAccountPage(
                                  followersdata: widget.chatperson),
                            ));
                      },
                      child: Text(
                        'View Profile',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
          ],
        ));
  }
}
