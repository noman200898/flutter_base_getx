import 'dart:convert';

import 'remote_datasource.dart';
import 'rest_service.dart';
import '../../models/message_response.dart';

class RemoteDataSourceImpl extends RemoteDataSource{

  final RestService service;

  RemoteDataSourceImpl({required this.service});

  @override
  Future<MessageResponse> getMessage() async{
    var response = await service.getMessage();

    return MessageResponse.fromJson(jsonDecode(response.data));

  }

}