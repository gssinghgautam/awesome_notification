//
//  NotificationViewController.swift
//  TwoImageNotification
//
//  Created by Healofz on 13/07/22.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {
    @IBOutlet weak var titleLable: UILabel!
    
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet var label: UILabel?
    
    @IBOutlet weak var smallIconImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
    }
    @IBOutlet weak var fourthImageView: UIImageView!
    @IBOutlet weak var thirdImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    
    @IBOutlet weak var firstImageView: UIImageView!
    func didReceive(_ notification: UNNotification) {
        self.label?.text = notification.request.content.body
    }
}
