import 'package:flutter/material.dart';
import 'package:tourister/Features/home/presentation/views/widgets/categories_list_view_item.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
    required this.data,
  });

  final List<Map<String, Object>> data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .1,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return CategoriesListViewItem(
              img: data[index]['img'] as String,
              isSelected: data[index]['isSelected'] as bool,
              title: data[index]['title'] as String,
            );
          }),
    );
  }
}
