import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:awesome_notifications/src/models/base_notification_content.dart';
import 'package:flutter/material.dart';

/// Main content of notification
/// If notification has no [body] or [title], it will only be created, but not displayed to the user (background notification).
class NotificationContent extends BaseNotificationContent {
  bool? hideLargeIconOnExpand;
  int? progress;
  String? ticker;
  String? collapsedIcon;
  String? expandedIcon;
  NotificationLayout? notificationLayout;
  NotificationSound? notificationSound;
  NotificationWidgetStyle? notificationWidgetStyle;
  NotificationWidgetType? notificationWidgetType;
  NotificationLockScreenVisibility? notificationLockScreenVisibility;
  List<NotificationImageModel>? collapsedImages;
  List<NotificationImageModel>? expandedImages;
  List<String>? notificationBodyMessages;
  bool? displayOnForeground;
  bool? displayOnBackground;
  bool? locked;

  NotificationContent({
    required int id,
    required String channelKey,
    String? title,
    String? body,
    String? groupKey,
    String? summary,
    bool? showWhen,
    bool? wakeUpScreen,
    bool? fullScreenIntent,
    bool? criticalAlert,
    String? icon,
    String? largeIcon,
    String? bigPicture,
    String? customSound,
    bool? roundedLargeIcon,
    bool? roundedBigPicture,
    bool? autoDismissible,
    Color? color,
    Color? backgroundColor,
    Map<String, String>? payload,
    NotificationCategory? category,
    this.collapsedIcon,
    this.expandedIcon,
    this.notificationBodyMessages,
    this.expandedImages,
    this.collapsedImages,
    this.notificationLayout,
    this.notificationSound,
    this.notificationWidgetType,
    this.notificationWidgetStyle,
    this.notificationLockScreenVisibility,
    this.hideLargeIconOnExpand,
    this.locked,
    this.progress,
    this.ticker,
    this.displayOnForeground,
    this.displayOnBackground,
  }) : super(
            id: id,
            channelKey: channelKey,
            groupKey: groupKey,
            title: title,
            body: body,
            summary: summary,
            wakeUpScreen: wakeUpScreen,
            fullScreenIntent: fullScreenIntent,
            category: category,
            criticalAlert: criticalAlert,
            showWhen: showWhen,
            payload: payload,
            icon: icon,
            largeIcon: largeIcon,
            bigPicture: bigPicture,
            customSound: customSound,
            autoDismissible: autoDismissible,
            color: color,
            backgroundColor: backgroundColor,
            roundedLargeIcon: roundedLargeIcon,
            roundedBigPicture: roundedBigPicture);

  @override
  NotificationContent? fromMap(Map<String, dynamic> mapData) {
    super.fromMap(mapData);

    this.notificationBodyMessages =
        (mapData[NOTIFICATION_BODY_MESSAGES] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList();

    if (mapData.containsKey(NOTIFICATION_IMAGE_COLLAPSED_IMAGES)) {
      this.collapsedImages =
          (mapData[NOTIFICATION_IMAGE_COLLAPSED_IMAGES] as List<dynamic>?)
              ?.map((e) =>
                  NotificationImageModel().fromMap(e as Map<String, dynamic>))
              .cast<NotificationImageModel>()
              .toList();
    }

    if (mapData.containsKey(NOTIFICATION_IMAGE_EXPANDED_IMAGES)) {
      this.expandedImages =
          (mapData[NOTIFICATION_IMAGE_EXPANDED_IMAGES] as List<dynamic>?)
              ?.map((e) =>
                  NotificationImageModel().fromMap(e as Map<String, dynamic>))
              .cast<NotificationImageModel>()
              .toList();
    }

    this.hideLargeIconOnExpand = AwesomeAssertUtils.extractValue(
        NOTIFICATION_HIDE_LARGE_ICON_ON_EXPAND, mapData, bool);

    this.progress =
        AwesomeAssertUtils.extractValue(NOTIFICATION_PROGRESS, mapData, int);
    this.ticker =
        AwesomeAssertUtils.extractValue(NOTIFICATION_TICKER, mapData, String);

    this.collapsedIcon = AwesomeAssertUtils.extractValue(
        NOTIFICATION_COLLAPSED_ICON, mapData, String);

    this.expandedIcon = AwesomeAssertUtils.extractValue(
        NOTIFICATION_EXPANDED_ICON, mapData, String);

    this.locked =
        AwesomeAssertUtils.extractValue(NOTIFICATION_LOCKED, mapData, bool);

    this.notificationLayout = AwesomeAssertUtils.extractEnum(
        NOTIFICATION_LAYOUT, mapData, NotificationLayout.values);

    this.notificationSound = AwesomeAssertUtils.extractEnum(
        NOTIFICATION_SOUND, mapData, NotificationSound.values);

    this.notificationWidgetStyle = AwesomeAssertUtils.extractEnum(
        NOTIFICATION_WIDGET_STYLE, mapData, NotificationWidgetStyle.values);

    this.notificationWidgetType = AwesomeAssertUtils.extractEnum(
        NOTIFICATION_WIDGET_TYPE, mapData, NotificationWidgetType.values);

    this.notificationLockScreenVisibility = AwesomeAssertUtils.extractEnum(
        NOTIFICATION_LOCK_SCREEN_VISIBILITY,
        mapData,
        NotificationLockScreenVisibility.values);

    this.displayOnForeground = AwesomeAssertUtils.extractValue(
        NOTIFICATION_DISPLAY_ON_FOREGROUND, mapData, bool);
    this.displayOnBackground = AwesomeAssertUtils.extractValue(
        NOTIFICATION_DISPLAY_ON_BACKGROUND, mapData, bool);

    try {
      validate();
    } catch (e) {
      return null;
    }

    return this;
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> dataMap = super.toMap();

    List<Map<String, dynamic>> collapsedImagesData = [];
    if (collapsedImages != null) {
      for (NotificationImageModel image in collapsedImages!) {
        Map<String, dynamic> data = image.toMap();
        if (data.isNotEmpty) collapsedImagesData.add(data);
      }
    }

    List<Map<String, dynamic>> expandedImagesData = [];
    if (expandedImages != null) {
      for (NotificationImageModel image in expandedImages!) {
        Map<String, dynamic> data = image.toMap();
        if (data.isNotEmpty) expandedImagesData.add(data);
      }
    }
    dataMap = dataMap
      ..addAll({
        NOTIFICATION_BODY_MESSAGES: notificationBodyMessages,
        NOTIFICATION_HIDE_LARGE_ICON_ON_EXPAND: hideLargeIconOnExpand,
        NOTIFICATION_PROGRESS: progress,
        NOTIFICATION_TICKER: ticker,
        NOTIFICATION_COLLAPSED_ICON: collapsedIcon,
        NOTIFICATION_EXPANDED_ICON: expandedIcon,
        NOTIFICATION_LOCKED: locked,
        NOTIFICATION_LAYOUT:
            AwesomeAssertUtils.toSimpleEnumString(notificationLayout),
        NOTIFICATION_SOUND:
            AwesomeAssertUtils.toSimpleEnumString(notificationSound),
        NOTIFICATION_LOCK_SCREEN_VISIBILITY:
            AwesomeAssertUtils.toSimpleEnumString(
                notificationLockScreenVisibility),
        NOTIFICATION_WIDGET_TYPE:
            AwesomeAssertUtils.toSimpleEnumString(notificationWidgetType),
        NOTIFICATION_WIDGET_STYLE:
            AwesomeAssertUtils.toSimpleEnumString(notificationWidgetStyle),
        NOTIFICATION_DISPLAY_ON_FOREGROUND: displayOnForeground,
        NOTIFICATION_DISPLAY_ON_BACKGROUND: displayOnBackground,
        NOTIFICATION_IMAGE_EXPANDED_IMAGES: expandedImagesData,
        NOTIFICATION_IMAGE_COLLAPSED_IMAGES: collapsedImagesData,
      });
    return dataMap;
  }

  @override
  String toString() {
    return toMap().toString().replaceAll(',', ',\n');
  }
}
