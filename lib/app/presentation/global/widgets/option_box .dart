import 'package:flutter/material.dart';

class OptionBox extends StatelessWidget {

  const OptionBox({super.key, 
    required this.text,
    required this.index,
    required this.isSelected,
    required this.onPressed,
  });
  final String text;
  final int index;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin:const  EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color.fromARGB(255, 255, 255, 255) :const Color.fromARGB(167, 255, 255, 255),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: isSelected ? const Color.fromARGB(255, 0, 0, 0) : Colors.black, 
            fontWeight: FontWeight.w600
          ),
        ),
      ),
    );
  }
}