import 'dart:io';

chickIntrnet() async {
  try {
    var result = await InternetAddress.lookup("google.com")
        .timeout(const Duration(seconds: 5));

    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } catch (_) {
    return false;
  }
}
