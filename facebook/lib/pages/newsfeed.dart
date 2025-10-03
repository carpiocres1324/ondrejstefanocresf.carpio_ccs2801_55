import 'package:facebook/widgets/createpost.dart';
import 'package:flutter/material.dart';

class newsfeed extends StatefulWidget {
  const newsfeed({super.key});

  @override
  State<newsfeed> createState() => newsfeedState();
}

class newsfeedState extends State<newsfeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assetes/icon/logo.png",height: 80,),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        DrawerButton()
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Createpost()
          ],
        ),
      ),
    );
  }
}