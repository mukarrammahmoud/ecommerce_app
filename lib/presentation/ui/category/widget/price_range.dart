import 'package:first_app/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

class PriceRange extends StatelessWidget {
  const PriceRange({
    super.key,
    required this.onChanged,
    required this.values,
  });

  final RangeValues values;
  final void Function(RangeValues)? onChanged;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: RangeSlider(
        divisions: 10,
        mouseCursor: MaterialStateMouseCursor.clickable,
        labels: RangeLabels("\$ ${values.start}", "\$ ${values.end}"),
        overlayColor: const MaterialStatePropertyAll(AppColor.priomaryColorApp),
        inactiveColor: AppColor.priomaryColorApp.withOpacity(.9),
        activeColor: AppColor.priomaryColorApp,
        values: values,
        onChanged: onChanged,
        max: 100,
        min: 0,
      ),
    );
  }
}
