import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FavouriteItem extends StatefulWidget {
  final Map<String, dynamic> favSong;
  FavouriteItem({Key? key, required this.favSong}) : super(key: key);

  @override
  State<FavouriteItem> createState() => _FavouriteItemState();
}

class _FavouriteItemState extends State<FavouriteItem> {
  String uid = "";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Card(
        child: Stack(
          children: <Widget>[
            Column(
              children: [
                Image.network(
                  "${widget.favSong["album_cover"]}",
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10),
                Text(
                  "${widget.favSong["songName"]}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "${widget.favSong["artist"]}",
                  style: TextStyle(fontSize: 14, color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
              child: IconButton(
                icon: Icon(
                  Icons.favorite,
                  size: 30,
                ),
                onPressed: () {
                  //
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
