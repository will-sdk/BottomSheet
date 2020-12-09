//
//  Assets.swift
//  WillBottomSheet_Example
//
//  Created by Kowit Nanumchil on 9/12/2563 BE.
//  Copyright © 2563 CocoaPods. All rights reserved.
//

import UIKit.UIImage
import UIKit.UIColor

struct Assets {
    struct Image {
        static let share: Assets.Image = Image()
        let objects: [UIImage]
        private let countableRange: CountableRange<Int> = 0..<12
        var count: Int {
            return countableRange.count
        }
        private init() {
            objects = countableRange.map { String($0) }.flatMap { UIImage(named: $0) }
        }
    }
}
