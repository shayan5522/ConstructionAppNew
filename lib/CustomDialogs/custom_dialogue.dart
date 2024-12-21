import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String message;
  final String loginButtonText;
  final String signupButtonText;
  final VoidCallback onLogin;
  final VoidCallback onSignup;
  final Color loginButtonColor;
  final Color signupButtonColor;
  final TextStyle? titleStyle;
  final TextStyle? messageStyle;
  final TextStyle? buttonTextStyle;

  const CustomDialog({
    Key? key,
    required this.title,
    required this.message,
    required this.loginButtonText,
    required this.signupButtonText,
    required this.onLogin,
    required this.onSignup,
    this.loginButtonColor = Colors.teal,
    this.signupButtonColor = Colors.blue,
    this.titleStyle,
    this.messageStyle,
    this.buttonTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: titleStyle ??
                  GoogleFonts.nunito(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 10),
            Text(
              message,
              textAlign: TextAlign.center,
              style: messageStyle ?? GoogleFonts.nunito(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: onLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: loginButtonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    loginButtonText,
                    style: buttonTextStyle ??
                        GoogleFonts.nunito(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                ElevatedButton(
                  onPressed: onSignup,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: signupButtonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    signupButtonText,
                    style: buttonTextStyle ??
                        GoogleFonts.nunito(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
