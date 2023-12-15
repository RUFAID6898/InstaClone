import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instaclone/core/short._widget.dart';
import 'package:instaclone/home/chat_page.dart';
import 'package:instaclone/home/widgets/home_post_widget.dart';
import 'package:instaclone/home/widgets/story_widget.dart';
// import 'package:instagram/core/short._widget.dart';
// import 'package:instagram/home/chat_page.dart';
// import 'package:instagram/home/widgets/home_post_widget.dart';
// import 'package:instagram/home/widgets/post_save_widget.dart';
// import 'package:instagram/home/widgets/story_widget.dart';
// import 'package:instagram/home_api/intagration_api.dart';
// import 'package:instagram/home_api/repo_api.dart';
// import 'package:insta_like_button/insta_like_button.dart';
// import 'package:like_button/like_button.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: 50,
            title: Text(
              'Instagram',
              style: GoogleFonts.agdasima(color: Colors.black, fontSize: 30),
            ),
            actions: [
              Icon(
                Icons.favorite_border,
                color: Colors.black,
              ),
              SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatPage(),
                      ));
                },
                icon: Icon(Icons.message_outlined),
                color: Colors.black,
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal, child: StoryWidget()),
                ),
                hight20,
                HomepostWidget()
              ],
            ),
          )
        ],
      ),
    );
  }
}
