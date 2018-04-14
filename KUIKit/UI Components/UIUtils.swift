// Copyright © 2017 Kalpesh Talkar. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
//  For support: https://gist.github.com/KalpeshTalkar/66a5141138931b9358a562a0fb8420ac
//

import UIKit

public struct DefaultCardStyle {
    public static let CardCornerRadius  = CGFloat(3)
    public static let CardBorderWidth   = CGFloat(0.5)
    public static let CardShadowRadius  = CGFloat(3)
    public static let CardShadowOpacity = Float(0.5)
    public static let CardShadowOffset  = CGSize(width: 0, height: 0)
    public static let CardShadowColor   = UIColor.gray.cgColor
    public static let CardBorderColor   = UIColor.lightGray.withAlphaComponent(0.6).cgColor
}

public struct Device {
    public static let Current  = UIDevice.current
    public static let isiPad   = Device.Current.userInterfaceIdiom == .pad
    public static let isiPhone = Device.Current.userInterfaceIdiom == .phone
}

public struct Orientation {
    public static let orientation          = Device.Current.orientation
    public static let isLandscapeLeft      = Orientation.orientation == .landscapeLeft
    public static let isLandscapeRight     = Orientation.orientation == .landscapeRight
    public static let isLandscape          = Orientation.orientation == .landscapeLeft || Device.Current.orientation == .landscapeRight
    public static let isPortrait           = Orientation.orientation == .portrait
    public static let isPortraitUpsideDown = Orientation.orientation == .portraitUpsideDown
    public static let isFaceUp             = Orientation.orientation == .faceUp
    public static let isFaceDown           = Orientation.orientation == .faceDown
}

public struct Screen {
    public static let Main         = UIScreen.main
    public static let ScreenSize   = Screen.Main.bounds
    public static let ScreenWidth  = Screen.ScreenSize.width
    public static let ScreenHeight = Screen.ScreenSize.height
    public static let ScreenScale  = Screen.Main.scale
}

public extension UIView {

    public func clipWithCornerRadius(radius: CGFloat) {
        layer.cornerRadius = radius
        clipsToBounds = true
    }

    public func applyCardDesign() {
        clipsToBounds       = false
        layer.masksToBounds = false
        layer.borderWidth   = DefaultCardStyle.CardBorderWidth
        layer.borderColor   = DefaultCardStyle.CardBorderColor
        layer.cornerRadius  = DefaultCardStyle.CardCornerRadius
        layer.shadowRadius  = DefaultCardStyle.CardShadowRadius
        layer.shadowOffset  = DefaultCardStyle.CardShadowOffset
        layer.shadowOpacity = DefaultCardStyle.CardShadowOpacity
        layer.shadowColor   = DefaultCardStyle.CardShadowColor
    }

    public func addBorder(width: CGFloat, color: UIColor) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }

}
