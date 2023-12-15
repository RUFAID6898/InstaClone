import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instaclone/core/short._widget.dart';
import 'package:instaclone/home/chat_page.dart';
import 'package:instaclone/home/widgets/home_post_widget.dart';
import 'package:instaclone/home/widgets/story_widget.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

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
              const Icon(
                Icons.favorite_border,
                color: Colors.black,
              ),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChatPage(),
                      ));
                },
                icon: const Icon(Icons.message_outlined),
                color: Colors.black,
              ),
              const SizedBox(
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
