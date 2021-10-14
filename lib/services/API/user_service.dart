import '../../constants/config.dart' show APISERVER;
import '../../models/user.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'user_service.g.dart';


@RestApi(baseUrl: APISERVER)
abstract class UserService {
  factory UserService(Dio dio, {String baseUrl}) = _UserService;


  @GET("/user")
  Future<User> getUser();


}