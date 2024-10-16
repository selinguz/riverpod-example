import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/screens/cart/cart_screen.dart';

class FavIcon extends ConsumerWidget {
  const FavIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const CartScreen();
          }));
        },
        child: const Icon(Icons.favorite));
  }
}
