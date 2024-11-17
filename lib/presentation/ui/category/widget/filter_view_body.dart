import 'package:first_app/core/constant/components/bottom_row_buttons.dart';
import 'package:first_app/core/constant/components/custom_text.dart';
import 'package:first_app/presentation/controller/category/cubit/category_cubit.dart';
import 'package:first_app/presentation/ui/category/widget/price_range.dart';
import 'package:first_app/presentation/ui/category/widget/row_of_color.dart';
import 'package:first_app/presentation/ui/home/widgets/label_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterViewBody extends StatelessWidget {
  const FilterViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              flex: 4,
              child: CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: AppText(
                        text: "Price Range",
                        isBold: true,
                      ),
                    ),
                  ),
                  PriceRange(
                    values: state.rangeValue,
                    onChanged: (rangeValue) {
                      context
                          .read<CategoryCubit>()
                          .onChangeValueSlider(rangeValue);
                    },
                  ),
                  const SliverToBoxAdapter(
                    child: LabelCategory(title: "Categories"),
                  ),
                  SliverGrid.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisExtent: 40,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: state.cate.length,
                    itemBuilder: (context, index) => ListFiltringItem(
                      text: state.cate[index],
                      index: index,
                      selectedfilter: state.selectedfilter,
                      onPressed: () {
                        context
                            .read<CategoryCubit>()
                            .selcetItemToFilterCategory(index);
                      },
                    ),
                  ),
                  const SliverToBoxAdapter(
                      child: LabelCategory(title: "Brands")),
                  SliverGrid.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisExtent: 40,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: context
                        .read<CategoryCubit>()
                        .listFilteringBrands
                        .length,
                    itemBuilder: (context, index) => ListFiltringItem(
                      text: context
                          .read<CategoryCubit>()
                          .listFilteringBrands[index],
                      index: index,
                      selectedfilter: state.selectedfilterBrands,
                      onPressed: () {
                        context
                            .read<CategoryCubit>()
                            .selcetItemToFilterBrands(index);
                      },
                    ),
                  ),
                  const SliverToBoxAdapter(
                      child: LabelCategory(title: "Colors")),
                  SliverToBoxAdapter(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          context.read<CategoryCubit>().colorsFilter.length,
                          (index) => RowOfColor(
                            index: index,
                            onTapColor: () {
                              context
                                  .read<CategoryCubit>()
                                  .onSelectedColor(index);
                            },
                            indexColor: state.selectedColorIndex,
                            containerColor: context
                                .read<CategoryCubit>()
                                .colorsFilter[index],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomRowButtons(
              onPressedOne: () {
                context.read<CategoryCubit>().clearCategory();
              },
              onPressedTow: () {},
              textOTow: "Apply",
              textOne: 'Clear All',
            )
          ],
        );
      },
    );
  }
}
