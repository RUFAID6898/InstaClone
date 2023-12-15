import 'package:flutter/material.dart';
import 'package:instaclone/home/followers_account_page.dart';
import 'package:instaclone/home_api/intagration_api.dart';
import 'package:instaclone/home_api/repo_api.dart';

class SearchUsers extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    HomeIntagrationApi _getusers = HomeIntagrationApi();

    return FutureBuilder<List<HomeIntialApi>>(
        future: _getusers.gethomeitems(query: query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData && snapshot.data != null) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FollowersAccountPage(
                                followersdata: snapshot.data![index]),
                          ));
                    },
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          NetworkImage(snapshot.data![index].profil),
                    ),
                    title: Text(snapshot.data![index].name),
                    trailing: Icon(Icons.cancel),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Text('NO data');
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(child: Text('Search users'));
  }
}
