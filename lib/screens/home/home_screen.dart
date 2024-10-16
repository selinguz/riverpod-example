import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/providers/cart_provider.dart';
import 'package:riverpod_files/providers/favourite_provider.dart';
import 'package:riverpod_files/providers/products_provider.dart';
import 'package:riverpod_files/shared/cart_icon.dart';
import 'package:riverpod_files/shared/fav_icon.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allProducts = ref.watch(productsProvider);
    final cartProducts = ref.watch(cartNotifierProvider);
    final favouritedProducts = ref.watch(favouriteNotifierProvider);
    final numberOfItemsFavourited = ref.watch(favouriteNotifierProvider).length;
    const bool isFavourited = false;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Garage Sale Products'),
        actions: const [CartIcon(), FavIcon()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: GridView.builder(
          itemCount: allProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 10,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(20),
              color: Colors.blueGrey.withOpacity(0.05),
              child: Column(
                children: [
                  Image.asset(
                    allProducts[index].image,
                    width: 60,
                    height: 60,
                  ),
                  Text(allProducts[index].title),
                  Text('£${allProducts[index].price}'),
                  if (cartProducts.contains(allProducts[index]))
                    TextButton(
                      onPressed: () {
                        ref
                            .read(cartNotifierProvider.notifier)
                            .removeProduct(allProducts[index]);
                      },
                      child: const Text('Remove From Cart'),
                    ),
                  if (!cartProducts.contains(allProducts[index]))
                    TextButton(
                      onPressed: () {
                        ref
                            .read(cartNotifierProvider.notifier)
                            .addProduct(allProducts[index]);
                      },
                      child: const Text('Add To Cart'),
                    ),
                  if (!favouritedProducts.contains(allProducts[index]))
                    InkWell(
                      child: const Icon(Icons.favorite_border),
                      onTap: () {
                        ref
                            .read(favouriteNotifierProvider.notifier)
                            .addToFavourites(allProducts[index]);
                        print(favouritedProducts.length);
                      },
                    ),
                  if (favouritedProducts.contains(allProducts[index]))
                    InkWell(
                      child: const Icon(Icons.favorite),
                      onTap: () {
                        ref
                            .read(favouriteNotifierProvider.notifier)
                            .removeFromFavourites(allProducts[index]);
                        print(favouritedProducts.length);
                      },
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
