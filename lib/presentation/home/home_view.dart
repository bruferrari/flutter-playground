import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/presentation/home/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Row(
  //       children: [
  //         SafeArea(
  //           child: NavigationRail(
  //             extended: false,
  //             destinations: [
  //               NavigationRailDestination(
  //                   icon: Icon(Icons.home), label: Text('Home')),
  //               NavigationRailDestination(
  //                   icon: Icon(Icons.favorite), label: Text('Favorites'))
  //             ],
  //             selectedIndex: 0,
  //             onDestinationSelected: (value) {
  //               print('selected: $value');
  //             },
  //           ),
  //         ),
  //         Expanded(
  //             child: Container(
  //           color: Theme.of(context).colorScheme.primaryContainer,
  //           child: Content(),
  //         )),
  //       ],
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SafeArea(
            child: NavigationRail(
              extended: false,
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.favorite),
                  label: Text('Favorites'),
                ),
              ],
              selectedIndex: 0,
              onDestinationSelected: (value) {
                print('selected: $value');
              },
            ),
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Content(),
            ),
          ),
        ],
      ),
    );
  }
}

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<HomeViewModel>();
    var pair = appState.current;

    String likeBtnLabel = appState.favorites.contains(pair) ? 'Remove' : 'Like';

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BigCard(pair: pair),
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                    onPressed: () {
                      appState.getNext();
                    },
                    child: Text('Next')),
                SizedBox(width: 20),
                ElevatedButton(
                    onPressed: () {
                      appState.toggleFavorites();
                    },
                    child: Text(likeBtnLabel)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var style = theme.textTheme.displayMedium!
        .copyWith(color: theme.colorScheme.onPrimary);

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          pair.asLowerCase,
          style: style,
          semanticsLabel: "${pair.first} ${pair.second}",
        ),
      ),
    );
  }
}
