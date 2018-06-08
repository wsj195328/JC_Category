//
//  JCFundation_Extension.swift
//  JC_Category_Swift
//
//  Created by user on 2018/6/7.
//  Copyright © 2018 user. All rights reserved.
//

import Foundation
import UIKit

// MARK: 系统级别 (System)
extension NSDate {

    class func JC_DateString(allSeconds:Int) -> String {

        var hours   = 0;
        var minutes = 0;
        var seconds = 0;
        var hourText = "";
        var minuteText = "";
        var secondText = "";

        hours = allSeconds / 3600;
        hourText = hours > 9 ? "\(hours)" : "0\(hours)";

        minutes = allSeconds % 3600 / 60;
        minuteText = minutes > 9 ? "\(minutes)" : "0\(minutes)";

        seconds = allSeconds % 3600 % 60;
        secondText = seconds > 9 ? "\(seconds)" : "0\(seconds)";

        return "\(hourText):\(minuteText):\(secondText)";

    }
}


// MARK: 框架级别 (Cocoa Fundation)
public extension Notification {
    public class JCApp {
        public static let Noti_Name = Notification.Name("xxxxxxxx")

        /* ***** <其他通知> ***** */

    }
}

public extension NSURL {
    public class func ssOpenSetting(_ settingURL:String?,
                                    failBlock:((_ isFail:Bool)->Void)?) ->Void {

        let url:NSURL? = NSURL(string: settingURL!);
        if let rightURL = url {

            if UIApplication.shared.canOpenURL(rightURL as URL){

                UIApplication.shared.openURL(rightURL as URL);

            }else{

                if let block = failBlock {

                    block(false);
                }
            }

        }else{

            print("can not find url");
        }
    }
}



