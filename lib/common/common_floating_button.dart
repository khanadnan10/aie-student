import 'package:flutter/material.dart';

class CommonFloatingButton extends StatelessWidget {
  final String text;
  final Gradient? gradient;
  final VoidCallback onTap;
  const CommonFloatingButton({
    Key? key,
    required this.text,
    this.gradient,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: 56.0,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey, // Shadow color
            offset: Offset(0, 2), // Offset from top
            blurRadius: 10,
          ),
        ],
      ),
      child: FloatingActionButton(
        elevation: 0,
        onPressed: onTap,
        backgroundColor:
            Colors.transparent, // Make the default background transparent
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
