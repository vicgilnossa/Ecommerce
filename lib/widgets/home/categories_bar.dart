import 'package:flutter/material.dart';

class CategoriesBar extends StatelessWidget {
  const CategoriesBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map> categories = [
      {'name': 'Tropical'},
      {'name': 'Succulent'},
      {'name': 'Gummies'},
      {'name': 'Oils'},
    ];
    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 24),
              width: 89,
              height: 24.06,
              child: Center(
                child: Text(
                  "Categories",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
            const SizedBox(
              width: 186.36,
            ),
            Container(
              margin: const EdgeInsets.only(
                right: 23.58,
              ),
              width: 52,
              height: 24,
              child: Center(
                child: Text(
                  "see all",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          margin: const EdgeInsets.only(left: 15),
          height: 48,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(
                  left: 15,
                ),
                width: 156,
                height: 48,
                decoration: BoxDecoration(
                    color: const Color(0xffB0C191),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, top: 4),
                  child: Text(
                    categories[index]["name"],
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
