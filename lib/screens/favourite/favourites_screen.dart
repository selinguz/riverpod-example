import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/providers/cart_provider.dart';
import 'package:riverpod_files/providers/favourite_provider.dart';
import 'package:riverpod_files/providers/products_provider.dart';

class FavouritesScreen extends ConsumerStatefulWidget {
  const FavouritesScreen({super.key});

  @override
  ConsumerState<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends ConsumerState<FavouritesScreen> {
  bool showCoupon = true;

  @override
  Widget build(BuildContext context) {
    final favouritedProducts = ref.watch(favouriteNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Favourites'),
        centerTitle: true,
        // actions: [],
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Column(
              children: favouritedProducts.map((product) {
                return Container(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Row(
                    children: [
                      Image.asset(
                        product.image,
                        width: 60.0,
                        height: 60.0,
                      ),
                      const SizedBox(width: 10),
                      Text(product.title),
                      const Expanded(
                        child: SizedBox(),
                      ),
                    ],
                  ),
                );
              }).toList(), // output cart products here
            ),
          ],
        ),
      ),
    );
  }
}
