import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../../core/constants/storage_key.dart';
import '../../core/services/preferences_manager.dart';

class UserController with ChangeNotifier {
  String _username = PreferencesManager().getString(StorageKey.username) ?? '';
  String _userImagePath =
      PreferencesManager().getString(StorageKey.userImage) ?? '';
  String _motivationQuote =
      PreferencesManager().getString(StorageKey.motivationQuote) ?? '';
  String get username => _username;
  String get userImagePath => _userImagePath;
  String get motivationQuote => _motivationQuote;

  Future<void> setUserName(String username) async {
    if (username.isNotEmpty) {
      _username = username;
      PreferencesManager().setString(StorageKey.username, username);
      notifyListeners();
    }
  }

  Future<void> updateUserData(
      String newUsername, String newMotivationQuote) async {
    if (newUsername.isNotEmpty && newMotivationQuote.isNotEmpty) {
      _motivationQuote = newMotivationQuote;
      _username = newUsername;
      PreferencesManager().setString(StorageKey.username, newUsername);
      PreferencesManager()
          .setString(StorageKey.motivationQuote, newMotivationQuote);
      notifyListeners();
    }
  }

  Future<void> clearUserData() async {
    _username = '';
    _motivationQuote = '';
    _userImagePath = '';
    PreferencesManager().remove(StorageKey.username);
    PreferencesManager().remove(StorageKey.motivationQuote);
    PreferencesManager().remove(StorageKey.userImage);
    notifyListeners();
  }

  // save user image
  void saveUserImage(XFile file) async {
    final appDir = await getApplicationDocumentsDirectory();
    final newFile = await File(file.path).copy('${appDir.path}/${file.name}');
    PreferencesManager().setString(StorageKey.userImage, newFile.path);
    _userImagePath = newFile.path;
    notifyListeners();
  }
}
