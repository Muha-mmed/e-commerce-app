import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_ui/bloc/store_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../product.dart';
import 'product_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("FakeStore Api"),
            centerTitle: true,
            backgroundColor: Colors.orange,
            elevation: 0.0,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
                tooltip: 'Open shopping cart',
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shop),
                tooltip: 'Open shopping cart',
              ),
            ],
          ),
          body: BlocBuilder<StoreBloc, StoreState>(
            builder: (context, state) {
              if (state is LoadingStore) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.orange),
                );
              } else if (state is StoreLoaded) {
                if (state.productList.isEmpty) {
                  return const Center(child: Text("No products available."));
                }
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CarouselSlider(
                            items: [
                              Image.asset('asset/image.png'),
                              Image.asset('asset/banner1.jpg'),
                              Image.asset('asset/banner2.webp'),
                              Image.asset('asset/banner3.jpeg'),
                            ],
                            options: CarouselOptions(
                              height: 120,
                              enlargeCenterPage: true,
                              autoPlay: true,
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enableInfiniteScroll: true,
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 200),
                              viewportFraction: 0.8,
                            ),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              color: Colors.deepOrange,
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Top Product",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ))),
                      SliverGrid.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.6,
                          crossAxisCount: 3,
                        ),
                        itemCount: state.productList.length,
                        itemBuilder: (context, index) {
                          final Product product = state.productList[index];
                          return ProductTile(product: product);
                        },
                      ),
                    ],
                  ),
                );
              } else if (state is StoreError) {
                return Center(child: Text(state.message));
              } else {
                return const Center(child: Text("No data to display"));
              }
            },
          )),
    );
  }
}
