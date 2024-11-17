import 'package:first_app/core/constant/app_colors.dart';
import 'package:first_app/core/constant/components/custom_text.dart';
import 'package:flutter/material.dart';

class VoiceSearch extends StatelessWidget {
  const VoiceSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                    size: 30,
                  ),
                ),
                const AppText(
                  text: "Voice Search",
                  isBold: true,
                  fontSize: 25,
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .1,
            ),
            const AppText(
              text: "Listening ...",
              isBold: true,
              fontSize: 25,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .2,
            ),
            const AppText(
              text: "Try To Speak for Search",
              fontSize: 25,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .2,
            ),
            const Icon(
              Icons.keyboard_voice_outlined,
              size: 70,
              color: AppColor.priomaryColorApp,
            )
          ],
        ),
      ),
    );
  }
}
