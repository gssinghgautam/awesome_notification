import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'notification_response_model.g.dart';

@JsonSerializable()
class NotificationResponseModel extends Equatable {
  final NotificationData? data;
  final NotificationConfigModel? config;
  final NotificationTracking? tracking;

  const NotificationResponseModel({this.data, this.config, this.tracking});

  factory NotificationResponseModel.fromJson(Map<String, dynamic> json) {
    return _$NotificationResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NotificationResponseModelToJson(this);

  @override
  List<Object?> get props => [data, config, tracking];
}

@JsonSerializable()
class NotificationData extends Equatable {
  final String? title;
  final List<String>? messages;
  final String? collapsedIcon;
  final String? expandedIcon;
  final List<NotificationImage>? collapsedImages;
  final List<NotificationImage>? expandedImages;
  final String? onTapDeeplink;
  final List<NotificationButton>? expandedButtons;

  const NotificationData({
    this.title,
    this.messages,
    this.collapsedIcon,
    this.expandedIcon,
    this.collapsedImages,
    this.expandedImages,
    this.onTapDeeplink,
    this.expandedButtons,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) {
    return _$NotificationDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NotificationDataToJson(this);

  @override
  List<Object?> get props => [
        title,
        messages,
        collapsedIcon,
        expandedIcon,
        collapsedImages,
        expandedImages,
        onTapDeeplink,
        expandedButtons
      ];
}

@JsonSerializable()
class NotificationImage extends Equatable {
  final String? url;
  final String? description;

  const NotificationImage({this.url, this.description});

  factory NotificationImage.fromJson(Map<String, dynamic> json) {
    return _$NotificationImageFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NotificationImageToJson(this);

  @override
  List<Object?> get props => [url, description];
}

@JsonSerializable()
class NotificationButton extends Equatable {
  final String? label;
  final String? type;
  final String? onTapDeeplink;

  const NotificationButton({
    this.label,
    this.type,
    this.onTapDeeplink,
  });

  factory NotificationButton.fromJson(Map<String, dynamic> json) {
    return _$NotificationButtonFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NotificationButtonToJson(this);

  @override
  List<Object?> get props => [
        label,
        type,
        onTapDeeplink,
      ];
}

@JsonSerializable()
class NotificationConfigModel extends Equatable {
  final int? notificationId;
  final String? channelId;
  final String? notificationKey;
  final String? notificationType;
  final bool? shouldTriggerNotification;
  final String? widgetStyle;
  final String? widgetType;
  final String? channelName;
  final String? channelDescription;
  final int? scheduleTime;
  final bool? clearOnClick;
  final bool? shouldVibrate;
  final bool? dismissStickyOnClick;
  final bool? isSticky;
  final bool? subjectTimeEnabled;
  final bool? soundEnabled;
  final String? sound;
  final String? lockscreenVisibility;
  final String? channelImportance;
  final bool? showBadge;
  final bool? headsUpEnabled;
  final bool? bypassDnd;
  final bool? shouldRetriggerNotification;
  final String? imageBackgroundColor;

  const NotificationConfigModel({
    this.notificationId,
    this.channelId,
    this.notificationKey,
    this.notificationType,
    this.shouldTriggerNotification,
    this.widgetStyle,
    this.widgetType,
    this.channelName,
    this.channelDescription,
    this.scheduleTime,
    this.clearOnClick,
    this.shouldVibrate,
    this.dismissStickyOnClick,
    this.isSticky,
    this.subjectTimeEnabled,
    this.soundEnabled,
    this.sound,
    this.lockscreenVisibility,
    this.channelImportance,
    this.showBadge,
    this.headsUpEnabled,
    this.bypassDnd,
    this.shouldRetriggerNotification,
    this.imageBackgroundColor,
  });

  factory NotificationConfigModel.fromJson(Map<String, dynamic> json) {
    return _$NotificationConfigModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NotificationConfigModelToJson(this);

  @override
  List<Object?> get props => [
        notificationId,
        channelId,
        notificationKey,
        notificationType,
        shouldTriggerNotification,
        widgetStyle,
        widgetType,
        channelName,
        channelDescription,
        scheduleTime,
        clearOnClick,
        shouldVibrate,
        dismissStickyOnClick,
        isSticky,
        subjectTimeEnabled,
        soundEnabled,
        sound,
        lockscreenVisibility,
        channelImportance,
        showBadge,
        headsUpEnabled,
        bypassDnd,
        shouldRetriggerNotification,
        imageBackgroundColor,
      ];
}

@JsonSerializable()
class NotificationTracking extends Equatable {
  final String? notiSubType;
  final String? segment;

  const NotificationTracking({this.notiSubType, this.segment});

  factory NotificationTracking.fromJson(Map<String, dynamic> json) {
    return _$NotificationTrackingFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NotificationTrackingToJson(this);

  @override
  List<Object?> get props => [
        notiSubType,
        segment,
      ];
}
