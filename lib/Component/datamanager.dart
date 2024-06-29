import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataManager with ChangeNotifier {
  DataManager() {
    loadJson();
    loadFavorites();
  }
  List<Map<String, dynamic>> storiesKids = [];
  List<Map<String, dynamic>> anbiaStories = [];
  List<Map<String, dynamic>> soundStories = [];
  List<Map<String, dynamic>> favoriteItems = [];
  List<Map<String, dynamic>> toStoreallStoriesForSearch = [];

  get getThePart1 => storiesKids;
  get getThePart2 => anbiaStories;
  get getFavorite => favoriteItems;
  get getDitalsSound => soundStories;

  Future<void> loadJson() async {
    final String response = await rootBundle.loadString('images/data.json');
    final data = await json.decode(response);
    storiesKids = List<Map<String, dynamic>>.from(data['stories_Kids']);
    anbiaStories = List<Map<String, dynamic>>.from(data['stories_Anbia']);
    soundStories = List<Map<String, dynamic>>.from(data['sounds']);
    toStoreallStoriesForSearch.addAll(storiesKids);
    toStoreallStoriesForSearch.addAll(anbiaStories);
    notifyListeners();
  }

  void toggleFavorite(Map<String, dynamic> story) {
    if (favoriteItems.contains(story)) {
      favoriteItems.remove(story);
    } else {
      favoriteItems.add(story);
    }
    saveFavorites();
    notifyListeners();
  }

  bool isFavorite(Map<String, dynamic> story) {
    return favoriteItems.contains(story);
  }

  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteList = favoriteItems.map((e) => json.encode(e)).toList();
    await prefs.setStringList('favorites', favoriteList);
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteList = prefs.getStringList('favorites') ?? [];
    favoriteItems = favoriteList
        .map((e) => json.decode(e) as Map<String, dynamic>)
        .toList();
    notifyListeners();
  }
}
