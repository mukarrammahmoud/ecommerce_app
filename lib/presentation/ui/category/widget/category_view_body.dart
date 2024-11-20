import 'package:first_app/core/enum/enum_status.dart';
import 'package:first_app/presentation/controller/category/cubit/category_cubit.dart';
import 'package:first_app/presentation/ui/category/widget/category_item.dart';
import 'package:first_app/presentation/ui/home/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoryViewBody extends StatelessWidget {
  const CategoryViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        bool isLoading = state.requestStatus == RequestStatus.loading &&
            state.prodects.isEmpty;

        return Skeletonizer(
          enabled: state.requestStatus == RequestStatus.loading ? true : false,
          child: CustomScrollView(
            slivers: [
              CustomSearchBar(
                onTapSearchField: () {},
                onPressedButtonVoice: () {
                  context
                      .read<CategoryCubit>()
                      .navigateToVoiceSearchPage(context);
                },
              ),
              SliverGrid.builder(
                itemCount: isLoading ? 6 : state.category.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 50,
                  crossAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  if (isLoading) {
                    return Skeletonizer(
                      enabled: true,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(100)),
                        margin: const EdgeInsets.all(8.0),
                      ),
                    );
                  } else {
                    return CategoryItems(
                      onTap: () {
                        context
                            .read<CategoryCubit>()
                            .navigateToProdectOfCategory(
                              context,
                              state.prodects.elementAt(index),
                              state.category[index],
                            );
                      },
                      index: index,
                      category: state.category.elementAt(index),
                    );
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
