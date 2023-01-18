import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class UserSimplePreferences {
  static late SharedPreferences _preferences;

  static const _keyBalance = 'balance';
  static const _keySpent = 'spent';
  static const _keySaved = 'saved';

  static Future init() async =>
        _preferences = await SharedPreferences.getInstance();

  static Future setBalance(double balance) async =>
      await _preferences.setDouble(_keyBalance, balance);

  static double? getBalance()  => _preferences.getDouble(_keyBalance);

  static Future setSpent(double balance) async =>
      await _preferences.setDouble(_keySpent, balance);

  static double? getSpent()  => _preferences.getDouble(_keySpent);

  static Future setSaved(double balance) async =>
      await _preferences.setDouble(_keySaved, balance);

  static double? getSaved()  => _preferences.getDouble(_keySaved);

  static Future clearData() async =>
      await _preferences.clear();

}