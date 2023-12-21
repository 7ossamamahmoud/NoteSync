import 'package:flutter/material.dart';
import 'package:notes/views/widgets/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, required this.title, this.icon, this.onPressed});

  final String title;
  final IconData? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10.0,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 32,
              wordSpacing: 2,
              letterSpacing: 1.25,
              fontFamily: 'Sevillana',
              fontWeight: FontWeight.w900,
            ),
          ),
          const Spacer(),
          CustomIcon(
            onPressed: onPressed,
            icon: icon!,
          ),
        ],
      ),
    );
  }
}
