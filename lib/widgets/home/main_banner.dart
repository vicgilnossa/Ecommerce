import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';

class HomeMainBanner extends StatelessWidget {
  const HomeMainBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map> banners = [
      {'picture': 'assets/bannerhome1.png'},
      {'picture': 'assets/bannerhome2.png'},
      {'picture': 'assets/bannerhome3.png'},
    ];
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Container(
          width: 350,
          height: 280,
          child: Transform.translate(
            offset: const Offset(0, -25),
            child: Swiper(
              pagination: const SwiperPagination(
                margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                builder: DotSwiperPaginationBuilder(
                    color: Color(0xffE9E9E9),
                    activeColor: Color(0xffFFA05B),
                    size: 6.0,
                    activeSize: 9.0),
              ),
              itemCount: banners.length,
              layout: SwiperLayout.DEFAULT,
              itemBuilder: (_, index) {
                return FadeInImage(
                    placeholder: AssetImage(banners[index]["picture"]),
                    image: AssetImage(banners[index]["picture"]));
              },
            ),
          )),
    );
  }
}
