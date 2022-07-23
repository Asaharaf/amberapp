import 'package:flutter/material.dart';

class NotificationProvider extends ChangeNotifier{

  int _notificationLength = 0;

  set setNotificationLength(int length){
    _notificationLength = length;
    notifyListeners();
  }

  int get notificationLength=>_notificationLength;
}