import 'package:e_commerce_ui/product.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  product.image,
                  width: 180,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                product.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "rating: ${product.rating!.rate.toString()}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "count: ${product.rating!.count.toString()}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "price: \$${product.price.toString()}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Description",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                product.description,
                style: const TextStyle(
                    fontWeight: FontWeight.w400, color: Colors.grey),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                  child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: 35,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(7)),
                child: const Center(
                  child: Text(
                    "Add To cart",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        fontFamily: AutofillHints.url),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
