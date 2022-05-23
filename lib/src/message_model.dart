class MessageModel {
  // The notification's title.
  final String? title;
  // The notification's body text.
  final String? body;
  // The notification's icon color, expressed in #rrggbb format.
  final String? color;
  // The sound to play when the device receives the notification.
  // Supports "default" or the filename of a sound resource bundled in the app. Sound files must reside in /res/raw/.
  final String? sound;
  //The notification's image, exemple: "https://foo.bar/pizza-monster.png"
  final String? image;

  MessageModel({
    this.title,
    this.body,
    this.color,
    this.sound,
    this.image,
  });

  Map<String, String?> toMap() {
    final Map<String, String?> map = {};
    map['title'] = title;
    map['body'] = body;
    map['color'] = color;
    map['sound'] = sound;
    map['image'] = image;
    return map;
  }
}
