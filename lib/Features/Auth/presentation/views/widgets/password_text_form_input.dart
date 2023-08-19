import 'package:flutter/material.dart';
import 'package:tourister/core/utils/styles.dart';

class PasswordTextFormInput extends StatefulWidget {
  PasswordTextFormInput({
    super.key,
    required this.passController,
  });

  final TextEditingController passController;

  @override
  State<PasswordTextFormInput> createState() => _PasswordTextFormInputState();
}

class _PasswordTextFormInputState extends State<PasswordTextFormInput> {
  bool obscureVar = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.passController,
      cursorColor: Colors.black,
      keyboardType: TextInputType.emailAddress,
      obscureText: obscureVar,
      decoration: InputDecoration(
          hintText: 'Password',
          hintStyle: Styles.textStyle16,
          filled: true,
          prefixIcon: const Icon(
            Icons.lock,
          ),
          prefixIconColor: MaterialStateColor.resolveWith((states) =>
              states.contains(MaterialState.focused)
                  ? Colors.black
                  : Colors.grey),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                obscureVar = !obscureVar;
              });
            },
            icon: Icon(
              obscureVar == false ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
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
