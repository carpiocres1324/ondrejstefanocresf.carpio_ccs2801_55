import 'package:facebook/pages/friends.dart';
import 'package:facebook/pages/marketplace.dart';
import 'package:facebook/pages/newsfeed.dart';
import 'package:facebook/pages/notification.dart';
import 'package:facebook/pages/profile.dart';
import 'package:facebook/pages/reels.dart';
import 'package:flutter/material.dart';

class Custommain extends StatefulWidget {
  const Custommain({super.key});

  @override
  State<Custommain> createState() => _CustommainState();
}

class _CustommainState extends State<Custommain> {
  int currentPage = 0;

  List pages = [
    const newsfeed(),
    const Reelspage(),
    const FriendsPage(),
    const Marketplace(),
    const NotificationPage(),
    const ProfilePage(),
  ];

  void onTapped(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        type: BottomNavigationBarType.fixed,
        onTap: onTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Homeboi'),
          BottomNavigationBarItem(icon: Icon(Icons.ondemand_video), label: 'Reels'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'friends'),
          BottomNavigationBarItem(icon: Icon(Icons.local_convenience_store), label: 'Marketplace'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notification'),
          BottomNavigationBarItem(icon: CircleAvatar(backgroundImage: AssetImage('assetes/profile/prof2.jpg'),
          ), label: 'profile'),
        ],
      ),
    );
  }
}