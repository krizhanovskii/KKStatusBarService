# KKStatusBarService


[![Version](https://img.shields.io/cocoapods/v/KKStatusBarService.svg?style=flat)](http://cocoapods.org/pods/KKStatusBarService)
[![License](https://img.shields.io/cocoapods/l/KKStatusBarService.svg?style=flat)](http://cocoapods.org/pods/KKStatusBarService)
[![Platform](https://img.shields.io/cocoapods/p/KKStatusBarService.svg?style=flat)](http://cocoapods.org/pods/KKStatusBarService)

[![https://gyazo.com/63eca5c213b6cff5ab9f7005a77c7a42](https://i.gyazo.com/63eca5c213b6cff5ab9f7005a77c7a42.gif)](https://gyazo.com/63eca5c213b6cff5ab9f7005a77c7a42)
[![https://gyazo.com/eebd1fba4704dbd50ec1148498eb90aa](https://i.gyazo.com/eebd1fba4704dbd50ec1148498eb90aa.gif)](https://gyazo.com/eebd1fba4704dbd50ec1148498eb90aa)

## Description
KKStatusBarService - it's simple,small and beatiful view for notification user about events that you want. 
Main idea for use - check internet connection status, and when connection down - show message view for user.

KKStatusBarService - fully customizable, so you can use it with any message and color.

## Example
To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
* ios: 9+. 
* xcode: 8
* swift 3

## Installation
KKStatusBarService is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'KKStatusBarService'
```

## Usage
At start you must to import library where want use it.
```swift
import KKStatusBarService
```

Then you can start monitor the Internet connection:
```swift
    KKStatusBarService.startMonitoring()
```
and when internet connection down - you will see the `message view` on the top of screen, under `status bar`. For finish monitoring call:
```swift
    KKStatusBarService.stopMonitoring()
```

for check is `service running` - use:
```swift
    public static var isServiceRunning
```

for change `default checking time` - use:
```swift
    public static var kTimeToCheck : Double //min value is 3.0
```

As `example` , use in `AppDelegate`:

```swift
func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    if KKStatusBarService.isServiceRunning == false {
        KKStatusBarService.startMonitoring()
    }
    return true
}

func applicationDidEnterBackground(application: UIApplication) {
    KKStatusBarService.stopMonitoring()
}

func applicationDidBecomeActive(application: UIApplication) {
    KKStatusBarService.startMonitoring()
}
```

Another way to use it show for user some info about some event or other:

```swift
    KKStatusBarService.forceShow() // show view with error message
```

and then for hide this or `press 'x' button in the right` or use `one` from:
```swift
    KKStatusBarService.forceHide()  // hide view with error message
    KKStatusBarService.forceConnected() //change error message end view on connected message end view and then hide
```
As default it use `red` and `green` color for view and `text` for `internet status changed`. 

You can change `backgroundColor` `textColor` and `text` for view. Use:

```swift
public static var errorMessage : String?
public static var errorBackgroundColor : UIColor?
public static var errorTextColor : UIColor?
public static var connectedMessage : String?
public static var connectedColor : UIColor?
public static var connectedTextColor : UIColor?
```



## Author
k.krizhanovskii, k.krizhanovskii@gmail.com

## License
KKStatusBarService is available under the MIT license. 

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
