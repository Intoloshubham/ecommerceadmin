import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
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
            return _status;
          } else {
            _status = Status.failed;
            notifyListeners();
            return _status;
          }
        });
      } else {
        _status = Status.noInternet;
        return _status;
        notifyListeners();
      }
    });
  }

  Future<dynamic> teamLogin(TeamLoginModel body) async {
    CommonUtil().checkInternetConnection().then((value) {
      if (value) {
        notifyListeners();
        APICall().teamLogin(body).then((response) {
          if (response.statusCode == 200) {
            _teamLoginResponse =
                TeamLoginModel.fromJson(json.decode(response.body));
            _status = Status.success;
            notifyListeners();
            return response.statusCode;
          } else {
            _status = Status.failed;
            notifyListeners();
            return response.statusCode;
          }
        });
      } else {
        _status = Status.noInternet;
        notifyListeners();
      }
    });
  }
}
