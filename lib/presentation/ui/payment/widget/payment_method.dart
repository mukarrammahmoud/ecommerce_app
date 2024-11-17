import 'package:first_app/core/constant/app_colors.dart';
import 'package:first_app/core/constant/components/custom_text.dart';
import 'package:first_app/presentation/controller/payment/cubit/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PymentMethod extends StatelessWidget {
  const PymentMethod({
    required this.onChanged,
    required this.title,
    required this.index,
    required this.pathImage,
    super.key,
  });
  final String title;
  final int index;
  final String pathImage;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentCubit, PaymentState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 2,
                color: state.currentIndex == index
                    ? AppColor.priomaryColorApp
                    : AppColor.neutralsColor.withOpacity(0.5),
              )),
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColor.splashColor,
                      child: Image.asset(
                        pathImage,
                        height: 50,
                        fit: BoxFit.contain,
                        width: 50,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    AppText(
                      text: title,
                      isBold: true,
                    )
                  ],
                ),
              ),
              Radio(
                activeColor: AppColor.priomaryColorApp,
                value: title,
                groupValue: state.groupValue,
                onChanged: onChanged,
              ),
            ],
          ),
        );
      },
    );
  }
}
