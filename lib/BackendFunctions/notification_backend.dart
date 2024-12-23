import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> addNotification({
  required String title,
  required String message,
}) async {
  User? user = FirebaseAuth.instance.currentUser;
  try {
    final CollectionReference notificationsRef =
    FirebaseFirestore.instance.collection('notifications');

    final notificationData = {
      'title': title,
      'message': message,
      'userId': user!.uid,
      'timestamp': DateTime.now(),
    };
    await notificationsRef.add(notificationData);
    print('Notification added successfully!');
  } catch (e) {
    print('Error adding notification: $e');
  }
}
