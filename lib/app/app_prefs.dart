import 'package:flutter/material.dart';
import 'package:daily_flow/presentation/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_KEY_LANG = 'PREFS_KEY_LANG';
const String PREFS_KEY_IS_LOGGED_IN = 'PREFS_KEY_IS_LOGGED_IN';
const String WELCOME_BACK_VIEWED = "WELCOME_BACK_VIEWED";
const String PREFS_KEY_COMPANY_CODE = "PREFS_KEY_COMPANY_CODE";
const String PREFS_KEY_FIRST_SPLASH_VIEWED = "PREFS_KEY_FIRST_SPLASH_VIEWED";
// User Data
const String TOKEN = 'TOKEN';
const String USER_AR_NAME = 'USER_AR_NAME';
const String USER_EN_NAME = 'USER_EN_NAME';
const String USER_IMAGE = 'USER_IMAGE';
const String PASSWORD_LENGTH = "PASSWORD_LENGTH";

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(PREFS_KEY_LANG);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.ENGLISH.getValue();
    }
  }

  Future<void> changeAppLanguage() async {
    String currentLang = await getAppLanguage();
    if (currentLang == LanguageType.ARABIC.getValue()) {
      /// set english
      _sharedPreferences.setString(
          PREFS_KEY_LANG, LanguageType.ENGLISH.getValue());
    } else {
      /// set arabic
      _sharedPreferences.setString(
          PREFS_KEY_LANG, LanguageType.ARABIC.getValue());
    }
  }

  Future<void> customChangeAppLanguage(String language) async {
    _sharedPreferences.setString(PREFS_KEY_LANG, language);
  }

  Future<Locale> getLocal() async {
    String currentLang = await getAppLanguage();
    if (currentLang == LanguageType.ARABIC.getValue()) {
      return ARABIC_LOCAL;
    } else {
      return ENGLISH_LOCAL;
    }
  }

  Future<void> setUserLoggedIn(bool isLogin) async {
    _sharedPreferences.setBool(PREFS_KEY_IS_LOGGED_IN, isLogin);
  }

  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool(PREFS_KEY_IS_LOGGED_IN) ?? false;
  }

  ///********** USER DATA SETTER & GETTER **********

  setPasswordLength(int length) {
    _sharedPreferences.setInt(PASSWORD_LENGTH, length);
  }

  getPasswordLength() {
    return _sharedPreferences.getInt(PASSWORD_LENGTH) ?? 0;
  }

  setShowWelcomeBack() {
    _sharedPreferences.setBool(WELCOME_BACK_VIEWED, true);
  }

  getShowWelcomeBack() {
    return _sharedPreferences.getBool(WELCOME_BACK_VIEWED) ?? false;
  }

  setUserToken(String token) async {
    _sharedPreferences.setString(TOKEN, token);
  }

  getUserToken() {
    return _sharedPreferences.getString(TOKEN) ?? "";
  }

  setUserArName(String name) async {
    _sharedPreferences.setString(USER_AR_NAME, name);
  }

  getUserEnName() {
    return _sharedPreferences.getString(USER_EN_NAME) ?? "";
  }

  setUserEnName(String name) async {
    _sharedPreferences.setString(USER_EN_NAME, name);
  }

  getUserArName() {
    return _sharedPreferences.getString(USER_AR_NAME) ?? "";
  }

  setUserImage(String image) async {
    _sharedPreferences.setString(USER_IMAGE, image);
  }

  getUserImage() {
    return _sharedPreferences.getString(USER_IMAGE) ?? "";
  }

  // remove user data

  Future<void> logout() async {
    _sharedPreferences.remove(PREFS_KEY_IS_LOGGED_IN);
    _sharedPreferences.remove(USER_AR_NAME);
    _sharedPreferences.remove(USER_EN_NAME);
    _sharedPreferences.remove(USER_IMAGE);
    _sharedPreferences.remove(PASSWORD_LENGTH);
    _sharedPreferences.remove(TOKEN);
  }
}
