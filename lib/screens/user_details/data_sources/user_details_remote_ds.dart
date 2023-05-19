import 'package:negarestan/screens/user_details/usecases/unfollow_usecase.dart';
import 'package:network_manager/network_manager.dart';

import '../../../core/constants/apis.dart';
import '../../../core/error/exception.dart';
import '../interfaces/user_details_data_source_interface.dart';
import '../usecases/follow_usecase.dart';

class UserDetailsRemoteDataSource implements UserDetailsDataSourceInterface {
  @override
  Future<bool> follow(FollowRequest request) async {
    NetworkRequest followNR = NetworkRequest(api: Apis.baseUrl + Apis.follow, data: request.toJson(), timeOut: const Duration(seconds: 15));
    NetworkResponse followResponse = await followNR.post();
    if (followResponse.responseStatus) {
      try {
        bool success = followResponse.responseBody["success"];
        return success;
      } catch (e, trace) {
        throw ParseException(message: e.toString(), trace: trace);
      }
    } else {
      throw ServerException(
        code: followResponse.responseCode,
        message: followResponse.extractedMessage!,
        trace: StackTrace.fromString("PeopleRemoteDataSource.login"),
      );
    }
  }

  @override
  Future<bool> unfollow(UnFollowRequest request) {
    // TODO: implement unfollow
    throw UnimplementedError();
  }
}
