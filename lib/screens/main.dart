import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: const [
          Padding(
            padding: EdgeInsets.only(top: 30, left: 24),
            child: TopBar(),
          ),
          SizedBox(
            height: 10,
          ),
          HomeMainBanner(),
          SizedBox(
            height: 30,
          ),
          CategoriesBar(),
          SizedBox(
            height: 50,
          ),
          HomeProductSlider(),
        ]),
      ),
    );
  }
}
