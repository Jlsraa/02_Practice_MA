import 'package:find_track_app/content/favourites/favourite_item.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterfire_ui/firestore.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Favoritos"),
        ),
        body: FirestoreListView(
          query: FirebaseFirestore.instance
              .collection("songs")
              .where("favourite", isEqualTo: true),
          itemBuilder: (BuildContext context,
              QueryDocumentSnapshot<Map<String, dynamic>> document) {
            return FavouriteItem(favSong: document.data());
          },
        ),
      ),
    );
  }
}
