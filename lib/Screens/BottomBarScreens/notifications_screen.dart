import 'package:constructionapp/CustomWidgets/custom_text_widget.dart';
import 'package:constructionapp/CustomWidgets/custon_drawer.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      NotificationItem(
        name: "Inspector A",
        subtitle: "Survey completed",
        time: "2 min ago",
        avatar: "assets/inspector1.png",
        isUnread: true,
      ),
      NotificationItem(
        name: "Inspector B",
        subtitle: "Survey in progress",
        time: "10 min ago",
        avatar: "assets/inspector2.png",
        isUnread: false,
      ),
      NotificationItem(
        name: "Inspector C",
        subtitle: "Survey scheduled",
        time: "30 min ago",
        avatar: "assets/inspector3.png",
        isUnread: false,
      ),
      NotificationItem(
        name: "Manager D",
        subtitle: "New survey assigned",
        time: "1 hr ago",
        avatar: "assets/manager.png",
        isUnread: true,
      ),
      NotificationItem(
        name: "Inspector E",
        subtitle: "Survey postponed",
        time: "2 hrs ago",
        avatar: "assets/inspector4.png",
        isUnread: false,
      ),
      NotificationItem(
        name: "Inspector F",
        subtitle: "Survey completed",
        time: "3 hrs ago",
        avatar: "assets/inspector5.png",
        isUnread: false,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const CustomTextWidget(
         text:  "Notifications",
         color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold,
        ),
      ),
      drawer: const CustomDrawer(),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return NotificationTile(notification: notification);
        },
      ),
    );
  }
}

class NotificationItem {
  final String name;
  final String subtitle;
  final String time;
  final String avatar;
  final bool isUnread;

  NotificationItem({
    required this.name,
    required this.subtitle,
    required this.time,
    required this.avatar,
    required this.isUnread,
  });
}

class NotificationTile extends StatelessWidget {
  final NotificationItem notification;

  const NotificationTile({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 28,
        backgroundImage: AssetImage(notification.avatar),
      ),
      title: CustomTextWidget(
        text: notification.name,
        fontWeight: FontWeight.bold, fontSize: 16,
      ),
      subtitle: CustomTextWidget(
       text:  notification.subtitle,
        color: Colors.grey,
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextWidget(
           text:  notification.time,
           color: Colors.grey, fontSize: 12,
          ),
          if (notification.isUnread)
            const Padding(
              padding: EdgeInsets.only(top: 4.0),
              child: Icon(Icons.circle, color: Colors.blue, size: 10),
            ),
        ],
      ),
    );
  }
}
