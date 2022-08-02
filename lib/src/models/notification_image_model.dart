import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:awesome_notifications/src/models/model.dart';

class NotificationImageModel extends Model {
  String? url;
  String? description;

  NotificationImageModel({this.url, this.description});

  @override
  NotificationImageModel? fromMap(Map<String, dynamic> mapData) {
    this.url = AwesomeAssertUtils.extractValue(
        NOTIFICATION_IMAGE_URL, mapData, String);
    this.description = AwesomeAssertUtils.extractValue(
        NOTIFICATION_IMAGE_DESCRIPTION, mapData, String);
    return this;
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      NOTIFICATION_IMAGE_URL: url,
      NOTIFICATION_IMAGE_DESCRIPTION: description,
    };
  }

  @override
  void validate() {}
}