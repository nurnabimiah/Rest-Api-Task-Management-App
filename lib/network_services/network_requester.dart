import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_management_app/main.dart';
import 'package:task_management_app/utils/user_data.dart';

import '../screens/login_screen.dart';

class NetworkRequester {
  Future getRequest(String url) async {
    /*
    * http code ta ekTa error generate korte pare
    * ai error ta handle korar jonno amra try catch use korbo
    * try er modde amra code lekhbo jodi success hoy return korbe
    * R jodi success na hoy catch a jeye error ta generate korbe
    * Network thekhe jokhon kiso amra nei tokhon amra decode kori
    * Network er modde kono kiso patate hole amra encode kori
    * */

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
          'token': UserData.token ?? ''
        },
      );

      if (response.statusCode == 200) {
        /*
       * jodi request ta sucess hoy tahole er body ta k amra return kore dibo
       * body ta request korle sob kiso niye ase
       * */
        Logger().i(jsonDecode(response.body));
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        final sharePrefs = await SharedPreferences.getInstance();
        sharePrefs.clear();
        Navigator.pushAndRemoveUntil(
            MyApp.navigatorKey.currentState!.context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false);
      }
      else {
        Logger().e('Request failed');
      }
    } catch (e) {
      Logger().e(e);
    }
  }

  //............post method

  Future postRequest(
    String url,
    Map<String, String> body,
  ) async {
    /*
    *
    * post method a bes kiso jinis k pass korano jay
    * mane body sathe niye onno kothao niye jete chassi
    * post method encode korte hoy
    * */

    try {
      print(UserData.token);
      http.Response response = await http.post(Uri.parse(url),
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json",
            'token': UserData.token ?? ''
          },
          body: jsonEncode(body));
      Logger().i(response.statusCode);
      Logger().i(response.body);
      if (response.statusCode == 200) {
        /*
       * jodi request ta sucess hoy tahole er body ta k amra return kore dibo
       * body ta request korle sob kiso niye ase
       * */

        return jsonDecode(response.body);
      }
      else if (response.statusCode == 401) {
        final sharePrefs = await SharedPreferences.getInstance();
        sharePrefs.clear();
        Navigator.pushAndRemoveUntil(
            MyApp.navigatorKey.currentState!.context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false);
      } else {
        Logger().e('Request failed');
      }
    } catch (e) {
      //print er poriborte use korsi logger ta k
      Logger().e(e);
    }
  }
}
