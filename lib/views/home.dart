import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:piloting_app/services/crud.dart';
import 'package:piloting_app/views/create_blog.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CrudMethods crudMethods = new CrudMethods();

  QuerySnapshot blogSnapshot;

  Widget BlogsList() {
    return Container(
      child: Column(
        children: <Widget>[
          ListView.builder(
            itemCount: blogSnapshot.documents.length,
          itemBuilder: (context,index){
            return BlogsTile(
              authorName: blogSnapshot.documents[index].data['authorName']);
          },
          ),
          ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    crudMethods.getData().then((result) {
      blogSnapshot = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Piloting",
              style: TextStyle(fontSize: 22),
            ),
            Text(
              "App",
              style: TextStyle(fontSize: 22, color: Colors.blue),
            )
          ],
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(),
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreateBlog()));
              },
              child: Icon(Icons.add_a_photo),
            )
          ],
        ),
      ),
    );
  }
}

class BlogsTile extends StatelessWidget {
  String imgUrl, title, description, authorName;
  BlogsTile(
      {@required this.imgUrl, this.title, this.description, this.authorName});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(imgUrl)),
          Container(
            height: 150,
            decoration: BoxDecoration(color: Colors.black45.withOpacity(0.3),
            borderRadius: BorderRadius.circular(6)),
          ),
          Container(child: Column(children: <Widget>[
           Text(title),
           Text(description),
          Text(authorName),
          ],),
        ],
      ),
    );
  }
}
