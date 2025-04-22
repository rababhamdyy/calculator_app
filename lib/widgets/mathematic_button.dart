import 'package:flutter/material.dart';

class MathematicButton extends StatelessWidget {
  final String icon;
  final Function()? onPressed;
  const MathematicButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        maximumSize: Size(100, 100),
        minimumSize: Size(50, 50),
      ),
      child: Text(
        icon,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.normal,
          color: Colors.teal[800],
        ),
      ),
    );
  }
}
