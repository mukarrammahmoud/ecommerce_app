import 'package:first_app/presentation/controller/categort-of_prodect/cubit/category_of_prodect_cubit.dart';
import 'package:first_app/presentation/controller/home/cubit/home_cubit.dart';
import 'package:first_app/presentation/ui/category/widget/row_of_color.dart';
import 'package:first_app/presentation/ui/home/widgets/custom_search_bar.dart';
import 'package:first_app/presentation/ui/home/widgets/grid_of_prodects.dart';
import 'package:first_app/presentation/ui/home/widgets/item_category.dart';
import 'package:first_app/presentation/ui/home/widgets/label_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: Skeletonizer(
                enabled: prodect == null ? true : false,
                child: CustomScrollView(
                  slivers: [
                    CustomSearchBar(
                      onPressedButtonVoice: () {
                        context
                            .read<HomeCubit>()
                            .navigateToVoiceSearchPage(context);
                      },
                      onTapSearchField: () {
                        context.read<HomeCubit>().navigateToSearchPage(context);
                      },
                    ),
                    SliverToBoxAdapter(
                      child: LabelCategory(
                        onTap: () {
                          context
                              .read<HomeCubit>()
                              .navigateToCategoryPage(context);
                        },
                        title: "Categories",
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            state.prodects.length,
                            (index) => ItemOfCategory(
                              title: "Category",
                              pathImage: state.prodects[index].image!,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: LabelCategory(
                        title: "Trending Prodects",
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            state.category.length,
                            (index) {
                              return ListFiltringItem(
                                index: index,
                                text: state.category[index],
                                selectedfilter: state.selectedItemIndex,
                                onPressed: () {
                                  context
                                      .read<HomeCubit>()
                                      .filtterProdectByCategory(
                                          state.category[index]);
                                  context
                                      .read<HomeCubit>()
                                      .onSelectedItemTrending(index);
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    const GridProdects(),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
