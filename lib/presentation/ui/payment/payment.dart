import 'package:dotted_border/dotted_border.dart';
import 'package:first_app/core/constant/app_colors.dart';
import 'package:first_app/core/constant/components/custom_button.dart';
import 'package:first_app/core/constant/components/custom_text.dart';
import 'package:first_app/presentation/controller/payment/cubit/payment_cubit.dart';
import 'package:first_app/presentation/ui/payment/widget/payment_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PaymentCubit>(
      create: (context) => PaymentCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const AppText(
            text: "Payment Method",
            fontSize: 20,
            isBold: true,
          ),
        ),
        body: BlocBuilder<PaymentCubit, PaymentState>(
          builder: (context, state) {
            return Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: context
                            .read<PaymentCubit>()
                            .itemPaymentMethod
                            .length,
                        itemBuilder: (context, index) => PymentMethod(
                          index: index,
                          pathImage: context
                              .read<PaymentCubit>()
                              .itemPaymentMethod[index]['pathImage'],
                          title: context
                              .read<PaymentCubit>()
                              .itemPaymentMethod[index]['title'],
                          onChanged: (val) {
                            context
                                .read<PaymentCubit>()
                                .onSelectTypePaymentMethod(val!, index);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    color: AppColor.splashColor,
                    width: MediaQuery.sizeOf(context).width,
                    child: Column(
                      children: [
                        DottedBorder(
                          dashPattern: const [8, 6],
                          padding: const EdgeInsets.all(10),
                          borderType: BorderType.RRect,
                          stackFit: StackFit.loose,
                          radius: const Radius.circular(10),
                          color: AppColor.neutralsColor.withOpacity(0.4),
                          strokeWidth: 1,
                          child: CustomButton(
                            color: AppColor.splashColor,
                            onPressed: () {},
                            title: Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.add_circle_outline_outlined,
                                    color: AppColor.priomaryColorApp,
                                    size: 30,
                                  ),
                                ),
                                const AppText(
                                  text: 'Add Card',
                                  fontSize: 20,
                                  isBold: true,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 20, top: 10),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            border: Border.all(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  AppText(
                                    text: "SubTotal (3)",
                                  ),
                                  AppText(
                                    text: "\$992.43",
                                    isBold: true,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  AppText(
                                    text: "Shipping",
                                  ),
                                  AppText(
                                    text: "\$992.43",
                                    isBold: true,
                                  ),
                                ],
                              ),
                              Divider(
                                color: Colors.black12,
                                thickness: 2,
                                height: 10,
                                indent: 20,
                                endIndent: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  AppText(
                                    text: "Total (3 Item)",
                                  ),
                                  AppText(
                                    text: "\$992.43",
                                    textColor: AppColor.priomaryColorApp,
                                    isBold: true,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        BlocBuilder<PaymentCubit, PaymentState>(
                          builder: (context, state) {
                            return CustomButton(
                              color: AppColor.priomaryColorApp,
                              marginHorizntal: 0,
                              onPressed: () {
                                context
                                    .read<PaymentCubit>()
                                    .navigateToDonePage(context);
                              },
                              title: const AppText(
                                text: "PayNow",
                                textColor: AppColor.splashColor,
                              ),
                            );
                          },
                        ),
                      ],
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
