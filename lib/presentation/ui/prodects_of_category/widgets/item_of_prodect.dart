import 'package:first_app/presentation/controller/categort-of_prodect/cubit/category_of_prodect_cubit.dart';
import 'package:first_app/presentation/ui/category/widget/row_of_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryProdect extends StatelessWidget {
  const CategoryProdect({
    super.key,
    required this.selectedFilter,
    required this.itemCount,
  });

  final int selectedFilter;
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return ListFiltringItem(
          index: index,
          text: context
              .read<CategoryOfProdectCubit>()
              .listTrendingProdects[index],
          selectedfilter: selectedFilter,
          onPressed: () {
            context.read<CategoryOfProdectCubit>().onSelectedItem(index);
          },
        );
      },
    );
  }
}
