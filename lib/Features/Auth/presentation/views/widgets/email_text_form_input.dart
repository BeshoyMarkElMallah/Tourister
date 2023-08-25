import 'package:flutter/material.dart';
import 'package:tourister/core/utils/styles.dart';

// ignore: must_be_immutable
class EmailTextFormInput extends StatelessWidget {
  EmailTextFormInput({super.key, this.onChanged});
  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your email';
        }
        return null;
      },
      onChanged: onChanged,
      cursorColor: Colors.black,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'Email',
          hintStyle: Styles.textStyle16,
          filled: true,
          prefixIcon: const Icon(
            Icons.email,
          ),
          prefixIconColor: MaterialStateColor.resolveWith((states) =>
              states.contains(MaterialState.focused)
                  ? Colors.black
                  : Colors.grey),
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
