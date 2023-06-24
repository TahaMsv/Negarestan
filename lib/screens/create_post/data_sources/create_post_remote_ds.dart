import 'package:negarestan/core/classes/user.dart';
import 'package:negarestan/screens/post_details/usecases/post_details_usecase.dart';
import 'package:negarestan/screens/user_details/usecases/unfollow_usecase.dart';
import 'package:negarestan/screens/user_details/usecases/user_details_usecase.dart';
import 'package:network_manager/network_manager.dart';

import '../../../core/classes/post.dart';
import '../../../core/constants/apis.dart';
import '../../../core/error/exception.dart';
import '../interfaces/create_post_data_source_interface.dart';
import '../usecases/create_post_usecase.dart';

class CreatePostRemoteDataSource implements CreatePostDataSourceInterface {

  @override
  Future<Post> createPost(CreatePostRequest request) async {
   //  NetworkRequest userDNR = NetworkRequest(api: '${Apis.baseUrl}users/${request.userID}/v0/', data: request.toJson(), timeOut: const Duration(seconds: 15));
   // print(userDNR.api);
   //  NetworkResponse uDResponse = await userDNR.get();
   //  print(uDResponse.responseStatus);
   //  print(uDResponse.responseDetails);
   //  if (uDResponse.responseStatus) {
   //    try {
   //      User user = User.fromJson(uDResponse.responseBody);
   //      return user;
   //    } catch (e, trace) {
   //      throw ParseException(message: e.toString(), trace: trace);
   //    }
   //  } else {
   //    throw ServerException(
   //      code: uDResponse.responseCode,
   //      message: uDResponse.extractedMessage!,
   //      trace: StackTrace.fromString("UserDetailsRemoteDataSource.userDetials"),
   //    );
   //  }
    return Post();
  }



}
