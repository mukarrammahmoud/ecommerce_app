import 'package:first_app/core/constant/app_colors.dart';
import 'package:first_app/core/constant/components/custom_button.dart';
import 'package:first_app/core/constant/components/custom_text.dart';
import 'package:first_app/core/root/app_route.dart';
import 'package:first_app/data/data_source/db.dart';
import 'package:first_app/data/data_source/local_data_source.dart';
import 'package:first_app/data/data_source/remote_data_source.dart';
import 'package:first_app/data/repository/cart_repo.dart';
import 'package:first_app/data/repository/prodect_repo.dart';
import 'package:first_app/domain/usecase/get_cart_from_remote.dart';
import 'package:first_app/domain/usecase/get_prodect_by_id.dart';
import 'package:first_app/presentation/controller/cart/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widget/item_checkout.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartCubit>(
      create: (contextA) => CartCubit(
        context: contextA,
        getProdectById: GetProdectById(ProdectRepo(RemoteDataSource())),
        getCartFromRemote: GetCartFromRemote(
          CartRepo(RemoteDataSource(), LocalDataSource(sqldb: SqlDb())),
        ),
      ),
      child: WillPopScope(
        onWillPop: () async {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(AppRoot.home, (route) => false);

          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            title: const AppText(
              text: "Checkout",
              isBold: true,
              fontSize: 20,
            ),
          ),
          body: Stack(
            children: [
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          text: "Your Access",
                          fontSize: 20,
                          isBold: true,
                        ),
                        Icon(
                          Icons.edit_note_outlined,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      // physics: const NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return const ItemChecOut();
                      },
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  color: AppColor.splashColor,
                  width: MediaQuery.sizeOf(context).width,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BlocBuilder<CartCubit, CartState>(
                          builder: (context, state) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ContainerCheckOut(
                                    days: '7-10',
                                    groupValue: state.groupValue,
                                    onChanged: (val) {
                                      context
                                          .read<CartCubit>()
                                          .onSelectTypeDelvery(val!);
                                    },
                                    title: "Standerd",
                                    price: '20'),
                                ContainerCheckOut(
                                    groupValue: state.groupValue,
                                    days: '2-4',
                                    onChanged: (val) {
                                      context
                                          .read<CartCubit>()
                                          .onSelectTypeDelvery(val!);
                                    },
                                    title: "Fast",
                                    price: '90'),
                              ],
                            );
                          },
                        ),
                      ),
                      BlocBuilder<CartCubit, CartState>(
                        builder: (context, state) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomButton(
                                colorBorder: Colors.black,
                                color: AppColor.splashColor,
                                marginHorizntal: 0,
                                onPressed: () {},
                                title: const AppText(
                                  text: "Clear All",
                                  textColor: Colors.black,
                                ),
                              ),
                              CustomButton(
                                marginHorizntal: 0,
                                onPressed: () {
                                  context
                                      .read<CartCubit>()
                                      .navigateToPaymentPage(context);
                                },
                                title: const AppText(
                                  text: "CheckOut",
                                  textColor: AppColor.splashColor,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContainerCheckOut extends StatelessWidget {
  const ContainerCheckOut({
    super.key,
    required this.onChanged,
    required this.title,
    required this.days,
    required this.price,
    required this.groupValue,
  });
  final String title;
  final String price;
  final String days;
  final String groupValue;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width / 2.5,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          AppText(
            text: title,
            isBold: true,
          ),
          Row(
            children: [
              const Icon(Icons.delivery_dining_rounded),
              AppText(
                text: "$days Days",
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                text: "\$ $price",
              ),
              Radio(
                activeColor: AppColor.priomaryColorApp,
                value: title,
                groupValue: groupValue,
                onChanged: onChanged,
              )
            ],
          ),
        ],
      ),
    );
  }
}
