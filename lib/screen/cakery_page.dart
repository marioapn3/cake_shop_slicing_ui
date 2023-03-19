import 'package:cake_shop_app/screen/cakery_detail.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../data/cake.dart';

class CakeryPage extends StatelessWidget {
  const CakeryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFCFAF8),
      body: ListView(
        children: [
          const Gap(15),
          Container(
            padding: const EdgeInsets.only(right: 15.0),
            width: MediaQuery.of(context).size.width - 30.0,
            height: MediaQuery.of(context).size.height - 50.0,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                return _buildCard(listCakes[index], context);
              },
              itemCount: listCakes.length,
            ),
          ),
          const Gap(15),
        ],
      ),
    );
  }
}

Widget _buildCard(
  Cake cake,
  context,
) {
  return Padding(
    padding: const EdgeInsets.all(5),
    child: InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return CakeryDetail(
              assetPath: cake.imageUrl,
              cookieprice: cake.price,
              cookiename: cake.name);
        }));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0)
          ],
          color: Colors.white,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  cake.isFavorite
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : const Icon(
                          Icons.favorite_border,
                          color: Colors.red,
                        )
                ],
              ),
            ),
            Hero(
              tag: cake.imageUrl,
              child: Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(cake.imageUrl),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            const Gap(8),
            Text(
              'Rp ${cake.price}',
              style: const TextStyle(
                color: Colors.red,
                fontSize: 14,
              ),
            ),
            Text(
              cake.name,
              style: const TextStyle(
                color: Color(0XFF545D68),
                fontSize: 14,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.white,
                height: 1.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.shopping_basket,
                        color: Colors.red,
                        size: 16,
                      ),
                      Gap(6),
                      Text(
                        'Beli',
                        style: TextStyle(
                          color: Color(0xFFD17E50),
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                  const Gap(15),
                  Row(
                    children: const [
                      Icon(
                        Icons.remove_circle_outline,
                        color: Color(0xFFD17E50),
                        size: 16,
                      ),
                      Gap(6),
                      Text(
                        '3',
                        style: TextStyle(
                          color: Color(0xFFD17E50),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Gap(6),
                      Icon(
                        Icons.add_circle_outline,
                        color: Color(0xFFD17E50),
                        size: 16,
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
