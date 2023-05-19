import 'package:negarestan/screens/profile/usecases/me_usecase.dart';
import 'package:network_manager/network_manager.dart';

import '../../../core/classes/user.dart';
import '../../../core/constants/apis.dart';
import '../../../core/error/exception.dart';
import '../interfaces/profile_data_source_interface.dart';

class ProfileRemoteDataSource implements ProfileDataSourceInterface {
  @override
  Future<User> me(MeRequest request) async {
    print("here12");
    NetworkRequest meNR = NetworkRequest(api: Apis.baseUrl + Apis.me, data: request.toJson(), timeOut: const Duration(seconds: 15));
    print(meNR.options.toString());
    NetworkResponse meResponse = await meNR.post();
    print(meResponse.responseDetails);
    if (meResponse.responseStatus) {
      try {
        User user = User.fromJson(meResponse.responseBody);
        return user;
      } catch (e, trace) {
        throw ParseException(message: e.toString(), trace: trace);
      }
    } else {
      throw ServerException(
        code: meResponse.responseCode,
        message: meResponse.extractedMessage!,
        trace: StackTrace.fromString("ProfileRemoteDataSource.me"),
      );
    }
  }
}
