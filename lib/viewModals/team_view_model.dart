import 'dart:convert';
import 'package:flutter/material.dart';
import '../api/api_call.dart';
import '../model/index.dart';
import '../utilities/common_util.dart';

class TeamViewModel extends ChangeNotifier {
  late TeamRegisterModel _teamRegisterResponse;
  late TeamLoginModel _teamLoginResponse;
  Status _status = Status.none;

  Future<void> teamRegister() async {
    CommonUtil().checkInternetConnection().then((value) {
      if (value) {
        notifyListeners();
        APICall().teamRegister().then((response) {
          if (response.statusCode == 200) {
            _teamRegisterResponse =
                TeamRegisterModel.fromJson(json.decode(response.body));
            _status = Status.success;
            notifyListeners();
          } else {
            _status = Status.failed;
            notifyListeners();
          }
        });
      } else {
        _status = Status.noInternet;
        notifyListeners();
      }
    });
  }

  Future<void> teamLogin(mobile, password) async {
    CommonUtil().checkInternetConnection().then((value) {
      if (value) {
        notifyListeners();
        APICall().teamLogin(mobile, password).then((response) {
          if (response.statusCode == 200) {
            _teamLoginResponse =
                TeamLoginModel.fromJson(json.decode(response.body));
            _status = Status.success;
            notifyListeners();
          } else {
            _status = Status.failed;
            notifyListeners();
          }
        });
      } else {
        _status = Status.noInternet;
        notifyListeners();
      }
    });
  }
}
