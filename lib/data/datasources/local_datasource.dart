import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';


const String favorites = "favorites";


abstract class LocalDatasource {
  void saveFcmToken(String fcmToken);

  Future<String?> getFcmToken();

  void setDarkTheme(bool isDarkTheme);

  Future<bool?> isDarkTheme();

  void removeFavorite(String id);

  Future<List<String>> getFavoriteList();
}

class LocalDataSourceImpl extends LocalDatasource {
  final Future<SharedPreferences> prefs;

  LocalDataSourceImpl({required this.prefs});

  static const String keyFcmToken = "fcm_token";
  static const String keyIsDarkTheme = "is_dark_theme";

  Future<String?> _getString(String key) async {
    SharedPreferences sp = await prefs;
    return sp.getString(key);
  }

  void _saveString(String key, String val) async {
    SharedPreferences sp = await prefs;
    sp.setString(key, val);
  }

  Future<bool?> _getBool(String key) async {
    SharedPreferences sp = await prefs;
    return sp.getBool(key);
  }

  void _saveBool(String key, bool val) async {
    SharedPreferences sp = await prefs;
    sp.setBool(key, val);
  }

  Future<List<String>> _getStockList(String key) async {
    SharedPreferences sp = await prefs;
    final jsonString = sp.getString(key);
    if (jsonString != null) {
      final List<dynamic> decodedList = json.decode(jsonString);
      return decodedList.cast<String>();
    } else {
      return [];
    }
  }

  void _saveStockList(String key, List<String> list) async {
    SharedPreferences sp = await prefs;
    final jsonString = json.encode(list);
    sp.setString(key, jsonString);
  }

  @override
  Future<String?> getFcmToken() async {
    return await _getString(keyFcmToken);
  }

  @override
  void saveFcmToken(String fcmToken) {
    _saveString(keyFcmToken, fcmToken);
  }

  @override
  Future<bool?> isDarkTheme() async {
    return await _getBool(keyIsDarkTheme);
  }

  @override
  void setDarkTheme(bool isDarkTheme) {
    _saveBool(keyIsDarkTheme, isDarkTheme);
  }

  @override
  Future<void> removeFavorite(String id) async {
    List<String> stockList = await _getStockList(favorites);
    stockList.removeWhere((element) => element == id);
    _saveStockList(favorites, stockList);
  }

  @override
  Future<List<String>> getFavoriteList() async {
    List<String> stockList = await _getStockList(favorites);
    return stockList;
  }
}
