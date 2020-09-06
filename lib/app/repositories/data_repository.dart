import 'package:corona_flutter/app/services/api.dart';
import 'package:corona_flutter/app/services/api_service.dart';
import 'package:flutter/foundation.dart';

class DataRepository {
  DataRepository({@required this.apiService});
  final APIService apiService;

  String _accessToken;

  Future<int> getEndpointData(Endpoint endpoint) async {
    if (_accessToken == null) {
      _accessToken = await this.apiService.getAccessToken();
    }
    
    return await apiService.getEndpointData(accessToken: _accessToken, endpoint: endpoint);
  }
}