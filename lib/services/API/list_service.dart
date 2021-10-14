import '../../models/lists.dart';

import '../../constants/config.dart' show APISERVER;

import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'list_service.g.dart';


@RestApi(baseUrl: APISERVER)
abstract class ListService {
  factory ListService(Dio dio, {String baseUrl}) = _ListService;

  @GET("/group/list")
  Future<List<Lists>> getLists();


  @POST("/group/add")
  Future<Lists> addGroup(@Body() Lists list);



}