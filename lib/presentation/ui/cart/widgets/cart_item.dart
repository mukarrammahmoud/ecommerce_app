// import 'package:first_app/core/constant/components/custom_button.dart';
// import 'package:first_app/core/constant/components/custom_text.dart';
// import 'package:first_app/core/constant/functions/buton.dart';
// import 'package:flutter/material.dart';

// class CartItem extends StatelessWidget {
//   const CartItem({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       margin: const EdgeInsets.all(5),
//       child: Row(
//         children: [
//           Expanded(
//             child: Image.asset(
//               "assets/image/shirt.png",
//               width: 30,
//               height: 50,
//             ),
//           ),
//           const Expanded(
//             flex: 1,
//             child: Column(
//               // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 AppText(
//                   text: "Mens Clothes",
//                 ),
//                 AppText(
//                   text: "Blue M",
//                 ),
//                 AppText(
//                   text: "\$99",
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//               child: Column(
//             children: [
//               const Icon(
//                 Icons.delete,
//                 color: Colors.red,
//               ),
//               CustomButton(
//                 marginHorizntal: 0,
//                 width: 0,
//                 color: const Color(0xffEEEEEE),
//                 onPressed: () {},
//                 title: Row(
//                   children: [
//                     buttonCart(
//                         icon: Icons.remove,
//                         onPressed: () {
//                           // context
//                           // .read<DetailsProdectCubit>()
//                           // .decreaseCounter();
//                         }),
//                     const AppText(text: "${1}"),
//                     buttonCart(
//                         icon: Icons.add,
//                         onPressed: () {
//                           //   context
//                           //       .read<DetailsProdectCubit>()
//                           //       .increaseCounter();
//                           //
//                         }),
//                   ],
//                 ),
//               ),
//             ],
//           ))
//         ],
//       ),
//     );
//   }
// }
import 'package:first_app/core/constant/components/custom_button.dart';
import 'package:first_app/core/constant/components/custom_text.dart';
import 'package:first_app/core/constant/functions/buton.dart';
import 'package:first_app/domain/entities/prodect_from_cart.dart';
import 'package:first_app/presentation/controller/cart/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.prodectFromCart,
    required this.index,
  });
  final ProdectFromCart prodectFromCart;
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Container(
          width: ScreenUtil().screenWidth,
          margin: EdgeInsets.all(5.w),
          child: Row(
            children: [
              Flexible(
                flex: 2,
                child: Image.asset(
                  "assets/image/shirt.png",
                  width: 80.w,
                  height: 100.h,
                  fit: BoxFit.contain,
                ),
              ),
              Flexible(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: "Mens Clothes",
                      fontSize: 16.sp,
                      isBold: true,
                    ),
                    AppText(
                      text: "Blue M",
                      fontSize: 14.sp,
                    ),
                    AppText(
                      text: "\$99",
                      fontSize: 16.sp,
                      isBold: true,
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    CustomButton(
                      marginHorizntal: 0,
                      color: const Color(0xffEEEEEE),
                      onPressed: () {},
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buttonCart(
                            icon: Icons.remove,
                            onPressed: () {
                              // context.read<CartCubit>().decreaseCounter();
                            },
                          ),
                          AppText(
                            text: "${prodectFromCart.quantity}",
                            fontSize: 18.sp,
                          ),
                          buttonCart(
                            icon: Icons.add,
                            onPressed: () {
                              // context.read<CartCubit>().increaseCounter(index);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
