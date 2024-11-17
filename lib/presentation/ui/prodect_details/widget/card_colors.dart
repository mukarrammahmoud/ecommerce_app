import 'package:first_app/core/constant/app_colors.dart';
import 'package:first_app/presentation/controller/details_prodect/cubit/details_prodect_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardColors extends StatelessWidget {
  const CardColors({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsProdectCubit, DetailsProdectState>(
      builder: (context, state) {
        return SizedBox(
            height: 60,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        // print(state.selectedColorIndex);
                     
                        context.read<DetailsProdectCubit>().selcetColor(index);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        height: 20,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: context
                                .read<DetailsProdectCubit>()
                                .colorsProdect[index],
                            border: Border.all(
                                width: 2,
                                color: state.selectedColorIndex == index
                                    ? AppColor.priomaryColorApp
                                    : AppColor.neutralsColor)),
                      ),
                    )));
      },
    );
  }
}
