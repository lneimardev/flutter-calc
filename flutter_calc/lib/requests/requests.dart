import 'dart:async';
import 'dart:convert' show utf8, base64, json;
import 'package:flutter_calc/const.dart';
import 'package:http/http.dart' as http;

Future<http.Response> httpCalculo(
    double numero1, double numero2, String operacao) async {
  var body = {"numero1": numero1, "numero2": numero2, "operacao": operacao};

  return await _post("/calculadora", URL_BASE_API, body, null,
      timeout: Duration(seconds: 30));
}

Future<http.Response> _post(String url, String host, Map data, String token,
    {Duration timeout = const Duration(seconds: 10)}) async {
  var body;
  if (data != null) body = json.encode(data);

  var headers = {
    'Content-Type': 'application/json',
  };

  if (token != null) {
    headers['Authorization'] = "Bearer $token";
  }

  http.Response response = await http
      .post(Uri.parse(host + url), body: body, headers: headers)
      .timeout(timeout);

  return response;
}

Future<http.Response> _patch(String url, String host, Map data, String token,
    {Duration timeout = const Duration(seconds: 10)}) async {
  var body;
  if (data != null) body = json.encode(data);

  var headers = {
    'Content-Type': 'application/json',
  };

  if (token != null) {
    headers['Authorization'] = "Bearer $token";
  }

  http.Response response = await http
      .patch(
          //Uri(host: url),
          Uri.parse(host + url),
          body: body,
          headers: headers)
      .timeout(timeout);

  return response;
}

Future<http.Response> _postForm(String url, String host, Map data,
    {Duration timeout = const Duration(seconds: 10), Map customHeader}) async {
  var headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'POST, GET, OPTIONS, PUT, DELETE, HEAD'
  };

  if (customHeader != null) headers.addAll(customHeader);

  http.Response response = await http
      .post(
          //Uri(host: url),
          Uri.parse(host + url),
          body: data,
          headers: headers)
      .timeout(timeout);

  return response;
}

Future<http.Response> _get(String url, String host, String token,
    {Duration timeout = const Duration(seconds: 10)}) async {
  Map<String, String> headers = new Map();

  if (token != null) {
    headers['Authorization'] = 'bearer $token';
  }

  http.Response response = await http
      .get(
          //Uri(host: url),
          Uri.parse(host + url),
          headers: headers)
      .timeout(timeout);

  return response;
}
