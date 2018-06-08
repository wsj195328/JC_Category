//
//  JCUIKit_Extension.swift
//  JC_Category_Swift
//
//  Created by user on 2018/6/7.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit

// MARK: 系统级别 (System)
public extension UIDevice {
    public class func JC_IsIphonex() -> Bool {
        if UIScreen.main.bounds.height == 812 {
            return true
        }
        return false
    }
}


// MARK: 框架级别 (Cocoa Fundation)
public extension UIAlertController {

    public class func JC_Message(_ mainTitle:String,
                                _ mainMessage:String,
                                sureBlock:(()->Void)?) -> Void {

        let alert = UIAlertController(title: mainTitle,
                                      message: mainMessage,
                                      preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "取消",
                                      style: .cancel,
                                      handler: nil))

        alert.addAction(UIAlertAction(title: "确定",
                                      style: .default,
                                      handler: {(_) in

                                        if let tempBlock = sureBlock {

                                            tempBlock();
                                        }
        }));

        let window:UIWindow? = UIApplication.shared.keyWindow;
        if let tempWindow = window {

            let rootVC:UIViewController? = tempWindow.rootViewController;
            if let tempVC = rootVC {

                tempVC.present(alert, animated: true, completion: nil);
            }
        }
    }
}

public extension UIImage {

    public func JC_DrawRectImage(borderWidth:CGFloat,radius:CGFloat) -> UIImage? {

        let imgH = self.size.width
        let imgW = imgH;
        let imgSize = CGSize.init(width: imgH, height: imgW);

        //开始绘图
        UIGraphicsBeginImageContextWithOptions(imgSize, false, 0.0);
        let rect = CGRect.init(x: 0, y: 0, width: imgW, height: imgH);
        UIColor.clear.setFill();
        UIRectFill(rect);

        let path = UIBezierPath.init(roundedRect: rect, cornerRadius: radius);
        path.addClip();
        self.draw(in: rect);

        let resultImg = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();

        return resultImg;
    }
}

extension UIColor {
    // 16进制 转 RGBA
    class func JC_rgbaColorFromHex(rgb:Int, alpha: CGFloat) ->UIColor {
        return UIColor(red: ((CGFloat)((rgb & 0xFF0000) >> 16)) / 255.0,
                       green: ((CGFloat)((rgb & 0xFF00) >> 8)) / 255.0,
                       blue: ((CGFloat)(rgb & 0xFF)) / 255.0,
                       alpha: alpha)
    }

    //16进制 转 RGB
    class func JC_rgbColorFromHex(rgb:Int) -> UIColor {
        return UIColor(red: ((CGFloat)((rgb & 0xFF0000) >> 16)) / 255.0,
                       green: ((CGFloat)((rgb & 0xFF00) >> 8)) / 255.0,
                       blue: ((CGFloat)(rgb & 0xFF)) / 255.0,
                       alpha: 1.0)
    }
}
