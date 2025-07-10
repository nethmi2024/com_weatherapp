import 'package:flutter/material.dart';
import '../models/weather.dart';
import '../screens/weather_detail_screen.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';

class WeatherCard extends StatelessWidget {
  final Weather weather;

  const WeatherCard({required this.weather});

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => WeatherDetailScreen(weather: weather),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.all(10),
        child: ListTile(
          leading: Image.network('https://openweathermap.org/img/wn/${weather.icon}@2x.png'),
          title: Text('${weather.city} - ${weather.temperature}°C'),
          subtitle: Text(weather.description),
          trailing: IconButton(
            icon: Icon(
              weatherProvider.isFavorite(weather) ? Icons.favorite : Icons.favorite_border,
              color: weatherProvider.isFavorite(weather) ? Colors.red : null,
            ),
            onPressed: () {
              weatherProvider.toggleFavorite(weather);
            },
          ),
        ),
      ),
    );
  }
}
