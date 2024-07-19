import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lorelay/services/my_colors.dart';

class SplashIconGroup extends StatefulWidget {
  const SplashIconGroup({
    super.key,
    required this.icon,
    required this.iconText,
    required this.textColor,
  });

  final String icon;
  final String iconText;
  final Color textColor;

  @override
  State<SplashIconGroup> createState() => _SplashIconGroupState();
}

class _SplashIconGroupState extends State<SplashIconGroup> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            widget.icon,
            height: 30,
          ),
          Text(
            widget.iconText,
            style: GoogleFonts.hankenGrotesk(
                color: widget.textColor, letterSpacing: 1),
          ),
        ],
      ),
    );
  }
}
