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
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
          title: const Text("Fake store App"),
          centerTitle: true,
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.shop_rounded),
            )
          ],
        ),
        drawer: const Drawer(),
        body: BlocBuilder<StoreBloc, StoreState>(builder: (context, state) {
          if (state is LoadingStore) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is StoreLoaded) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.width * 0.4,
                        color: Colors.amberAccent,
                      ),
                    ),
                  ),
                  SliverGrid.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: state.productList.length,
                    itemBuilder: (context, index) {
                      final Product product = state.productList[index];
                      return ProductTile(product: product);
                    },
                  )
                ],
              ),
            );
          } else if (state is StoreError) {
            return Center(child: Text(state.message));
          } else {
            return const Text("no data to display");
          }
        }));
  }
}
