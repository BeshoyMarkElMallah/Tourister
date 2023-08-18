import 'package:flutter/material.dart';
import 'package:tourister/core/utils/styles.dart';

class EmailTextFormInput extends StatelessWidget {
  const EmailTextFormInput({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      cursorColor: Colors.black,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'Email',
          hintStyle: Styles.textStyle16,
          filled: true,
          prefixIcon: const Icon(
            Icons.email,
            color: Colors.black,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.transparent),
          )),
    );
  }
}