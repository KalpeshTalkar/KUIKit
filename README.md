# KUIKit
iOS framework that provides customisable UI components via UIStoryboard.
The framework includes following UI components:

## Supports iOS 10 +

## Cocoapods
Add the following to your target in your project's pod file
<br>
```pod 'FSCalendar'```

## UI Components:

- [x] KView
- [x] KButton
- [x] KTextField
- [x] KProgressbar
- [x] KCircularProgressbar

Apart from the above UI components, KUIKit offers some UI utility functions and structures.

# Screenshots

![KUIKit: Screenshot](https://github.com/KalpeshTalkar/KUIKit/blob/master/Screenshots/KUIKit_SS_2.png)
![KUIKit: Screenshot](https://github.com/KalpeshTalkar/KUIKit/blob/master/Screenshots/KUIKit_SS_1.png)
![KUIKit: GIF](https://github.com/KalpeshTalkar/KUIKit/blob/master/Screenshots/KUIKit_ScreenRecord.gif)

# Usage

**KView**
```
let kView = KView()
kView.borderColor = UIColor.orange
kView.borderWidth = 1
kView.cornerRadius = 3
// For gradient
kView.startColor = UIColor.yellow
kView.endColor = UIColor.orange
kView.verticalGradient = false // To render gradient horizontally.
view.addSubView(kView)
```

**KButton**
```
let kButton = KButton()
kButton.onClick = {
    // Adding click listener is so simple for KButton.
}
kButton.cornerRadius = 3
kButton.borderWidth = 1
kButton.borderColor = UIColor.orange
// For gradient
kButton.startColor = UIColor.yellow
kButton.endColor = UIColor.orange
kButton.verticalGradient = true // gradient is rendered vertically. Default is vertical.
view.addSubView(kButton)
```

**KTextField**
```
let kTextField = KTextField()
// You can have borders and corner radius
kTextField.borderColor = UIColor.orange
kTextField.borderWidth = 1
kTextField.cornerRadius = 3
// Or you can have underline at the bottom
kTextField.underLineWidth = 2
kTextField.underLineColor = UIColor.gray
kTextField.underLineColorWhenFocused = UIColor.red
view.addSubview(kTextField)
```

**KProgressbar**
```
let kProgressbar = KProgressbar()
kProgressbar.backgroundColor = UIColor.gray
kProgressbar.progressColor = UIColor.red
// Set progress without animation. (max progress is 100)
kProgressbar.progress = 20
// Or use animation to set progress.
kProgressbar.setProgress(value: 20, animated: true, animationDuration: 0.5) { (completed) in
    // Yay! you get a callback after the animation. Do some stuff here..
}
view.addSubview(kProgressbar)
```

**KCircularProgressbar**
```
let kCircularProgressbar = KCircularProgressbar(frame: CGRect(x: 16, y: 100, width: 100, height: 100))
kCircularProgressbar.lineWidth = 2 // Thickness if the progressbar.
kCircularProgressbar.placeHolderTint = UIColor.gray // default bachground color.
kCircularProgressbar.progressTint = UIColor.red // Color for the progress.
kCircularProgressbar.progressLabelTint = UIColor.red // Color of the progress indicator label.
kCircularProgressbar.showsLabel = true // To show progress indicator label.
kCircularProgressbar.progress = 0.3 // Set progress in float value from 0 to 1
// Or you can set progress with animation.
kCircularProgressbar.setProgress(progress: 0.4, animated: true, animationDuration: 0.5) { (completed) -> (Void) in
    // Yay! you get a callback after the animation. Do some stuff here..
}
view.addSubview(kCircularProgressbar)
```

# Other features
**Orientation**
<br>
KUIKit offers Orientation structure which is following features:
```
// Get current orientation
let currentOrientation = Orientation.orientation
// Do somethig with your currentOrientation...

// Check if the orientation is portrait or landscape.
// You don't need to get the currentOrientation and perform switch case of if-else check.
// Orientation structure does that for you.
if Orientation.isPortrait {
    // Your code here...
}
if Orientation.isPortraitUpsideDown {
    // Your code here...
}
if Orientation.isLandscape {
    // Your code here...
}
if Orientation.isLandscapeLeft {
    // Your code here...
}
if Orientation.isLandscapeRight {
    // Your code here...
}
if Orientation.isFaceUp {
    // Your code here...
}
if Orientation.isFaceDown {
    // Your code here...
}
```

**Device**
<br>
KUIKit also offers the Device structure that tells you whether the device is iPad or iPhone.
```
// Get current device
let device = Device.Current

// Check if the device is iPad or iPhone
if Device.isiPad {
    // It's an iPad
}
if Device.isiPhone {
    // It's an iPhone
}
```

**Screen**
<br>
KUIKit also offers Screen structure which helps you get information about device's main screen.
```
// Get main screen
let screen = Screen.Main

// Other properties
let scale = Screen.ScreenScale
let size = Screen.ScreenSize
let height = Screen.ScreenHeight
let width = Screen.ScreenWidth
```

**UIView Extension**
No worries even if your UIComponent or your view is not from KUIKit. You can still customise it.
<br>
KUIKit has few extensions for UIView.
<br>
```
// If your view is not the sub class of KView,
// you can stil be able to customise it programmatically using KUIKit
let myView = UIView()
// Add corner radius with KUIKit
myView.clipWithCornerRadius(radius: 5)
// Add border of your preferred width and color using KUIKit
myView.addBorder(width: 1, color: UIColor.red)
// Apply card design to your view using KUIKit
myView.applyCardDesign()
view.addSubview(myView)

// applyCardDesign() uses the constants from the DefaultCardStyle structure.
// DefaultCardStyle has following properties.
DefaultCardStyle.CardBorderColor
DefaultCardStyle.CardBorderWidth
DefaultCardStyle.CardCornerRadius
DefaultCardStyle.CardShadowColor
DefaultCardStyle.CardShadowOffset
DefaultCardStyle.CardShadowOpacity
DefaultCardStyle.CardShadowRadius
```

# Contact

Kalpesh Talkar
<br>
Facebook: [kalpesh.talkar](https://www.facebook.com/kalpesh.talkar)
<br>
Twitter: [@KalpeshTalkar](https://twitter.com/kalpeshtalkar)
<br>
Email: kalpeshtalkar@gmail.com


# License

KUIKit is available under MIT license. See the [LICENSE](https://github.com/KalpeshTalkar/KUIKit/blob/master/LICENSE.md) file for more info.
