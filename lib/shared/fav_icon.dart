import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/providers/products_provider.dart';
import 'package:riverpod_files/screens/favourite/favourites_screen.dart';

class FavIcon extends ConsumerWidget {
  const FavIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const FavouritesScreen();
        }));
      },
      icon: const Icon(Icons.favorite),
    );
  }
}
