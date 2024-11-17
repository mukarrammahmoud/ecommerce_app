import 'package:first_app/core/constant/components/no_connection.dart';
import 'package:first_app/domain/entities/prodect.dart';
import 'package:first_app/presentation/ui/category/category.dart';
import 'package:first_app/presentation/ui/category/filter.dart';
import 'package:first_app/presentation/ui/checkout/checkout.dart';
import 'package:first_app/presentation/ui/congratulations/congartulation_page.dart';
import 'package:first_app/presentation/ui/home/home.dart';
import 'package:first_app/presentation/ui/login/login.dart';
import 'package:first_app/presentation/ui/notifications/show_notification.dart';
import 'package:first_app/presentation/ui/onboarding.dart';
import 'package:first_app/presentation/ui/orders/order_history/order_history.dart';
import 'package:first_app/presentation/ui/orders/order_tracking/order_tracking.dart';
import 'package:first_app/presentation/ui/payment/payment.dart';
import 'package:first_app/presentation/ui/prodect_details/prodect_details.dart';
import 'package:first_app/presentation/ui/prodects_of_category/prodect_of_category.dart';
import 'package:first_app/presentation/ui/profile/edit_profile.dart';
import 'package:first_app/presentation/ui/profile/profile.dart';
import 'package:first_app/presentation/ui/search/search_screen.dart';
import 'package:first_app/presentation/ui/sign/sign.dart';
import 'package:first_app/presentation/ui/splash_screen.dart';
import 'package:first_app/presentation/ui/voice_search/voice_search.dart';
import 'package:first_app/presentation/ui/wishlist/wishlist.dart';
import 'package:flutter/material.dart';

import 'app_route.dart';

class OnGenerateRoot {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoot.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case AppRoot.home:
        return MaterialPageRoute(
          builder: (context) => const MyHomePage(),
        );
      case AppRoot.prodectDetails:
        Prodects prodects = routeSettings.arguments as Prodects;
        return MaterialPageRoute(
          builder: (context) => ProdectDetails(
            prodects: prodects,
          ),
        );
      case AppRoot.prodectOfCategory:
        String categoryName = routeSettings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => ProdectOfCategory(
            categoryName: categoryName,
          ),
        );
      case AppRoot.category:
        return MaterialPageRoute(
          builder: (context) => const CategoryScreen(),
        );
      case AppRoot.wishList:
        return MaterialPageRoute(
          builder: (context) => const WishList(),
        );
      case AppRoot.checkOut:
        return MaterialPageRoute(
          builder: (context) => const CheckOut(),
        );
      case AppRoot.noConnection:
        return MaterialPageRoute(
          builder: (context) => const NoconnectionScreen(),
        );
      case AppRoot.notification:
        return MaterialPageRoute(
          builder: (context) => const ShowNotifications(),
        );
      case AppRoot.voiceSearch:
        return MaterialPageRoute(
          builder: (context) => const VoiceSearch(),
        );
      case AppRoot.profile:
        return MaterialPageRoute(
          builder: (context) => const Profile(),
        );
      case AppRoot.search:
        return MaterialPageRoute(
          builder: (context) => const SearchScreen(),
        );
      case AppRoot.login:
        return MaterialPageRoute(
          builder: (context) => const Login(),
        );
      case AppRoot.payment:
        return MaterialPageRoute(
          builder: (context) => const PaymentPage(),
        );
      case AppRoot.done:
        return MaterialPageRoute(
          builder: (context) => const CongratulationPage(),
        );
      case AppRoot.eidtProfile:
        return MaterialPageRoute(
          builder: (context) => const EditProfle(),
        );
      case AppRoot.orderHistory:
        return MaterialPageRoute(
          builder: (context) => const OrderHistory(),
        );
      case AppRoot.orderTracking:
        return MaterialPageRoute(
          builder: (context) => const OrderTracking(),
        );
      case AppRoot.sign:
        return MaterialPageRoute(
          builder: (context) => const Sign(),
        );
      case AppRoot.filterScreen:
        return MaterialPageRoute(
          builder: (context) => const FilterScreen(),
        );
      case AppRoot.onBoarding:
        return MaterialPageRoute(
          builder: (context) => const OnBoarding(),
        );
    }
    return null;
  }
}
