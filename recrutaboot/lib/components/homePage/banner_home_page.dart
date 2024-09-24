import 'package:flutter/material.dart';

class BannerHomePage extends StatelessWidget {
  const BannerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width * 0.5,
        child: Image.asset("assets/images/banner.jpg", fit: BoxFit.cover));
  }
}
