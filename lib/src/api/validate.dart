import 'package:meta/meta.dart';
import 'package:ravepay/src/api/api.dart';
import 'package:ravepay/src/constants/auth.dart';
import 'package:ravepay/src/constants/endpoints.dart';
import 'package:ravepay/src/constants/strings.dart';
import 'package:ravepay/src/models/validate/validate_result.dart';
import 'package:ravepay/src/utils/exceptions.dart';
import 'package:ravepay/src/utils/log.dart';
import 'package:ravepay/src/utils/response.dart';

class Validate extends Api {
  Future<Response<ValidateResult>> charge({
    @required String authModelUsed,
    @required String authUrl,
    @required String flwRef,
    @required String otp,
  }) async {
    assert(flwRef != null);
    assert(authModelUsed != null);

    final logTag = '$runtimeType.charge()';

    if (authUrl != null) {
      Log().debug(logTag, '${Strings.authUrlProvidedValidationMessage} $authUrl');
      throw RedirectException(authUrl, Strings.authUrlProvidedValidationMessage);
    }

    if (authModelUsed == null) {
      Log().debug(logTag, 'No authModel provided');
      throw Exception('No authModel provided');
    }

    String url;
    final payload = {'PBFPubKey': keys.public, 'otp': otp};

    switch (authModelUsed.toLowerCase()) {
      case AuthType.PIN:
        Log().debug(logTag, 'Using OTP for ${AuthType.PIN}.');

        url = Endpoints.validateCardCharge;
        payload['transaction_reference'] = flwRef;
        break;

      case AuthType.AUTH:
        Log().debug(logTag, 'Using OTP for ${AuthType.AUTH}.');

        url = Endpoints.validateAccountCharge;
        payload['transactionreference'] = flwRef;
        break;

      case AuthType.VBVSECURECODE:
        Log().debug(logTag, 'Using ${AuthType.VBVSECURECODE}.');

        // Validation for foreign cards
        Log().error(logTag, Strings.authUrlValidationMessage);
        throw Exception(Strings.authUrlValidationMessage);
        break;

      default:
        Log().error(logTag, Strings.invalidValidationMessage);
        throw Exception(Strings.invalidValidationMessage);
    }

    if (url == null) {
      Log().debug(logTag, Strings.cannotCompleteValidationMessage);
      throw Exception(Strings.cannotCompleteValidationMessage);
    }

    Log().debug(logTag, payload);

    final _response = Response<ValidateResult>(
      await http.post(url, payload),
      onTransform: (dynamic data, _) => ValidateResult.fromJson(data),
    );

    Log().debug('$logTag -> Response', _response);

    return _response;
  }
}
