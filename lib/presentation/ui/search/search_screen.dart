import 'package:first_app/core/constant/app_colors.dart';
import 'package:first_app/core/constant/components/custom_button.dart';
import 'package:first_app/core/constant/components/custom_text.dart';
import 'package:first_app/data/data_source/remote_data_source.dart';
import 'package:first_app/data/repository/cate_repo.dart';
import 'package:first_app/data/repository/prodect_repo.dart';
import 'package:first_app/domain/usecase/get_category.dart';
import 'package:first_app/domain/usecase/get_prodect.dart';
import 'package:first_app/presentation/controller/search/cubit/search_cubit.dart';
import 'package:first_app/presentation/ui/home/widgets/label_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchCubit>(
      create: (context) => SearchCubit(
        getProdect: GetProdect(
          ProdectRepo(
            RemoteDataSource(),
          ),
        ),
        getCategory: GetCategory(
          CategoryRepo(
            RemoteDataSource(),
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          centerTitle: false,
          elevation: 0,
          backgroundColor: AppColor.splashColor,
          title: const AppText(
            text: "Search",
            isBold: true,
            fontSize: 25,
          ),
        ),
        body: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          color: AppColor.splashColor,
                          child: DropdownButtonFormField(
                            value: state.valueDropDown,
                            onChanged: (value) {
                              context
                                  .read<SearchCubit>()
                                  .filtterProdectByCategory(value.toString());
                            },
                            items: state.category
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: AppText(text: e),
                                  ),
                                )
                                .toList(),
                            autofocus: true,
                            decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              prefixIcon: Icon(Icons.search,
                                  color:
                                      AppColor.neutralsColor.withOpacity(0.4)),
                              hintText: "Search your prodects",
                              hintStyle: TextStyle(
                                color: AppColor.neutralsColor.withOpacity(0.4),
                              ),
                              filled: true,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16.0 * 1.5, vertical: 16.0),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      CustomButton(
                        widthContainer: 70,
                        marginHorizntal: 0,
                        color: Colors.black,
                        onPressed: () {
                          context
                              .read<SearchCubit>()
                              .navigateToVoiceSearchPage(context);
                        },
                        title: const Icon(
                          Icons.keyboard_voice_outlined,
                          color: AppColor.splashColor,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                ),
                const LabelCategory(
                  title: "Recent Searching",
                  titleTow: "Clear All",
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 140,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: 7,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisExtent: 40,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.close,
                                  color: AppColor.splashColor,
                                ),
                              ),
                              const AppText(
                                text: "men dress",
                                fontSize: 12,
                                textColor: AppColor.splashColor,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const LabelCategory(title: "Trending Search"),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:

                        //  Skeletonizer(
                        //   enabled: state.requestStatus == RequestStatus.loading
                        //       ? true
                        //       : false,
                        //   child:

                        SizedBox(
                      height: MediaQuery.sizeOf(context).height / 3,
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 0.7,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 16,
                          ),
                          itemCount: state.prodects.length,
                          itemBuilder: (context, index) => SizedBox(
                                width: 140,
                                child: GestureDetector(
                                  onTap: () {
                                    context.read<SearchCubit>().onTapProdect(
                                        state.prodects.elementAt(index),
                                        context);
                                  },
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AspectRatio(
                                            aspectRatio: 1.02,
                                            child: Container(
                                              padding: const EdgeInsets.all(20),
                                              decoration: BoxDecoration(
                                                color: const Color(0xFF979797)
                                                    .withOpacity(0.1),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Image.network(
                                                  "${state.prodects.elementAt(index).image}"),
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            "${state.prodects.elementAt(index).title}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                            maxLines: 2,
                                          ),
                                          Text(
                                            "\$${state.prodects.elementAt(index).price}",
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFFFF7643),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Positioned(
                                        top: 10,
                                        right: 10,
                                        child: InkWell(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          onTap: () {},
                                          child: Container(
                                            padding: const EdgeInsets.all(6),
                                            height: 40,
                                            width: 40,
                                            decoration: const BoxDecoration(
                                              color: AppColor.splashColor,
                                              shape: BoxShape.circle,
                                            ),
                                            child: const Icon(
                                              Icons.favorite,
                                              color: AppColor.priomaryColorApp,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                    ),
                  ),
                ),
                // ),
              ],
            );
          },
        ),
      ),
    );
  }
}
