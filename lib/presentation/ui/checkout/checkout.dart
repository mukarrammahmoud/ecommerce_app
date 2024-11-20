import 'package:first_app/core/constant/app_colors.dart';
import 'package:first_app/core/constant/components/custom_button.dart';
import 'package:first_app/core/constant/components/custom_text.dart';
import 'package:first_app/data/data_source/db.dart';
import 'package:first_app/data/data_source/local_data_source.dart';
import 'package:first_app/data/data_source/remote_data_source.dart';
import 'package:first_app/data/repository/cart_repo.dart';
import 'package:first_app/data/repository/prodect_repo.dart';
import 'package:first_app/domain/usecase/get_cart_from_remote.dart';
import 'package:first_app/domain/usecase/get_prodect_by_id.dart';
import 'package:first_app/presentation/controller/cart/cubit/cart_cubit.dart';
import 'package:first_app/presentation/ui/home/widgets/label_category.dart';
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
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 243, 242, 242),
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: const AppText(
            text: "Checkout",
            isBold: true,
            fontSize: 20,
          ),
        ),
        body: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: Padding(
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
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColor.neutralsColor.withOpacity(.2),
                    )),
                child: ListTile(
                  title: const AppText(
                    text: "Floyd Miles",
                    isBold: true,
                  ),
                  subtitle: AppText(
                    text: "2434 33 Dr.sole ,South Amerca  3929",
                    textColor: AppColor.neutralsColor.withOpacity(.3),
                  ),
                  leading: const Icon(
                    Icons.location_pin,
                    color: AppColor.priomaryColorApp,
                    size: 25,
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: LabelCategory(
                title: "Prodects",
              ),
            ),
            SliverList.builder(
              // shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return const ItemChecOut();
              },
            ),
            SliverToBoxAdapter(
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
                                  index: 0,
                                  isSelected: state.isSelcted,
                                  days: '7-10',
                                  groupValue: state.groupValue,
                                  onChanged: (val) {
                                    context
                                        .read<CartCubit>()
                                        .onSelectTypeDelvery(val!, 0);
                                  },
                                  title: "Standerd",
                                  price: '20'),
                              ContainerCheckOut(
                                  index: 1,
                                  isSelected: state.isSelcted,
                                  groupValue: state.groupValue,
                                  days: '2-4',
                                  onChanged: (val) {
                                    context
                                        .read<CartCubit>()
                                        .onSelectTypeDelvery(val!, 1);
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
    required this.isSelected,
    required this.index,
  });
  final String title;
  final String price;
  final String days;
  final String groupValue;
  final int isSelected;
  final int index;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width / 2.5,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
            color: isSelected != index
                ? Colors.black12
                : AppColor.priomaryColorApp),
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
