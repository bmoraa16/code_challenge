import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/historical_data_model.dart';
import '../src/utils/api_constants.dart';

class APIHome {
  Future<HistoricalDataModel> homePageData(String entityName) async {
    http.Response responseHomeData = await http.get(
      Uri.parse(apiHomeService + entityName + range),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "X-API-KEY": "eUZ2ddZ4pk4ZCQ5NH5k4Z9TlbNp1Z5Z51JMZmfxZ"
      },
    );

    var body = jsonDecode(utf8.decode(responseHomeData.bodyBytes)) as Map;
    HistoricalDataModel bodyFinal = HistoricalDataModel.fromJson(body);
    return bodyFinal;
  }
}
