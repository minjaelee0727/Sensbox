//
//  Constants.swift
//  Sensbox
//
//  Created by Min Jae Lee on 2021-10-02.
//

import Foundation
import UIKit

// MARK: SIZE
public var screenWidth: CGFloat {
    return UIScreen.main.bounds.width
}

public var screenHeight: CGFloat {
    return UIScreen.main.bounds.height
}

// MARK: COLOR
let remoconColor: UIColor = UIColor(hexString: "#0833af")
let sensorColor: UIColor = UIColor(hexString: "#3b65f7")

// MARK: CONSTANTS
enum AppStorageData {
    static let DID_LAUNCH_BEFORE = "didLaunchBefore"
}
