import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:corona_flutter/app/services/api.dart';

class APIService {
  APIService(this.api);
  final API api;

  Future<String> getAccessToken() async{
    final response = await http.post(
      api.tokenUri().toString(),
      headers: {'Authorization':'Basic ${api.apiKey}'},
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final accessToken = data['access_token'];
      if (accessToken != null) {
        return accessToken;
      }
    }
    throw response;
  }
}