import 'package:coffers_app/src/shared/colors.dart';
import 'package:flutter/material.dart';

class HomeCustomButtonWidget extends StatelessWidget {
  const HomeCustomButtonWidget({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.5,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            primary: primaryDarkBrown,
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.black12, width: 0.8),
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
            textStyle:
                const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
        child: Text(title),
      ),
    );
  }
}
