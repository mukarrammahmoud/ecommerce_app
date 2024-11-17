import 'package:first_app/core/constant/components/item_of_prodect.dart';
import 'package:first_app/core/enum/enum_status.dart';
import 'package:first_app/data/data_source/remote_data_source.dart';
import 'package:first_app/data/repository/prodect_repo.dart';
import 'package:first_app/domain/usecase/get_prodect.dart';
import 'package:first_app/presentation/controller/categort-of_prodect/cubit/category_of_prodect_cubit.dart';
import 'package:first_app/presentation/ui/orders/widgets/custom_appbar.dart';
import 'package:first_app/presentation/ui/prodects_of_category/widgets/item_of_prodect.dart';
import 'package:first_app/presentation/ui/prodects_of_category/widgets/row_filtering.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProdectOfCategory extends StatelessWidget {
  const ProdectOfCategory({super.key, required this.categoryName});
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoryOfProdectCubit>(
      create: (context) => CategoryOfProdectCubit(
        categoryName: categoryName,
        getProdect: GetProdect(ProdectRepo(RemoteDataSource())),
      ),
      child: Scaffold(
        appBar: customAppBar(title: categoryName),
        body: BlocBuilder<CategoryOfProdectCubit, CategoryOfProdectState>(
          builder: (context, state) {
            bool isLoading = state.requestStatus == RequestStatus.loading &&
                state.prodects.isEmpty;

            return Column(
              children: [
                SizedBox(
                  height: 45,
                  child: Skeletonizer(
                    enabled: state.requestStatus == RequestStatus.loading
                        ? true
                        : false,
                    child: CategoryProdect(
                      selectedFilter: state.selectedItemIndex,
                      itemCount: context
                          .read<CategoryOfProdectCubit>()
                          .listTrendingProdects
                          .length,
                    ),
                  ),
                ),
                const RowFiltering(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 0.7,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 16,
                      ),
                      itemCount: isLoading ? 10 : state.prodects.length,
                      itemBuilder: (context, index) {
                        if (isLoading) {
                          return Skeletonizer(
                            enabled: true,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(8)),
                              margin: const EdgeInsets.all(8.0),
                            ),
                          );
                        } else {
                          return ItemOfProdect(
                            onTap: () {
                              context
                                  .read<CategoryOfProdectCubit>()
                                  .onTapProdect(
                                      state.prodects.elementAt(index), context);
                            },
                            prodects: state.prodects.elementAt(index),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
