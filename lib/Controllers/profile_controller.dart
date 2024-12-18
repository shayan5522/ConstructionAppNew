import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserProfile {
  final String firstName;
  final String lastName;
  final String email;
  final String age;
  final String gender;

  UserProfile({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.age,
    required this.gender,
  });

  // Factory constructor to create a UserProfile from Firestore data
  factory UserProfile.fromFirestore(Map<String, dynamic> data) {
    return UserProfile(
      firstName: data['firstName'] ?? '',
      lastName: data['lastName'] ?? '',
      email: data['email'] ?? '',
      age: data['age'] ?? '',
      gender: data['gender'] ?? '',
    );
  }
}

class ProfileController extends GetxController {
  var isLoading = false.obs;
  var userData = Rxn<UserProfile>();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    fetchUserProfile();
  }

  void fetchUserProfile() async {
    isLoading.value = true;

    try {
      final User? currentUser = _auth.currentUser;
      if (currentUser != null) {
        final String uid = currentUser.uid; // Fetch the current user's UID

        final DocumentSnapshot<Map<String, dynamic>> userDoc =
        await _firestore.collection('users').doc(uid).get();

        if (userDoc.exists) {
          userData.value = UserProfile.fromFirestore(userDoc.data()!);
        } else {
          userData.value = null;
          Get.snackbar('Error', 'User profile not found');
        }
      } else {
        userData.value = null;
        Get.snackbar('Error', 'No user is currently logged in');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load user data: $e');
      userData.value = null;
    } finally {
      isLoading.value = false;
    }
  }
}
