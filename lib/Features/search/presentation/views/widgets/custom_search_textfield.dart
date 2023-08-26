import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourister/Features/search/presentation/manager/cubits/search_cubit/search_cubit.dart';
import 'package:tourister/constants.dart';
import 'package:tourister/core/utils/styles.dart';

class CustomSearchTextField extends StatelessWidget {
  CustomSearchTextField({super.key, this.onChanged});

  final Function(String)? onChanged;
  TextEditingController searchController = TextEditingController();
  // FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextField(
        onSubmitted: (value) {
          BlocProvider.of<SearchCubit>(context).searchPlace(value);
        },
        cursorColor: kSecondaryColor,
        decoration: InputDecoration(
          focusColor: kSecondaryColor,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: kSecondaryColor)),
          hintText: 'Search',
          hintStyle: Styles.textStyle14
              .copyWith(color: Colors.grey, fontWeight: FontWeight.w500),
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: kSecondaryColor)),
        ),
      ),
    );
  }
}
