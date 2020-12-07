import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class API {
  static final String API_SECRET =
      "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiYW5hcyIsImlhdCI6MTU5NTE4NTQ3OH0.rj0DsI7rS_xoVVX5z-V-qaaLmzB_MJkbfdVcLejh_jlnoSpZRvXqnBBMNJVWqwUU9TYUb1Y-uAIh-KgyUATv3A";

  static Future trackingApi(
      {String lat,
      String lng,
      String bea,
      String acc,
      BuildContext context,
      final scaffoldKey}) async {

    Map<String, dynamic> body = {
      "drv": "6d9cf8a8-a6e0-4f95-9127-3dc64e1c84ff",
      "lat": lat,
      "lng": lng,
      "bea": bea,
      "acc": acc
    };


    print(body);

//     displayCustomCircular(context);
    final response = await http
        .post("https://tracking.quick.sa/api/v1/locations",
            headers: {
              "Accept": "application/json",
              "Content-Type": "application/json",
              "Secret": API_SECRET,
            },
            body: jsonEncode(body));

    print(response.statusCode.toString());
    print(response.body);
    return response;
  }
}

showSnackBar(String message, final scaffoldKey, Color color) {
  scaffoldKey.currentState.showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 17.0),
      ),
      backgroundColor: color,
      duration: Duration(seconds: 1),
    ),
  );
}
