import 'package:flutter/material.dart';
import '../models/weather.dart';
import '../services/weather_api_service.dart';

class WeatherProvider with ChangeNotifier {
  final WeatherApiService _apiService = WeatherApiService();
  List<Weather> _citiesWeather = [];
  List<Weather> get citiesWeather => _citiesWeather;

  List<Weather> _favorites = [];
  List<Weather> get favorites => _favorites;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchWeather(String city) async {
    _isLoading = true;
    notifyListeners();

    try {
      final weather = await _apiService.getWeatherByCity(city);
      _citiesWeather.add(weather);
    } catch (e) {
      debugPrint('Error: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  void sortByTemp() {
    _citiesWeather.sort((a, b) => b.temperature.compareTo(a.temperature));
    notifyListeners();
  }

  void toggleFavorite(Weather weather) {
    if (_favorites.contains(weather)) {
      _favorites.remove(weather);
    } else {
      _favorites.add(weather);
    }
    notifyListeners();
  }

  bool isFavorite(Weather weather) {
    return _favorites.contains(weather);
  }
}
