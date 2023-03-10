import 'package:flutter/widgets.dart';
import 'package:namer_app/presentation/favorites/favorites_view_model.dart';

class FavoritesView extends StatelessWidget {
  final FavoritesViewModel _viewModel = FavoritesViewModel();

  @override
  Widget build(BuildContext context) {
    var favorites = _viewModel.getFavoritesState().favorites;

    return ListView.builder(
      padding: EdgeInsets.all(8),
      itemCount: favorites.length,
      itemBuilder: (BuildContext context, int index) {
        return Text(favorites[index].asLowerCase);
      },
    );
  }
}
