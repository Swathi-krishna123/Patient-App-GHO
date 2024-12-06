import 'dart:developer';

import 'package:dio/dio.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

var baseUrl = "https://rereadmedical.azurewebsites.net/gmo/iin/";

class DioHandler {
  static final Dio dio = Dio();

  static Future<dynamic> dioPOST({
    dynamic body,
  }) async {
    Map<String, dynamic> headers = {
      "content-type": "application/json",
    };
    DioHandler.dio.options.headers.addAll(headers);
    try {
      Response response;

      response = await DioHandler.dio
          .post(
            baseUrl,
            data: body,
          )
          .timeout(const Duration(seconds: 60));

      return response.data;
    } catch (e) {
      log("DioError: $e");
      return e;
    }
  }

  static Future<dynamic> dioPOSTGetTOken({dynamic body, dynamic path}) async {
    Map<String, dynamic> headers = {
      "content-type": "application/json",
    };
    DioHandler.dio.options.headers.addAll(headers);
    try {
      Response response;

      response = await DioHandler.dio
          .post(path, data: body)
          .timeout(const Duration(seconds: 60));

      return response.data;
    } catch (e) {
      log("DioError: $e");
      return e;
    }
  }

  static Future<dynamic> dioPOSTStripe({
    dynamic body,
  }) async {
    Map<String, dynamic> headers = {
      // 'Authorization': 'Bearer ${dotenv.env['STRIPE_SECRET']}',
      "content-type": "application/x-www-form-urlencoded",
    };
    DioHandler.dio.options.headers.addAll(headers);
    try {
      Response response;

      response = await DioHandler.dio
          .post(
            "https://api.stripe.com/v1/payment_intents",
            data: body,
          )
          .timeout(const Duration(seconds: 60));

      return response.data;
    } catch (e) {
      log("DioError: $e");
      return e;
    }
  }
}
