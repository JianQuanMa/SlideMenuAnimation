//
//  Event.swift
//  SlideMenuAnimation
//
//  Created by Jian Ma on 12/16/19.
//  Copyright © 2019 Jian Ma. All rights reserved.
//

import Foundation

struct Event {
    var title: String
    var isFinished: Bool
    var desp: String
    
    init(title: String, isFinished: Bool, desp: String) {
        self.title = title
        self.isFinished = isFinished
        self.desp = desp
    }
}


