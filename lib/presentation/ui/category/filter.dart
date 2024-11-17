import 'package:first_app/data/data_source/remote_data_source.dart';
import 'package:first_app/data/repository/prodect_repo.dart';
import 'package:first_app/domain/usecase/get_prodect.dart';
import 'package:first_app/presentation/controller/category/cubit/category_cubit.dart';
import 'package:first_app/presentation/ui/category/widget/filter_view_body.dart';
import 'package:first_app/presentation/ui/orders/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit(
        getProdect: GetProdect(
          ProdectRepo(
            RemoteDataSource(),
          ),
        ),
      ),
      child: Scaffold(
        appBar: customAppBar(
          title: "Filter",
        ),
        body: const FilterViewBody(),
      ),
    );
  }
}
