import 'package:first_app/core/constant/app_colors.dart';
import 'package:first_app/core/constant/components/custom_text.dart';
import 'package:first_app/data/data_source/db.dart';
import 'package:first_app/data/data_source/local_data_source.dart';
import 'package:first_app/data/data_source/remote_data_source.dart';
import 'package:first_app/data/repository/cart_repo.dart';
import 'package:first_app/data/repository/cate_repo.dart';
import 'package:first_app/data/repository/prodect_repo.dart';
import 'package:first_app/domain/usecase/get_cart_from_remote.dart';
import 'package:first_app/domain/usecase/get_category.dart';
import 'package:first_app/domain/usecase/get_prodect.dart';
import 'package:first_app/domain/usecase/get_prodect_by_id.dart';
import 'package:first_app/presentation/controller/cart/cubit/cart_cubit.dart';
import 'package:first_app/presentation/controller/home/cubit/home_cubit.dart';
import 'package:first_app/presentation/controller/profile/cubit/profile_cubit.dart';
import 'package:first_app/presentation/ui/cart/cart.dart';
import 'package:first_app/presentation/ui/home/widgets/action_app_bar_home.dart';
import 'package:first_app/presentation/ui/home/widgets/custom_navigator_bar.dart';
import 'package:first_app/presentation/ui/home/widgets/home_view_body.dart';
import 'package:first_app/presentation/ui/wishlist/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../profile/profile.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (contextA) => HomeCubit(
            context: contextA,
            getProdect: GetProdect(ProdectRepo(RemoteDataSource())),
            getCategory: GetCategory(CategoryRepo(RemoteDataSource())),
          ),
        ),
        BlocProvider<CartCubit>(
          create: (contextA) => CartCubit(
            context: contextA,
            getProdectById: GetProdectById(ProdectRepo(RemoteDataSource())),
            getCartFromRemote: GetCartFromRemote(
              CartRepo(RemoteDataSource(), LocalDataSource(sqldb: SqlDb())),
            ),
          ),
        ),
        BlocProvider<ProfileCubit>(
          create: (context) => ProfileCubit(),
        ),
      ],
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.currentIndex == 1) {
            return const WishList();
          }
          if (state.currentIndex == 2) {
            return const MyCert();
          }
          if (state.currentIndex == 3) {
            return const Profile();
          } else {
            return SafeArea(
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  scrolledUnderElevation: 0,
                  backgroundColor: AppColor.splashColor,
                  title: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: "Good Morning!",
                        isBold: true,
                        fontSize: 25,
                      ),
                      AppText(
                        text: "Robert",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  actions: const [
                    ActionAppBarHome(),
                  ],
                ),
                body: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: HomeViewBody(),
                ),
                bottomNavigationBar: const CusttomBottomNavigatorBar(),
              ),
            );
          }
        },
      ),
    );
  }
}
