import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    this.password, this.validator,this.autoValidateMode, this.labelText, this.obscureText =false, this.onSaved, this.keyboardType, this.suffix, this.hintText ,
  });

  final String? password, labelText, hintText;
  final String? Function(String?)? validator;
  final AutovalidateMode? autoValidateMode;
  final bool obscureText;
  final Function(String?)? onSaved;
  final TextInputType? keyboardType; 
  final Widget? suffix;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autoValidateMode,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: Colors.red)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(50)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.teal),
            borderRadius: BorderRadius.circular(50),
          ),
          suffixIcon: suffix,
          labelText: labelText,
          hintText: hintText,
),
      onSaved: onSaved,
      obscureText: obscureText,
      validator: validator,
      keyboardType: keyboardType,
    );
  }
}
