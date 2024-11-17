import 'package:first_app/core/constant/app_colors.dart';
import 'package:first_app/core/constant/components/custom_button.dart';
import 'package:first_app/core/constant/components/custom_text.dart';
import 'package:first_app/core/constant/functions/buton.dart';
import 'package:first_app/core/enum/enum_status.dart';
import 'package:first_app/data/data_source/local_data_source.dart';
import 'package:first_app/data/data_source/remote_data_source.dart';
import 'package:first_app/data/data_source/db.dart';

import 'package:first_app/data/repository/cart_repo.dart';
import 'package:first_app/domain/entities/prodect.dart';
import 'package:first_app/domain/usecase/add_to_cart.dart';
import 'package:first_app/domain/usecase/get_cart_from_local.dart';
import 'package:first_app/presentation/controller/details_prodect/cubit/details_prodect_cubit.dart';
import 'package:first_app/presentation/ui/prodect_details/widget/card_colors.dart';
import 'package:first_app/presentation/ui/home/widgets/label_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProdectDetails extends StatelessWidget {
  const ProdectDetails({required this.prodects, super.key});
  final Prodects prodects;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsProdectCubit(
        addToCart: AddToCart(
          CartRepo(
            RemoteDataSource(),
            LocalDataSource(sqldb: SqlDb()),
          ),
        ),
        getCartFromLocal: GetCartFromLocal(
          CartRepo(
            RemoteDataSource(),
            LocalDataSource(sqldb: SqlDb()),
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: const AppText(
            text: "Prodect Details",
            isBold: true,
            fontSize: 25,
          ),
          actions: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.file_upload_outlined,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_border,
                  ),
                ),
              ],
            ),
          ],
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .4,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Stack(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.sizeOf(context).height * .5,
                                  padding: const EdgeInsets.all(5),
                                  child: Image.network(prodects.image!,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              .5),
                                ),
                                Positioned(
                                  top: 30,
                                  child: CustomButton(
                                    onPressed: () {},
                                    title: const AppText(text: "-50 %"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(3),
                                  child: Image.network(
                                    prodects.image!,
                                    height:
                                        MediaQuery.sizeOf(context).height * .1,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Image.network(
                                    prodects.image!,
                                    height:
                                        MediaQuery.sizeOf(context).height * .2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppText(
                      text: prodects.title!,
                      isBold: true,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: AppColor.warrningColor,
                              size: 25,
                            ),
                            AppText(text: "${prodects.rating!.rate!}"),
                            const AppText(text: "  -  (220) Review")
                          ],
                        )),
                        const Expanded(child: SizedBox()),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    BlocSelector<DetailsProdectCubit, DetailsProdectState,
                        bool>(
                      selector: (state) {
                        return state.isReadMore;
                      },
                      builder: (context, isReadeMore) {
                        return InkWell(
                          onTap: () => context
                              .read<DetailsProdectCubit>()
                              .onTapReadMore(),
                          child: Wrap(
                            children: [
                              AppText(
                                maxLine: isReadeMore ? 2 : 100,
                                text: prodects.description!,
                                textColor:
                                    AppColor.neutralsColor.withOpacity(0.6),
                              ),
                              AppText(
                                text: isReadeMore ? "Show More" : "Show Less",
                                textColor: AppColor.priomaryColorApp,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    BlocBuilder<DetailsProdectCubit, DetailsProdectState>(
                      builder: (context, state) {
                        return Row(
                          children: [
                            Expanded(
                              child: Wrap(
                                children: [
                                  AppText(
                                    text:
                                        "${(prodects.price! * state.countItem).toStringAsFixed(2)}    ",
                                    textColor: AppColor.priomaryColorApp,
                                    fontSize: 25.w,
                                  ),
                                  AppText(
                                    decoration: TextDecoration.lineThrough,
                                    text: "${state.countItem * 100}",
                                    // overflow: TextOverflow.ellipsis,
                                    textColor: Colors.black,
                                    fontSize: 20.spMin,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: CustomButton(
                                marginHorizntal: 0,
                                width: 0,
                                widthContainer: 0,
                                color: const Color(0xffEEEEEE),
                                onPressed: () {},
                                title: Wrap(
                                  children: [
                                    buttonCart(
                                        icon: Icons.remove,
                                        onPressed: () {
                                          context
                                              .read<DetailsProdectCubit>()
                                              .decreaseCounter();
                                        }),
                                    AppText(
                                      text: "${state.countItem}",
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    buttonCart(
                                        icon: Icons.add,
                                        onPressed: () {
                                          context
                                              .read<DetailsProdectCubit>()
                                              .increaseCounter();
                                        }),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    const LabelCategory(
                      title: "Select Color",
                      titleTow: "",
                    ),
                    const CardColors(),
                    const SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),
            BlocSelector<DetailsProdectCubit, DetailsProdectState, bool>(
              selector: (state) {
                return state.isIntenetConection;
              },
              builder: (context, state) {
                return Positioned(
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    color: AppColor.splashColor,
                    width: MediaQuery.sizeOf(context).width,
                    child: state == false
                        ? const Center(
                            child: AppText(
                              text: 'No Internet Connection',
                              textColor: AppColor.errorColor,
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              BlocBuilder<DetailsProdectCubit,
                                  DetailsProdectState>(
                                builder: (context, state) {
                                  return CustomButton(
                                    color: const Color(0xffEEEEEE),
                                    onPressed: () {
                                      context
                                          .read<DetailsProdectCubit>()
                                          .addToMyCart(prodects, context);
                                    },
                                    title: state.requestStatus ==
                                            RequestStatus.loading
                                        ? const Center(
                                            child: CircularProgressIndicator(
                                                color:
                                                    AppColor.priomaryColorApp),
                                          )
                                        : const AppText(
                                            text: "Add TO Cart",
                                            textColor:
                                                Color.fromARGB(255, 10, 0, 0),
                                            isBold: true,
                                          ),
                                  );
                                },
                              ),
                              CustomButton(
                                onPressed: () {},
                                title: const AppText(
                                  text: "By Now",
                                  isBold: true,
                                  textColor: AppColor.splashColor,
                                ),
                              ),
                            ],
                          ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
