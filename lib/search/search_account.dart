import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instaclone/home_api/intagration_api.dart';
import 'package:instaclone/home_api/repo_api.dart';
import 'package:instaclone/search/searchdata.dart';

class SearchAccount extends StatefulWidget {
  const SearchAccount({super.key});

  @override
  State<SearchAccount> createState() => _SearchAccountState();
}

class _SearchAccountState extends State<SearchAccount> {
  late Future<List<HomeIntialApi>> getsearchdatas;
  HomeIntagrationApi _getusers = HomeIntagrationApi();
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getsearchdatas = HomeIntagrationApi().gethomeitems();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchUsers());
              },
              icon: Icon(Icons.search))
        ],
        title: CupertinoTextField(
          prefix: Icon(Icons.search),
          placeholder: 'Search',
        ),
      ),
      body: FutureBuilder<List<HomeIntialApi>>(
          future: _getusers.gethomeitems(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData && snapshot.data != null) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
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
          }),
    );
  }
}
