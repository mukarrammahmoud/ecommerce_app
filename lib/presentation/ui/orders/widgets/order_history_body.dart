import 'package:first_app/core/constant/app_colors.dart';
import 'package:first_app/core/constant/app_image.dart';
import 'package:first_app/core/constant/components/custom_text.dart';
import 'package:first_app/presentation/ui/orders/widgets/row_item_order.dart';
import 'package:flutter/material.dart';

class OrderHistoryBody extends StatelessWidget {
  const OrderHistoryBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: Image.asset(AppImages.card)),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: AppText(
              text: "Transictions",
              isBold: true,
              fontSize: 20,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppText(
              text: "Today",
              isBold: true,
              textColor: AppColor.neutralsColor.withOpacity(.5),
            ),
          ),
        ),
        SliverList.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  width: 2,
                  color: AppColor.neutralsColor.withOpacity(.4),
                ),
              ),
              child: RowItemInOrder(
                trailing: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: index % 2 == 0
                          ? AppColor.errorColor.withOpacity(.3)
                          : AppColor.successColor.withOpacity(.3),
                      borderRadius: BorderRadius.circular(10)),
                  child: Wrap(
                    children: [
                      Icon(
                        index % 2 == 0
                            ? Icons.arrow_downward_outlined
                            : Icons.arrow_upward_outlined,
                        color: index % 2 == 0
                            ? AppColor.errorColor
                            : AppColor.successColor,
                      ),
                      const AppText(
                        text: '32.5',
                      ),
                    ],
                  ),
                ),
                leading: const Icon(
                  Icons.shopify_outlined,
                  color: AppColor.priomaryColorApp,
                ),
                subTile: "2 Hours ago",
                title: "Top Up Coins",
              ),
            );
          },
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppText(
              text: "Yesterday ",
              isBold: true,
              textColor: AppColor.neutralsColor.withOpacity(.5),
            ),
          ),
        ),
        SliverList.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  width: 2,
                  color: AppColor.neutralsColor.withOpacity(.4),
                ),
              ),
              child: RowItemInOrder(
                trailing: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: index % 2 == 0
                          ? AppColor.errorColor.withOpacity(.3)
                          : AppColor.successColor.withOpacity(.3),
                      borderRadius: BorderRadius.circular(10)),
                  child: Wrap(
                    children: [
                      Icon(
                        index % 2 == 0
                            ? Icons.arrow_downward_outlined
                            : Icons.arrow_upward_outlined,
                        color: index % 2 == 0
                            ? AppColor.errorColor
                            : AppColor.successColor,
                      ),
                      const AppText(
                        text: '23.5',
                      ),
                    ],
                  ),
                ),
                leading: const Icon(
                  Icons.shopify_outlined,
                  color: AppColor.priomaryColorApp,
                ),
                subTile: "2 Hours ago",
                title: "Top Up Coins",
              ),
            );
          },
        ),
      ],
    );
  }
}
