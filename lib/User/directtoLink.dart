import 'package:url_launcher/url_launcher.dart';

class Direct {
  static launchURL(String urlPass) async {
    Uri url = Uri.parse(urlPass);

    if (await launchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}
