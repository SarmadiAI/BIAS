import 'package:flutter/material.dart';
import 'bias_text.dart';

class DashboardContainer extends StatelessWidget {
  final ImageProvider<Object>? image;
  final String? title;
  final void Function()? onTap;

  const DashboardContainer({
    super.key,
    this.title,
    this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        height: 190,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: image ?? const AssetImage('assets/images/light_gray.png'),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
          child: BIASText(
            title ?? '',
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
