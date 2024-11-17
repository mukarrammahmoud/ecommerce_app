import 'package:first_app/core/constant/components/item_of_prodect.dart';
import 'package:first_app/presentation/controller/home/cubit/home_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GridProdects extends StatelessWidget {
  const GridProdects({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return SliverGrid.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 0.7,
            mainAxisSpacing: 20,
            crossAxisSpacing: 16,
          ),
          itemCount: state.prodects.length,
          itemBuilder: (context, index) => ItemOfProdect(
            onTap: () {
              context
                  .read<HomeCubit>()
                  .onTapProdect(state.prodects.elementAt(index), context);
            },
            prodects: state.prodects.elementAt(index),
          ),
        );
      },
    );
  }
}
