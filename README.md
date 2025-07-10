# Flutter Weather App

A Flutter app that displays real-time weather data for cities using the OpenWeatherMap API. Features include search, categories, favorites, sorting, and dark mode, all managed with Provider state management.

## Features

Current weather: temperature, description, humidity, wind speed

Search cities globally

City categories (e.g., Asia, Europe, Tropical)

Favorite/unfavorite cities

Sort cities by temperature

Dark mode toggle

## Getting Started

1. Clone the repo:

git clone https://github.com/yourusername/flutter-weather-app.git

cd flutter-weather-app

2. Install dependencies:

flutter pub get

3. Add your OpenWeatherMap API key in services/weather_api_service.dart.

4. Run the app:

flutter run

## Project Structure

main.dart: App entry point with providers

models/: Data models

providers/: State management

screens/: UI screens

services/: API calls

widgets/: Reusable components

## Dependencies

flutter

provider

http



