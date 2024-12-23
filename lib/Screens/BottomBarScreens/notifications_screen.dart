import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../CustomWidgets/custom_text_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const CustomTextWidget(
          text: "Notifications",
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: user == null
          ? const Center(
           child: CustomTextWidget(
          text: "Please log in to view notifications.",
          fontSize: 16,
          color: Colors.grey,
            ),
          )
          : StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('notifications')
            .where('userId', isEqualTo: user.uid)
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: CustomTextWidget(
                text: "No notifications yet.",
                fontSize: 16,
                color: Colors.grey,
              ),
            );
          }

          final notifications = snapshot.data!.docs;

          return ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              final notification = notifications[index];
              return NotificationTile(
                title: notification['title'],
                subtitle: notification['message'],
                time: _formatTime(notification['timestamp']),
                isUnread: false,
              );
            },
          );
        },
      ),
    );
  }

  String _formatTime(Timestamp timestamp) {
    final dateTime = timestamp.toDate();
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 1) {
      return "Just now";
    } else if (difference.inMinutes < 60) {
      return "${difference.inMinutes} min ago";
    } else if (difference.inHours < 24) {
      return "${difference.inHours} hr ago";
    } else {
      return "${difference.inDays} days ago";
    }
  }
}

class NotificationTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final bool isUnread;

  const NotificationTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
    this.isUnread = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: CircleAvatar(
          radius: 28,
          backgroundColor: Colors.tealAccent,
          child: const Icon(
            Icons.notifications,
            color: Colors.white,
            size: 28,
          ),
        ),
        title: CustomTextWidget(
          text: title,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: CustomTextWidget(
            text: subtitle,
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextWidget(
              text: time,
              color: Colors.grey,
              fontSize: 12,
            ),
            if (isUnread)
              const Padding(
                padding: EdgeInsets.only(top: 4.0),
                child: Icon(Icons.circle, color: Colors.blue, size: 10),
              ),
          ],
        ),
      ),
    );
  }
}
