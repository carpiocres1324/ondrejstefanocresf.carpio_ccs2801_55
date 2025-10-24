import 'package:flutter/material.dart';

class Notificationpage extends StatefulWidget {
  const Notificationpage({super.key});

  @override
  State<Notificationpage> createState() => _NotificationpageState();
}

class _NotificationpageState extends State<Notificationpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('More pressed')),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Search pressed')),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 8),
              Text('Today', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              SizedBox(height: 8),
              _buildNotificationItem(
                context,
                imagePath: 'assetes/profile/prof1.jpg',
                title: 'Learn how Meta will use your info in new ways to personalize your experiences.',
                time: '16h',
                trailingIcon: Icons.more_horiz,
                background: Colors.blue[50],
              ),
              SizedBox(height: 8),
              _buildNotificationItem(
                context,
                imagePath: 'assetes/profile/prof2.jpg',
                title: '5 Unknown Facts recently shared 1 post.',
                time: '20h',
                trailingIcon: Icons.more_horiz,
                background: Colors.blue[50],
              ),
              SizedBox(height: 8),
              _buildNotificationItem(
                context,
                imagePath: 'assetes/profile/prof3.jpg',
                title: 'Fandango posted a new reel: "Diego Luna, Jennifer Lopez..."',
                time: '2h',
                trailingIcon: Icons.more_horiz,
                background: Colors.blue[50],
              ),
              SizedBox(height: 16),
              Divider(),
              SizedBox(height: 12),
              Text('Earlier', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              SizedBox(height: 8),
              _buildNotificationItem(
                context,
                imagePath: 'assetes/profile/prof4.jpg',
                title: '9GAG posted a new reel: "White cat licks black cat".',
                time: '1d',
                trailingIcon: Icons.more_horiz,
                background: Colors.white,
              ),
              SizedBox(height: 8),
              _buildNotificationItem(
                context,
                imagePath: 'assetes/profile/prof5.jpg',
                title: 'All Def Music posted a new reel: "#JimJones, #Fabolous & #Maino..."',
                time: '2d',
                trailingIcon: Icons.more_horiz,
                background: Colors.white,
              ),
              SizedBox(height: 8),
              _buildNotificationItem(
                context,
                imagePath: 'assetes/profile/prof2.jpg',
                title: 'LADbible posted a new reel: "Cat saves baby from a wild leopard".',
                time: '2d',
                trailingIcon: Icons.more_horiz,
                background: Colors.white,
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationItem(
    BuildContext context, {
    required String imagePath,
    required String title,
    required String time,
    required IconData trailingIcon,
    Color? background,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: background ?? const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        leading: CircleAvatar(
          radius: 26,
          backgroundImage: AssetImage(imagePath),
          backgroundColor: Colors.grey[200],
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Row(
          children: [
            Text(time, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
          ],
        ),
        trailing: IconButton(
          icon: Icon(trailingIcon),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item action')));
          },
        ),
      ),
    );
  }
}