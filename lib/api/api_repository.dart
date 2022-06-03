import '../models/historical_data_model.dart';
import 'api_home.dart';

class ApiRepository {
  final _providerHome = APIHome();

  Future<HistoricalDataModel> homePageData(String entityNames) async {
    return _providerHome.homePageData(entityNames);
  }
}

class NetworkError extends Error {}
