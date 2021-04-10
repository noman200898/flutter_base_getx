import 'dart:async';

import 'package:base_application/utils/shared_pref_utils.dart';

import '../../../utils/constants.dart';
import 'local_datasource.dart';
import '../../models/message_response.dart';

class LocalDataSourceImpl implements LocalDataSource {
  @override
  Future<MessageResponse> getMessageResponse() async{

    String message = await SharedPrefUtil.getString(KeyConstants.MESSAGE_KEY);
    if(message.isEmpty) message = "Hello world!"; //for the first time
    return MessageResponse(success: true, message: message);
  }

  @override
  void setMessageResponse(MessageResponse response) async{
    if(response.message!=null)
      await SharedPrefUtil.writeString(KeyConstants.MESSAGE_KEY, response.message!);
  }

}