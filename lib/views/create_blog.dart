import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:piloting_app/services/crud.dart';

class CreateBlog extends StatefulWidget {
  @override
  _CreateBlogState createState() => _CreateBlogState();
}

class _CreateBlogState extends State<CreateBlog> {
  String authorName, title, desc;
  File selectedImage;
  CrudMethods crudMethods = new CrudMethods();

  final picker = ImagePicker();

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = image;
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
        actions: <Widget>[
          Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.file_upload)),
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                getImage();
              },
              child: selectedImage != null
                  ? Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.file(
                          selectedImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Icon(
                        Icons.add_a_photo,
                        color: Colors.black,
                      ),
                    ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(hintText: "Author Name"),
                    onChanged: (val) {
                      authorName = val;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "Title"),
                    onChanged: (val) {
                      title = val;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "Description"),
                    onChanged: (val) {
                      desc = val;
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
