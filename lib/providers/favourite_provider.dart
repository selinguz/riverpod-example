import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_files/models/product.dart';

part 'favourite_provider.g.dart';

@riverpod
class FavouriteNotifier extends _$FavouriteNotifier {
  //initial value
  @override
  Set<Product> build() {
    return {};
  }

  //methods to update state
  void addToFavourites(Product product) {
    if (!state.contains(product)) {
      state = {...state, product};
    }
  }

  void removeFromFavourites(Product product) {
    if (state.contains(product)) {
      state = state.where((p) => p.id != product.id).toSet();
    }
  }
}
