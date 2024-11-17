import 'package:first_app/core/constant/components/custom_text.dart';
import 'package:first_app/presentation/controller/categort-of_prodect/cubit/category_of_prodect_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RowFiltering extends StatelessWidget {
  const RowFiltering({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryOfProdectCubit, CategoryOfProdectState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: 45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    context
                        .read<CategoryOfProdectCubit>()
                        .navigateToFilterscreen(context);
                  },
                  child: const SizedBox(
                    child: Row(
                      children: [
                        Icon(
                          Icons.filter_alt_outlined,
                        ),
                        AppText(
                          text: "Filters",
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  child: Row(
                    children: [
                      Icon(
                        Icons.menu_open_rounded,
                      ),
                      AppText(
                        text: "Short",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
