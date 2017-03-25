# CookieManager

Manage cookies of UIWebView.

![Demo](./screenshot.png)

## Features

* Show all cookies
* Delete specific cookie

## Installation

First, add the following line to your [Podfile](http://guides.cocoapods.org/using/using-cocoapods.html):

```
pod 'CookieManager'
```

Second, install `CookieManager` into your project:

```
pod install
```

## Usage

```swift
import CookieManager
```

```swift
let viewController = CookiesViewController()
let naviController = UINavigationController(rootViewController: viewController)
self.present(naviController, animated: true, completion: nil)
```

## Requirements

Swift 3.0 / iOS 8.0+

## Creator

[Kosuke Ogawa](http://www.twitter.com/koogawa)

## License

The MIT License. See License.txt for details.
