import 'package:flutter/material.dart';
import 'package:namer_app/presentation/favorites/favorites_view_model.dart';

class FavoritesView extends StatelessWidget {
  final FavoritesViewModel _viewModel = FavoritesViewModel();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FavoritesState>(
      future: _viewModel.getFavoritesState(),
      builder: (context, AsyncSnapshot<FavoritesState> snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data;
          if (data == null) return Row();

          return ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 8),
            itemCount: data.favorites.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(data.favorites[index]),
                leading: Icon(Icons.favorite),
              );
            },
          );
        }

        return Row();
      },
    );
  }
}
