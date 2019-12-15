//
//  TODOCell.swift
//  SlideMenuAnimation
//
//  Created by Jian Ma on 12/15/19.
//  Copyright © 2019 Jian Ma. All rights reserved.
//

import UIKit

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

class TODOCell: UITableViewCell {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var isFinsihedButton: UIButton!
    var isFinishedImage: UIImage?
    var event: Event?

    func setUpCell(event: Event){
        
        self.titleTextField.text = event.title
        isFinishedImage = event.isFinished ?  #imageLiteral(resourceName: "finishedStar") : #imageLiteral(resourceName: "unfinishedStar")
        self.isFinsihedButton.setImage(isFinishedImage, for: .normal)
    }
    @IBAction func isFinishedButtonTapped(_ sender: UIButton) {
        event?.isFinished.toggle()
    }
    
}
