import 'package:api_fcm/api_fcm.dart';
import 'package:api_fcm/src/message_model.dart';

void main() {
  // get your token server from firebase dashboard
  var api = ApiFcm(tokenServer: '<yourtoken>');

  api.postMessage(
    listtokens: ['<deviceToken>'],
    notification: MessageModel(body: 'Notification test tokens'),
  );

  api.postTopics(
    topics: 'test',
    notification: MessageModel(body: 'Notification test topics'),
  );
}
