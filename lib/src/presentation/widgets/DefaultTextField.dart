import 'package:flutter/material.dart';

class Defaulttextfield extends StatelessWidget {
  String label;
  IconData icon;
  Function(String value) onChanged;
  bool obscureText;
  bool isNumber;

  Defaulttextfield({
    super.key,
    required this.label,
    required this.icon,
    required this.onChanged,
    required this.obscureText,
    required this.isNumber,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value){
        onChanged(value);
      },
      obscureText: obscureText ? true : false,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        label: Text(
          label, 
          style: TextStyle(color: Colors.white)
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        prefixIcon: Icon(icon, color: Colors.white,),
      ),
    );
  }
}