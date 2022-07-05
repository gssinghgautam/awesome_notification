import 'package:awesome_notifications/awesome_notifications.dart';

class EnumUtils {
  static NotificationSound getNotificationSoundFromString(String? value) {
    if (value == null) {
      return NotificationSound.DEFAULT;
    }
    final values = NotificationSound.values
        .where((element) => element.name == value)
        .toList();
    return values.isNotEmpty ? values.first : NotificationSound.DEFAULT;
  }

  static NotificationWidgetType getWidgetTypeFromString(String? value) {
    if (value == null) {
      return NotificationWidgetType.DEFAULT;
    }
    final values = NotificationWidgetType.values
        .where((element) => element.name == value)
        .toList();
    return values.isNotEmpty ? values.first : NotificationWidgetType.DEFAULT;
  }

  static NotificationWidgetStyle getWidgetStyleFromString(String? value) {
    if (value == null) {
      return NotificationWidgetStyle.DEFAULT;
    }
    final values = NotificationWidgetStyle.values
        .where((element) => element.name == value)
        .toList();
    return values.isNotEmpty ? values.first : NotificationWidgetStyle.DEFAULT;
  }

  static NotificationLockScreenVisibility getLockScreenVisibilityFrom(
      String? value) {
    if (value == null) {
      return NotificationLockScreenVisibility.VISIBILITY_PUBLIC;
    }
    final values = NotificationLockScreenVisibility.values
        .where((element) => element.name == value)
        .toList();

    return values.isNotEmpty
        ? values.first
        : NotificationLockScreenVisibility.VISIBILITY_PUBLIC;
  }
}
