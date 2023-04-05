import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


const logo2 = "assets/icons/logo/logo2.png";
const loading = "assets/icons/logo/logo_loading.png";
const splash_login = "assets/images/illustrations/splash_screen1.png";
const splash_store = "assets/images/illustrations/splash_screen2.png";
const splash_drop = "assets/images/illustrations/splash_screen3.png";
const splash_check = "assets/images/illustrations/splash_screen4.png";
const otp = "assets/images/illustrations/otp.png";
const google_logo = "assets/icons/general/social/google.png";
const notification_bell = "assets/icons/general/home/notificationbell.png";
const heart = "assets/icons/general/home/heart.png";




const home = "assets/icons/general/bottom_nav/home.png";
const profile = "assets/icons/general/bottom_nav/profile.png";
const analytics = "assets/icons/general/bottom_nav/analytics.png";

String numberFormat(int price) {
  final numberFormatter = NumberFormat(
    "##,##,###",
    "en_US", // local US
  );

  return numberFormatter.format(price);
}

String timeConversion(DateTime dateTime) {
  return DateFormat('yyyy-MM-dd – kk:mm').format(dateTime);
}

TextStyle introStyles(double size, {Color color = Colors.black87}) {
  return TextStyle(fontFamily: 'Ubuntu', color: color, fontSize: size);
}

Container category_chip(String title, String activeChiptitle) {
  if (title.toLowerCase() != activeChiptitle) {
    return Container(
      margin: EdgeInsets.only(left: 5),
      child: Chip(
        label: Text(
          title,
          style: introStyles(16),
        ),
        backgroundColor: Colors.white,
        side: const BorderSide(
          width: 1.5,
        ),
      ),
    );
  } else {
    return Container(
      child: Chip(
        label: Text(
          title,
          style: introStyles(16, color: Colors.white),
        ),
        backgroundColor: Colors.black,
        side: const BorderSide(
          width: 1.5,
        ),
      ),
    );
  }
}
