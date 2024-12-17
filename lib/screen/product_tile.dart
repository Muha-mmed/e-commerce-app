import 'package:flutter/material.dart';

import '../product.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border:
                const Border.fromBorderSide(BorderSide(color: Colors.orange)),
            borderRadius: BorderRadius.circular(18)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                width: 50,
                product.image,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.hide_image),
              ),
              Text(
                product.title,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Text(
                "\$${product.price.toString()}",
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.normal),
              )
            ],
          ),
        ),
      ),
    );
  }
}
