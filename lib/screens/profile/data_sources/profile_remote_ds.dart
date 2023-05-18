import 'package:negarestan/screens/profile/usecases/me_usecase.dart';
import 'package:network_manager/network_manager.dart';

import '../../../core/constants/apis.dart';
import '../../../core/error/exception.dart';
import '../interfaces/profile_data_source_interface.dart';

class ProfileRemoteDataSource implements ProfileDataSourceInterface {
  @override
  Future<dynamic> me(MeRequest request) async {
    NetworkRequest meNR = NetworkRequest(api: Apis.baseUrl + Apis.me, data: request.toJson(), timeOut: const Duration(seconds: 15));
    NetworkResponse meResponse = await meNR.post();
    if (meResponse.responseStatus) {
      try {
        bool success = meResponse.responseBody;
        return success;
      } catch (e, trace) {
        throw ParseException(message: e.toString(), trace: trace);
      }
    } else {
      throw ServerException(
        code: meResponse.responseCode,
        message: meResponse.extractedMessage!,
        trace: StackTrace.fromString("ProfileRemoteDataSource.login"),
      );
    }
  }
}
