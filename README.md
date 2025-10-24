ondrej stefanocres f. carpio BSIT-2 CCS2801_55


import 'package:flutter/material.dart';

// --- MAIN APPLICATION SETUP ---
void main() {
  runApp(const NotificationApp());
}

class NotificationApp extends StatelessWidget {
  const NotificationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notifications UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // Use Material 3 features
        useMaterial3: true,
        // Set a light background for the scaffold body
        scaffoldBackgroundColor: const Color(0xFFF7F7F7),
      ),
      home: const NotificationScreen(),
    );
  }
}

// --- CORE DATA MODELS ---

// Model for individual notifications (Added 'isRead' status)
class NotificationModel {
  final String title;
  final String time;
  final IconData icon;
  final Color iconColor;
  final bool hasMoreOptions;
  final bool isRead; // State managed by the parent widget

  const NotificationModel({
    required this.title,
    required this.time,
    required this.icon,
    required this.iconColor,
    this.hasMoreOptions = false,
    this.isRead = false,
  });

  // Helper function to create a copy of the notification with a new 'isRead' status
  NotificationModel copyWith({bool? isRead}) {
    return NotificationModel(
      title: title,
      time: time,
      icon: icon,
      iconColor: iconColor,
      hasMoreOptions: hasMoreOptions,
      isRead: isRead ?? this.isRead,
    );
  }
}

// --- NOTIFICATION SCREEN WIDGET (StatefulWidget) ---
class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // Data is now a single mutable list managed by the State class
  List<NotificationModel> notifications = [
    // Today
    const NotificationModel(
      title: 'Learn how Meta will use your info in new ways to personalize your experiences.',
      time: '16h',
      icon: Icons.security,
      iconColor: Colors.deepPurple,
      isRead: true, // Start one as read for visual contrast
    ),
    const NotificationModel(
      title: 'Unknown Facts recently shared a post.',
      time: '20h',
      icon: Icons.person_pin,
      iconColor: Colors.teal,
      hasMoreOptions: true,
    ),
    const NotificationModel(
      title: 'Fandango posted a new reel: "Diego Luna, Jennifer Lopez, and Tonatiuh star in #KISSOFTHE SPIDERWOMAN, in theater..."',
      time: '2h',
      icon: Icons.movie,
      iconColor: Colors.pink,
      hasMoreOptions: true,
    ),
    // Earlier
    const NotificationModel(
      title: '9GAG posted a new reel: "White cat licks black cat".',
      time: '2d',
      icon: Icons.photo_library,
      iconColor: Colors.black,
      hasMoreOptions: true,
    ),
    const NotificationModel(
      title: 'All Def Music posted a new reel: "#JimJones, #Fabolous & #Malino discuss being called an #OLDTH 11 > > >"',
      time: '2d',
      icon: Icons.music_note,
      iconColor: Colors.red,
      hasMoreOptions: true,
    ),
    const NotificationModel(
      title: 'LADBible posted a new reel: "Cat saves baby from a wild leopard 😻"',
      time: '2d',
      icon: Icons.pets,
      iconColor: Colors.brown,
      hasMoreOptions: true,
    ),
  ];
  
  // Flag to control the visibility of the "See previous" button
  bool showMoreButton = true;

  // --- STATE MANAGEMENT FUNCTION ---
  void _markAsRead(int notificationIndex) {
    // setState triggers a rebuild of the widget tree
    setState(() {
      // Create a copy of the specific notification item with isRead: true
      final updatedNotification = notifications[notificationIndex].copyWith(isRead: true);
      // Replace the old notification with the updated one
      notifications[notificationIndex] = updatedNotification;
    });
  }
  
  // Placeholder for loading more data
  void _loadMoreNotifications() {
    // In a real app, this would fetch more data. For now, it just hides the button.
    setState(() {
      showMoreButton = false;
    });
    // print("Loading more notifications...");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // --- APP BAR (Header) ---
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          // Search Icon
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // Handle search action
            },
          ),
          // More Options Icon (Three dots)
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
              // Handle more options menu (e.g., mark all as read)
            },
          ),
        ],
      ),

      // --- BODY (Single Scrollable List using SingleChildScrollView) ---
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Map all notification models to NotificationItem widgets
            ...notifications.asMap().entries.map((entry) {
              final index = entry.key;
              final note = entry.value;
              return NotificationItem(
                notification: note,
                onTap: () => _markAsRead(index),
              );
            }).toList(),

            // Conditionally display the "See previous notifications" button
            if (showMoreButton)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Center(
                  child: TextButton(
                    onPressed: _loadMoreNotifications,
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.blue.shade700,
                      textStyle: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    child: const Text('See previous notifications'),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// --- CUSTOM NOTIFICATION ITEM WIDGET ---
class NotificationItem extends StatelessWidget {
  final NotificationModel notification;
  final VoidCallback onTap; // New callback for state change

  const NotificationItem({
    super.key, 
    required this.notification,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Change background color based on read status
    final Color backgroundColor = notification.isRead
        ? Colors.grey.shade100 // Lighter background if read
        : Colors.white; // White or a slight highlight if unread

    return InkWell(
      onTap: onTap, // Execute the callback passed from the parent stateful widget
      child: Container(
        color: backgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon/Profile Picture (Large circular area)
            Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                color: notification.iconColor.withOpacity(0.1),
                shape: BoxShape.circle,
                border: Border.all(color: notification.iconColor.withOpacity(0.2), width: 1),
              ),
              child: Icon(
                notification.icon,
                color: notification.iconColor,
                size: 28,
              ),
            ),
            const SizedBox(width: 12),

            // Content Area (Text and Time)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification.title,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                      fontWeight: notification.isRead ? FontWeight.normal : FontWeight.bold, // Bold if unread
                      height: 1.3,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    notification.time,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            // More Options Icon
            if (notification.hasMoreOptions)
              IconButton(
                icon: const Icon(Icons.more_horiz, color: Colors.grey),
                onPressed: () {
                  // Handle more options menu
                },
              ),
          ],
        ),
      ),
    );
  }
}
