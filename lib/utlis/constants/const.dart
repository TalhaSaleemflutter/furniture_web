
import 'package:url_launcher/url_launcher.dart';

void launchFacebookProfile() async {
  const fbProfileUrl = 'https://www.facebook.com/share/1AT96U1qsL/'; // Replace with your actual profile link
  final Uri fbUri = Uri.parse(fbProfileUrl);
  if (await canLaunchUrl(fbUri)) {
    await launchUrl(fbUri, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $fbProfileUrl';
  }
}

Future<void> openWhatsApp() async {
    final phoneNumber = "923227149659"; // without '+'
    final message = Uri.encodeComponent(
      "Hello! I’d like to know more about your services.",
    );
    final url = "https://wa.me/$phoneNumber?text=$message";

    final uri = Uri.parse(url);

    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication, // Works on mobile
      webOnlyWindowName: "_blank", // Works on web
    )) {
      throw "Could not launch $url";
    }
  }
  
 

