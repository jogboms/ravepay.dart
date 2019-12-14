import 'package:ravepay/src/api/api.dart';
import 'package:ravepay/src/constants/endpoints.dart';
import 'package:ravepay/src/models/bank.dart';
import 'package:ravepay/src/utils/log.dart';
import 'package:ravepay/src/utils/response.dart';

class Banks extends Api {
  Future<Response<List<Bank>>> fetch() async {
    final _response = Response<List<Bank>>(
      await http.get(Endpoints.getBanks),
      onTransform: (dynamic data, _) {
        if (data is List<dynamic>) {
          return List.generate(data.length, (int index) => Bank.fromJson(data[index]));
        }
        return data;
      },
    );

    Log().debug('$runtimeType.fetch() -> Response', _response);

    return _response;
  }
}
