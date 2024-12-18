import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:constructionapp/Screens/BottomBarScreens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var isLoading = false.obs;

  Future<void> signup({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String age,
    required String gender,
    File? profileImage,
  }) async {
    try {
      isLoading.value = true;

      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String uid = userCredential.user!.uid;

      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'age': age,
        'gender': gender,
      });

      isLoading.value = false;

      Get.snackbar('Success', 'Signup successful!');
      Get.to(()=>const HomeScreen());
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', e.message ?? 'An error occurred');
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', 'An unexpected error occurred');
    }
  }
}
