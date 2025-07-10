import 'package:flutter/material.dart';
import '../models/weather.dart';

class WeatherDetailScreen extends StatelessWidget {
  final Weather weather;

  const WeatherDetailScreen({required this.weather});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${weather.city} Weather'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network('https://openweathermap.org/img/wn/${weather.icon}@4x.png'),
            Text(
              '${weather.temperature}°C',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            Text(
              weather.description.toUpperCase(),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.water_drop),
              title: Text('Humidity'),
              trailing: Text('${weather.humidity}%'),
            ),
            ListTile(
              leading: Icon(Icons.air),
              title: Text('Wind Speed'),
              trailing: Text('${weather.windSpeed} m/s'),
            ),
          ],
        ),
      ),
    );
  }
}
