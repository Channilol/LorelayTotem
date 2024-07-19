import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lorelay/services/my_colors.dart';

class SidebarItem extends StatefulWidget {
  const SidebarItem({
    super.key,
    required this.icon,
    required this.text,
    this.selectionColor,
  });

  final String icon;
  final String text;
  final Color? selectionColor;

  @override
  State<SidebarItem> createState() => _SidebarItemState();
}

class _SidebarItemState extends State<SidebarItem> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: double.infinity,
      color: widget.selectionColor ?? Colors.transparent,
      padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
      margin: EdgeInsets.only(bottom: 10.0),
      child: Column(
        children: [
          Image.asset(
            widget.icon,
            width: 45,
          ),
          Text(
            widget.text,
            style: GoogleFonts.hankenGrotesk(color: MyColors.colorText),
          )
        ],
      ),
    );
  }
}
