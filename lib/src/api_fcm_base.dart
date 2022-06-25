import 'dart:convert';
import 'package:api_fcm/src/message_model.dart';
import 'package:api_fcm/src/request_fcm_model.dart';
import 'package:http/http.dart' as http;

class ApiFcm {
  final String url = 'https://fcm.googleapis.com/fcm';
  final String tokenServer;

  ApiFcm({required this.tokenServer});

  Future<RequestFcmModel> postMessage({
    required List<String?> listtokens,
    required MessageModel notification,
    Map<String, String>? data,
  }) async {
    listtokens.removeWhere((element) => element == null || element.isEmpty);
    if (listtokens.isEmpty) {
      throw Exception('Empty id list');
    }
    var result = await http.post(
      Uri.parse('$url/send'),
      body: jsonEncode({
        'registration_ids': listtokens,
        'notification': notification.toMap(),
        'data': data,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenServer'
      },
    );
    return RequestFcmModel(
      body: result.body,
      isSend: result.statusCode == 200,
    );
  }

  Future<RequestFcmModel> postTopics({
    required String topics,
    required MessageModel notification,
    Map<String, String>? data,
  }) async {
    var result = await http.post(
      Uri.parse('$url/send'),
      body: jsonEncode({
        'to': '/topics/$topics',
        'notification': notification.toMap(),
        'data': data,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenServer'
      },
    );

    return RequestFcmModel(
      body: result.body,
      isSend: result.statusCode == 200,
    );
  }
}
