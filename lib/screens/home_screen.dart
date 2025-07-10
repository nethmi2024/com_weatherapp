import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';
import '../widgets/weather_card.dart';
import 'search_screen.dart';
import 'favorites_screen.dart';
import 'category_screen.dart';
import '../providers/theme_provider.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () =>
                Navigator.push(context, MaterialPageRoute(builder: (_) => SearchScreen())),
          ),
          IconButton(
            icon: Icon(Icons.sort),
            onPressed: () => weatherProvider.sortByTemp(),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text('Weather Options')),
            ListTile(
              title: Text('Favorites'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => FavoritesScreen()));
              },
            ),
            ListTile(
              title: Text('Categories'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => CategoryScreen()));
              },
            ),
            ListTile(
              title: Text('Toggle Theme'),
              trailing: Consumer<ThemeProvider>(
                builder: (context, themeProvider, _) => Switch(
                  value: themeProvider.isDarkMode,
                  onChanged: (_) {
                    themeProvider.toggleTheme();
                  },
                ),
              ),
            ),
          ],
        ),
      ),


      body: weatherProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: weatherProvider.citiesWeather.length,
        itemBuilder: (ctx, index) {
          final weather = weatherProvider.citiesWeather[index];
          return WeatherCard(weather: weather);
        },
      ),
    );
  }
}
