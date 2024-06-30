import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String path;
  final Color backgroundColor;
  const ProductCard({
    required this.title,
    required this.price,
    required this.path,
    required this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: backgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '\$$price',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(
              height: 5,
            ),
            Center(
              child: Image.asset(
                path,
                height: 175,
              ),
            )
          ],
        ));
  }
}
