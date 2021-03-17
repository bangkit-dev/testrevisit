import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:revisit/service/constant_service.dart';
import 'package:revisit/service/handling_server_log.dart';
import 'dart:convert';

class NetworkService with ChangeNotifier {
  ConstantService constantService;

  NetworkService(this.constantService);

  Future<HandlingServerLog> doHttpGet(url) async {
    String reqUrl = "https://revisit-backend.herokuapp.com/api/$url";

    var header;

    if (constantService.token != null) {
      header = {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer ${constantService.token}",
      };
    } else {
      header = {
        "Content-Type": "application/json",
        "Accept": "application/json",
      };
    }

    http.Response response = await http.get(reqUrl, headers: header);

    var resBody = json.decode(response.body);

    if (resBody['check'] == true) {
      return HandlingServerLog.success(resBody['check'], resBody['results']);
    } else {
      return HandlingServerLog.failed(resBody['check'], resBody['caption']);
    }
  }

  Future<HandlingServerLog> doHttpPost(
    String url,
    reqBody,
  ) async {
    String reqUrl = "https://revisit-backend.herokuapp.com/api/$url";

    var requestBody = json.encode(reqBody);

    print(requestBody);
    print(reqBody);
    var header;

    if (constantService.token != null) {
      header = {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer ${constantService.token}",
      };
    } else {
      header = {
        "Content-Type": "application/json",
        "Accept": "application/json",
      };
    }

    http.Response response =
        await http.post(reqUrl, body: requestBody, headers: header);

    var resBody = json.decode(response.body);

    if (resBody['check'] == true) {
      return HandlingServerLog.success(resBody['check'], resBody['results']);
    } else {
      return HandlingServerLog.failed(resBody['check'], resBody['caption']);
    }
  }
}