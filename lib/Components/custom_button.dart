import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget{
  final String text;
  final VoidCallback onPressed;
  final Color? color;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color,
  }): super (key: key);

  @override
  Widget build(BuildContext context) {
    /*
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12)
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      )
    );
     */
    return Container(
      width: 290,
      height: 56,
      decoration: ShapeDecoration(
          color: color ?? ThemeData().colorScheme.primaryContainer, //Cambiar al color del tema
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          )
      ),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? ThemeData().colorScheme.primaryContainer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            )
          ),
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 16,
              color: Colors.white
            ),
          )
      ),
    );
  }

}