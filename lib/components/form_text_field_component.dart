import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {

  final String? labelText;
  final String? hintText;
  final TextEditingController? textController;
  final bool? obscureText;
  final String? Function(String?)? inputValidator;
  final Icon? iconInput;

  const FormTextField({
    super.key, 
    this.labelText, 
    this.hintText, 
    this.obscureText, 
    this.textController, 
    this.inputValidator, 
    this.iconInput
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.1,
        vertical: 10
      ),
      child: TextFormField(
        controller: textController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: labelText,
          hintText:  hintText,
          prefixIcon: iconInput,
        ),
        validator:  inputValidator,
        obscureText: obscureText ?? false,
      ),
    );
  }
}
