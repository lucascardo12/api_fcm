# Api Fcm Plugin for Dart

A Dart plugin to use the [Firebase Cloud Messaging API](https://firebase.google.com/docs/cloud-messaging).

To learn more about Firebase Cloud Messaging, please visit the [Firebase website](https://firebase.google.com/products/cloud-messaging)

## Getting Started

To get started with Firebase Cloud Messaging for Dart, please [see the documentation](https://firebase.flutter.dev/docs/messaging/overview).

## Usage

Exemple

```dart
import 'package:api_fcm/api_fcm.dart';
import 'package:api_fcm/src/message_model.dart';

void main() {
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


```