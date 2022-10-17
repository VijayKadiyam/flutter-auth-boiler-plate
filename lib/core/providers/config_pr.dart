import 'package:flutter/material.dart';
import 'package:infakt_app/core/models/user.dart';
import 'package:infakt_app/core/services/config_s.dart';
import 'package:infakt_app/ui/locator.dart';

class ConfigModel with ChangeNotifier {
  final ConfigService _configService = locator<ConfigService>();

  // Api Config
  late Map<String, dynamic> _apiConfig;

  set apiConfig(Map<String, dynamic> newApiConfig) {
    _apiConfig = newApiConfig;
    notifyListeners();
  }

  Map<String, dynamic> get apiConfig => _apiConfig;

  void getApiConfig({required String domain}) {
    apiConfig = _configService.getApiConfig(domain: domain);
  }

  // Login Data
  Map<String, dynamic> _loginData = {};

  set loginData(Map<String, dynamic> newLoginData) {
    _loginData = newLoginData;
    notifyListeners();
  }

  Map<String, dynamic> get loginData => _loginData;

  Future<void> saveLoginData(
      {required Map<String, dynamic>? newLoginData}) async {
    await _configService.saveLoginData(newLoginData: newLoginData);
  }

  Future<void> fetchLoginData() async {
    loginData = await _configService.fetchLoginData();
  }

  Future<void> removeLoginData() async {
    await _configService.removeLoginData();
  }

  // Save user data
  late User _user;
  late bool _isLoggedIn;
  late String _loginFailedMessage;

  set user(User newUser) {
    _user = newUser;
    notifyListeners();
  }

  User get user => _user;

  set isLoggedIn(bool newIsLoggedIn) {
    _isLoggedIn = newIsLoggedIn;
    notifyListeners();
  }

  bool get isLoggedIn => _isLoggedIn;

  set loginFailedMessage(String newLoginFailedMessage) {
    _loginFailedMessage = newLoginFailedMessage;
    notifyListeners();
  }

  String get loginFailedMessage => _loginFailedMessage;

  String _currentAndroidVersionFromApi = '';

  String get currentAndroidVersionFromApi => _currentAndroidVersionFromApi;

  set currentAndroidVersionFromApi(String newCurrentAndroidVersionFromApi) {
    _currentAndroidVersionFromApi = newCurrentAndroidVersionFromApi;
    notifyListeners();
  }

  saveUserData({required Map<String, dynamic> responseData}) {
    if (responseData['success'] == null) {
      isLoggedIn = false;
      loginFailedMessage = responseData['message'];
    } else if (responseData['success']) {
      isLoggedIn = true;
      user = User.fromJson(responseData['data']);
      apiConfig = _configService.getApiConfig(
        token: user.apiToken,
        companyId: user.companies!.isNotEmpty ? user.companies![0].id : null,
      );
      currentAndroidVersionFromApi =
          responseData['currentAndroidVersionFromApi'];
    }
    notifyListeners();
  }
}
