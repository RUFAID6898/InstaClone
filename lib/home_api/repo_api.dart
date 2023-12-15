class HomeIntialApi {
  String profil;
  String post;
  String name;
  int liks;
  int comments;
  String tags;

  HomeIntialApi({
    required this.comments,
    required this.liks,
    required this.name,
    required this.post,
    required this.tags,
    required this.profil,
  });

  factory HomeIntialApi.fromJson(Map<String, dynamic> json) {
    return HomeIntialApi(
        comments: json["comments"],
        liks: json["likes"],
        name: json["user"],
        post: json["largeImageURL"],
        tags: json["tags"],
        profil: json["userImageURL"]);
  }
}
