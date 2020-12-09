# WillBottomSheet

[![CI Status](https://img.shields.io/travis/willshërë/WillBottomSheet.svg?style=flat)](https://travis-ci.org/willshërë/WillBottomSheet)
[![Version](https://img.shields.io/cocoapods/v/WillBottomSheet.svg?style=flat)](https://cocoapods.org/pods/WillBottomSheet)
[![License](https://img.shields.io/cocoapods/l/WillBottomSheet.svg?style=flat)](https://cocoapods.org/pods/WillBottomSheet)
[![Platform](https://img.shields.io/cocoapods/p/WillBottomSheet.svg?style=flat)](https://cocoapods.org/pods/WillBottomSheet)

## Demo
<img src="https://github.com/willy-sdk/BottomSheet/blob/main/Assets/bottomsheet-view.gif" width="320" >
<img src="https://github.com/willy-sdk/BottomSheet/blob/main/Assets/bottomsheet-tableview.gif" width="320" >
<img src="https://github.com/willy-sdk/BottomSheet/blob/main/Assets/bottomsheet-collectview.gif" width="320" >


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

```Swift
let controller = Bottomsheet.Controller()

// Adds View
let view = UIView
controller.addContentsView(view)

// Adds CollectionView
controller.addCollectionView { [weak self] collectionView in
    // collectionView
}

// Adds TableView
controller.addTableView { [weak self] tableView in
    // tableView
}

// customize
controller.overlayBackgroundColor = UIColor(red: 255, green: 0, blue: 0, alpha: 0.3)
controller.viewActionType = .tappedDismiss
controller.initializeHeight = 200
```

## Installation

WillBottomSheet is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'WillBottomSheet'
```

## Author

willshërë, kowit.nan@truedigital.com

## License

WillBottomSheet is available under the MIT license. See the LICENSE file for more info.
