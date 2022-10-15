import 'package:injectable/injectable.dart';
import 'package:toeic/apis/rest_client_factory.dart';
import '../../apis/models/user.dart';
import '../../apis/token_rest_client.dart';


import '../../hive/hive_service.dart';
import '../user_repository.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl extends UserRepository {

  final TokenRestClient _tokenRestClient;
  final HiveService hiveService;

  UserRepositoryImpl(RestClientFactory factory, this.hiveService) :
        _tokenRestClient = factory.obtainTokenRestClient();


  @override
  Future<User> updateLv1(Map<String, dynamic> data) {
    return _tokenRestClient.getUserInfo();
  }
}