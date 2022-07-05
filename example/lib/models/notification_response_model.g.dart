// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationResponseModel _$NotificationResponseModelFromJson(
        Map<String, dynamic> json) =>
    NotificationResponseModel(
      data: json['data'] == null
          ? null
          : NotificationData.fromJson(json['data'] as Map<String, dynamic>),
      config: json['config'] == null
          ? null
          : NotificationConfigModel.fromJson(
              json['config'] as Map<String, dynamic>),
      tracking: json['tracking'] == null
          ? null
          : NotificationTracking.fromJson(
              json['tracking'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationResponseModelToJson(
        NotificationResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'config': instance.config,
      'tracking': instance.tracking,
    };

NotificationData _$NotificationDataFromJson(Map<String, dynamic> json) =>
    NotificationData(
      title: json['title'] as String?,
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      collapsedIcon: json['collapsedIcon'] as String?,
      expandedIcon: json['expandedIcon'] as String?,
      collapsedImages: (json['collapsedImages'] as List<dynamic>?)
          ?.map((e) => NotificationImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      expandedImages: (json['expandedImages'] as List<dynamic>?)
          ?.map((e) => NotificationImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      onTapDeeplink: json['onTapDeeplink'] as String?,
      expandedButtons: (json['expandedButtons'] as List<dynamic>?)
          ?.map((e) => NotificationButton.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NotificationDataToJson(NotificationData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'messages': instance.messages,
      'collapsedIcon': instance.collapsedIcon,
      'expandedIcon': instance.expandedIcon,
      'collapsedImages': instance.collapsedImages,
      'expandedImages': instance.expandedImages,
      'onTapDeeplink': instance.onTapDeeplink,
      'expandedButtons': instance.expandedButtons,
    };

NotificationImage _$NotificationImageFromJson(Map<String, dynamic> json) =>
    NotificationImage(
      url: json['url'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$NotificationImageToJson(NotificationImage instance) =>
    <String, dynamic>{
      'url': instance.url,
      'description': instance.description,
    };

NotificationButton _$NotificationButtonFromJson(Map<String, dynamic> json) =>
    NotificationButton(
      label: json['label'] as String?,
      type: json['type'] as String?,
      onTapDeeplink: json['onTapDeeplink'] as String?,
    );

Map<String, dynamic> _$NotificationButtonToJson(NotificationButton instance) =>
    <String, dynamic>{
      'label': instance.label,
      'type': instance.type,
      'onTapDeeplink': instance.onTapDeeplink,
    };

NotificationConfigModel _$NotificationConfigModelFromJson(
        Map<String, dynamic> json) =>
    NotificationConfigModel(
      notificationId: json['notificationId'] as int?,
      channelId: json['channelId'] as String?,
      notificationKey: json['notificationKey'] as String?,
      notificationType: json['notificationType'] as String?,
      shouldTriggerNotification: json['shouldTriggerNotification'] as bool?,
      widgetStyle: json['widgetStyle'] as String?,
      widgetType: json['widgetType'] as String?,
      channelName: json['channelName'] as String?,
      channelDescription: json['channelDescription'] as String?,
      scheduleTime: json['scheduleTime'] as int?,
      clearOnClick: json['clearOnClick'] as bool?,
      shouldVibrate: json['shouldVibrate'] as bool?,
      dismissStickyOnClick: json['dismissStickyOnClick'] as bool?,
      isSticky: json['isSticky'] as bool?,
      subjectTimeEnabled: json['subjectTimeEnabled'] as bool?,
      soundEnabled: json['soundEnabled'] as bool?,
      sound: json['sound'] as String?,
      lockscreenVisibility: json['lockscreenVisibility'] as String?,
      channelImportance: json['channelImportance'] as String?,
      showBadge: json['showBadge'] as bool?,
      headsUpEnabled: json['headsUpEnabled'] as bool?,
      bypassDnd: json['bypassDnd'] as bool?,
      shouldRetriggerNotification: json['shouldRetriggerNotification'] as bool?,
      imageBackgroundColor: json['imageBackgroundColor'] as String?,
    );

Map<String, dynamic> _$NotificationConfigModelToJson(
        NotificationConfigModel instance) =>
    <String, dynamic>{
      'notificationId': instance.notificationId,
      'channelId': instance.channelId,
      'notificationKey': instance.notificationKey,
      'notificationType': instance.notificationType,
      'shouldTriggerNotification': instance.shouldTriggerNotification,
      'widgetStyle': instance.widgetStyle,
      'widgetType': instance.widgetType,
      'channelName': instance.channelName,
      'channelDescription': instance.channelDescription,
      'scheduleTime': instance.scheduleTime,
      'clearOnClick': instance.clearOnClick,
      'shouldVibrate': instance.shouldVibrate,
      'dismissStickyOnClick': instance.dismissStickyOnClick,
      'isSticky': instance.isSticky,
      'subjectTimeEnabled': instance.subjectTimeEnabled,
      'soundEnabled': instance.soundEnabled,
      'sound': instance.sound,
      'lockscreenVisibility': instance.lockscreenVisibility,
      'channelImportance': instance.channelImportance,
      'showBadge': instance.showBadge,
      'headsUpEnabled': instance.headsUpEnabled,
      'bypassDnd': instance.bypassDnd,
      'shouldRetriggerNotification': instance.shouldRetriggerNotification,
      'imageBackgroundColor': instance.imageBackgroundColor,
    };

NotificationTracking _$NotificationTrackingFromJson(
        Map<String, dynamic> json) =>
    NotificationTracking(
      notiSubType: json['notiSubType'] as String?,
      segment: json['segment'] as String?,
    );

Map<String, dynamic> _$NotificationTrackingToJson(
        NotificationTracking instance) =>
    <String, dynamic>{
      'notiSubType': instance.notiSubType,
      'segment': instance.segment,
    };
