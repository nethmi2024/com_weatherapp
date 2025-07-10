import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';
import '../widgets/weather_card.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favorites = Provider.of<WeatherProvider>(context).favorites;

    return Scaffold(
      appBar: AppBar(title: Text("Favorite Cities")),
      body: favorites.isEmpty
          ? Center(child: Text("No favorites added yet"))
          : ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (ctx, index) => WeatherCard(weather: favorites[index]),
      ),
    );
  }
}
