//
//  RootViewController.swift
//  DeTai
//
//  Created by Long Nguyen on 7/16/17.
//  Copyright © 2017 Nhung. All rights reserved.
//

import UIKit

enum RootTab {
    case babyTrackerTab
    case locationTab
    case dashboardTab
    case inboxTab
    case profileTab
    
    var title: String {
        switch self {
        case .babyTrackerTab:
            return "Nhật Kí"
        case .locationTab:
            return "Vị Trí"
        case .dashboardTab:
            return "Tính Năng"
        case .inboxTab:
            return "Tin Nhắn"
        case .profileTab:
            return "Cá Nhân"
        }
    }
    
    var icon: UIImage? {
        switch self {
        case .babyTrackerTab:
            return #imageLiteral(resourceName: "baby")
        case .locationTab:
            return #imageLiteral(resourceName: "baby")
        case .dashboardTab:
            return #imageLiteral(resourceName: "baby")
        case .inboxTab:
            return #imageLiteral(resourceName: "baby")
        case .profileTab:
            return #imageLiteral(resourceName: "baby")
        }
    }
    
    var selected_icon: UIImage? {
        switch self {
        case .babyTrackerTab:
            return #imageLiteral(resourceName: "baby")
        case .locationTab:
            return #imageLiteral(resourceName: "baby")
        case .dashboardTab:
            return #imageLiteral(resourceName: "baby")
        case .inboxTab:
            return #imageLiteral(resourceName: "baby")
        case .profileTab:
            return #imageLiteral(resourceName: "baby")
        }
    }
    
    var controller: UINavigationController {
        switch self {
        case .babyTrackerTab:
            let storyboard = UIStoryboard(name: "BabyTracker", bundle: nil)
            return storyboard.instantiateInitialViewController() as! UINavigationController
        case .locationTab:
            let storyboard = UIStoryboard(name: "Location", bundle: nil)
            return storyboard.instantiateInitialViewController() as! UINavigationController
        case .dashboardTab:
            let storyboard = UIStoryboard(name: "Dashboard", bundle: nil)
            return storyboard.instantiateInitialViewController() as! UINavigationController
        case .inboxTab:
            let storyboard = UIStoryboard(name: "Inbox", bundle: nil)
            return storyboard.instantiateInitialViewController() as! UINavigationController
        case .profileTab:
            let storyboard = UIStoryboard(name: "Profile", bundle: nil)
            return storyboard.instantiateInitialViewController() as! UINavigationController
        }
    }
    
    var index: Int {
        switch self {
        case .babyTrackerTab:
            return 0
        case .locationTab:
            return 1
        case .dashboardTab:
            return 2
        case .inboxTab:
            return 3
        case .profileTab:
            return 4
        }
    }
    
    static let tabItems: [RootTab] = [.babyTrackerTab, .locationTab, .dashboardTab, .inboxTab, .profileTab]
}

class RootViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = RootTab.tabItems.map {
            let controller = $0.controller
            controller.tabBarItem = RootTabBarItem(tab: $0)
            return controller
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

class RootTabBarItem: UITabBarItem {
    var tab: RootTab
    
    init(tab: RootTab) {
        self.tab = tab
        super.init()
        
        title = tab.title
//        image = tab.icon
//        selectedImage = tab.selected_icon
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
