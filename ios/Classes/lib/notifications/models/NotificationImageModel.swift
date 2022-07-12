//
//  NotificationImageModel.swift
//  awesome_notifications
//
//  Created by Healofz on 12/07/22.
//

import Foundation

public class NotificationImageModel : AbstractModel {
    var url: String?
    var description: String?
    
    public func fromMap(arguments: [String : Any?]?) -> AbstractModel? {
        if(arguments == nil){ return self }
       
        self.url = MapUtils<String>.getValueOrDefault(reference: Definitions.NOTIFICATION_IMAGE_URL, arguments: arguments)
        self.description = MapUtils<String>.getValueOrDefault(reference: Definitions.NOTIFICATION_IMAGE_DESCRIPTION, arguments: arguments)

        return self
    }
    
    public func toMap() -> [String : Any?] {
        var mapData:[String: Any?] = [:]
        
        if(url != nil) {mapData[Definitions.NOTIFICATION_IMAGE_URL] = self.url}
        if(description != nil) {mapData[Definitions.NOTIFICATION_IMAGE_DESCRIPTION] = self.description}
        
        return mapData
    }
    
    public func validate() throws {
    }
}
