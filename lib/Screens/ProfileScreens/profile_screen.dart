import 'package:constructionapp/CustomWidgets/custom_buttons.dart';
import 'package:constructionapp/CustomWidgets/custom_text_widget.dart';
import 'package:constructionapp/Screens/ProfileScreens/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const CustomTextWidget(
          text: 'Profile',
            color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/profile_picture.jpg'),
            ),
            const SizedBox(height: 15),
            const CustomTextWidget(
              text: 'Orville E Beckford',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            const SizedBox(height: 5),
            CustomTextWidget(
              text: 'Inspector at totalsurvey.co.uk.\nPassionate about safety and quality.',
              textAlign: TextAlign.center,
                fontSize: 14,
                color: Colors.grey[600]!,
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'First Name',
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Surname',
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Username',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: 'Label',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                ),
                items: ['Option 1', 'Option 2', 'Option 3']
                    .map((e) => DropdownMenuItem(
                  value: e,
                  child: CustomTextWidget(text: e),
                ))
                    .toList(),
                onChanged: (value) {},
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: 'Birthday',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                ),
                items: ['Birthday']
                    .map((e) => DropdownMenuItem(
                  value: e,
                  child: CustomTextWidget(text: e),
                ))
                    .toList(),
                onChanged: (value) {},
              ),
            ),
            CustomButton(text: "SignUp", onPressed: (){
              Get.to(()=>SignupScreen());
            })
          ],
        ),
      ),
    );
  }
}
