package me.carda.awesome_notifications.notifications.models;

import android.content.Context;

import java.util.HashMap;
import java.util.Map;

import me.carda.awesome_notifications.Definitions;
import me.carda.awesome_notifications.notifications.exceptions.AwesomeNotificationException;

public class NotificationImageModel extends AbstractModel{

    public String url;
    public String description;

    public NotificationImageModel(){}

    @Override
    public NotificationImageModel fromMap(Map<String, Object> arguments) {
        url = getValueOrDefault(arguments, Definitions.NOTIFICATION_IMAGE_URL, String.class);
        description = getValueOrDefault(arguments, Definitions.NOTIFICATION_IMAGE_DESCRIPTION, String.class);
        return this;
    }

    @Override
    public Map<String, Object> toMap() {
        Map<String, Object> returnedObject = new HashMap<>();
        returnedObject.put(Definitions.NOTIFICATION_IMAGE_URL, url);
        returnedObject.put(Definitions.NOTIFICATION_IMAGE_DESCRIPTION, description);
        return returnedObject;
    }

    @Override
    public String toJson() {
        return templateToJson();
    }

    @Override
    public NotificationImageModel fromJson(String json) {
        return (NotificationImageModel) super.templateFromJson(json);
    }

    @Override
    public void validate(Context context) throws AwesomeNotificationException {

    }
}
