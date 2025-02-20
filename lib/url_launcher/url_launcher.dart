import 'package:url_launcher/url_launcher.dart';

void _launchURL(String url) async {
  // ignore: deprecated_member_use
  if (await canLaunch(url)) {
    // ignore: deprecated_member_use
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

// Example usage of _launchURL function
void exampleUsage() {
  _launchURL('https://www.example.com');
}