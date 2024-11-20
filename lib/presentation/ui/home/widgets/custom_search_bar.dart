import 'package:first_app/core/constant/app_colors.dart';
import 'package:first_app/core/constant/components/custom_button.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar(
      {this.onChanged,
      this.hintINSearchField = "Search",
      required this.onPressedButtonVoice,
      required this.onTapSearchField,
      super.key});
  final Function(String)? onChanged;
  final Function()? onTapSearchField;
  final void Function()? onPressedButtonVoice;
  final String hintINSearchField;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              color: AppColor.splashColor,
              child: TextFormField(
                onTap: onTapSearchField,
                autofocus: false,
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade100,
                  prefixIcon: Icon(Icons.search,
                      color: AppColor.neutralsColor.withOpacity(0.4)),
                  hintText: hintINSearchField,
                  hintStyle: TextStyle(
                    color: AppColor.neutralsColor.withOpacity(0.4),
                  ),
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0 * 1.5, vertical: 16.0),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                onSaved: (newValue) {},
                onChanged: onChanged,
              ),
            ),
          ),
          const SizedBox(
            width: 22,
          ),
          Expanded(
            child: CustomButton(
              marginHorizntal: 0,
              color: Colors.black,
              onPressed: onPressedButtonVoice,
              title: const Icon(
                Icons.keyboard_voice_outlined,
                color: AppColor.splashColor,
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}
