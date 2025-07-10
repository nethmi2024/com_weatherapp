import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';

class CategoryScreen extends StatelessWidget {
  final Map<String, List<String>> categoryCities = {
    'Asia': ['Tokyo', 'Delhi', 'Bangkok', 'Colombo'],
    'Europe': ['London', 'Paris', 'Berlin', 'Madrid'],
    'North America': ['New York', 'Toronto', 'Chicago', 'Los Angeles'],
    'Tropical': ['Rio de Janeiro', 'Jakarta', 'Manila', 'Mumbai'],
    'Cold Cities': ['Moscow', 'Reykjavik', 'Helsinki', 'Oslo'],
  };

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: Text('Weather Categories')),
      body: ListView.builder(
        itemCount: categoryCities.keys.length,
        itemBuilder: (context, index) {
          final category = categoryCities.keys.elementAt(index);

          return ListTile(
            title: Text(category),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () async {
              // Clear old cities
              weatherProvider.citiesWeather.clear();

              // Fetch weather for all cities in the selected category
              for (String city in categoryCities[category]!) {
                await weatherProvider.fetchWeather(city);
              }

              Navigator.pop(context); // Close drawer or category screen
            },
          );
        },
      ),
    );
  }
}
