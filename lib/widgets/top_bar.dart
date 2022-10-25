import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            width: 264,
            height: 48,
            color: Color(0xffFFFFFF),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: const [
                  Image(image: AssetImage("assets/searchicon.png")),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        const Image(image: AssetImage("assets/notificationicon.png"))
      ],
    );
  }
}