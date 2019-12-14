import 'package:ravepay/src/api/api.dart';
import 'package:ravepay/src/constants/endpoints.dart';
import 'package:ravepay/src/models/bank.dart';
import 'package:ravepay/src/models/main.dart';
import 'package:ravepay/src/utils/log.dart';
import 'package:ravepay/src/utils/response.dart';

class Banks extends Api {
  Future<Response<List<Bank>>> fetch() async {
    final _response = Response<List<Bank>>(
      await http.get(Endpoints.getBanks),
      onTransform: (dynamic data, _) => Model.generator<Bank, Map<String, dynamic>>(data, Bank.fromJson),
    );

    Log().debug('Banks.fetch() -> Response', _response);

    return _response;
  }
}
