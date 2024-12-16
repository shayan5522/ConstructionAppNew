import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Frequently Asked Questions',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              HelpItem(
                question: 'How to start a new inspection?',
                answer:
                'To start a new inspection, go to the main screen and tap on "New Inspection". Follow the on-screen prompts to proceed.',
              ),
              HelpItem(
                question: 'How to view pending inspections?',
                answer:
                'You can view pending inspections by tapping on "Pending Inspections" in the menu.',
              ),
              HelpItem(
                question: 'How to access completed reports?',
                answer:
                'To view completed reports, tap the "View Reports" button on the main screen.',
              ),
              SizedBox(height: 20),
              Text(
                'Troubleshooting',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              HelpItem(
                question: 'The app is not loading properly. What should I do?',
                answer:
                'Ensure you have a stable internet connection and restart the app. If the problem persists, try reinstalling it.',
              ),
              HelpItem(
                question: 'How to reset my account password?',
                answer:
                'You can reset your password by going to the login screen and selecting "Forgot Password". Follow the instructions sent to your email.',
              ),
              SizedBox(height: 20),
              Text(
                'Contact Us',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ContactInfo(
                icon: Icons.email_outlined,
                text: 'Email: support@totalsurvey.com',
              ),
              ContactInfo(
                icon: Icons.phone_outlined,
                text: 'Phone: +1 123 456 7890',
              ),
              ContactInfo(
                icon: Icons.language_outlined,
                text: 'Website: www.totalsurvey.com',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Reusable Help Item Widget
class HelpItem extends StatelessWidget {
  final String question;
  final String answer;

  const HelpItem({
    super.key,
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      child: ExpansionTile(
        title: Text(
          question,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              answer,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
          ),
        ],
      ),
    );
  }
}

// Reusable Contact Info Widget
class ContactInfo extends StatelessWidget {
  final IconData icon;
  final String text;

  const ContactInfo({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent, size: 28),
      title: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      ),
    );
  }
}
