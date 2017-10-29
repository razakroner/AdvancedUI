//
//  BaseSplitView.swift
//  AdvancedUI
//
//  Created by Razalon on 29/10/2017.
//  Copyright © 2017 wojgas. All rights reserved.
//

import Foundation
import UIKit

class BaseSplitView: UISplitViewController, UISplitViewControllerDelegate {
    
    override func viewDidLoad() {
        self.delegate = self
        self.preferredDisplayMode = .allVisible
    }
    
    func splitViewController(
        _ splitViewController: UISplitViewController,
        collapseSecondary secondaryViewController: UIViewController,
        onto primaryViewController: UIViewController) -> Bool {
        // Return true to prevent UIKit from applying its default behavior
        return true
    }
}

