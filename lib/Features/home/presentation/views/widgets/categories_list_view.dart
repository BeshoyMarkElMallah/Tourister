import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourister/Features/home/presentation/manager/cubits/pages_data_cubit/pages_data_cubit.dart';
import 'package:tourister/Features/home/presentation/views/widgets/categories_list_view_item.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({
    super.key,
    required this.data,
    required this.controller,
  });

  final List<Map<String, Object>> data;
  final PageController controller;

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .1,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: widget.data.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                widget.controller.animateToPage(index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn);
                setState(() {
                  widget.data.forEach((element) {
                    element['isSelected'] = false;
                  });
                  widget.data[index]['isSelected'] = true;
                  BlocProvider.of<PagesDataCubit>(context)
                      .getDataWithCategories(
                          widget.data[index]['title'] as String);
                });
              },
              child: CategoriesListViewItem(
                img: widget.data[index]['img'] as String,
                isSelected: widget.data[index]['isSelected'] as bool,
                title: widget.data[index]['title'] as String,
              ),
            );
          }),
    );
  }
}
