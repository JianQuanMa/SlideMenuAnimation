//
//  TODOCell.swift
//  SlideMenuAnimation
//
//  Created by Jian Ma on 12/15/19.
//  Copyright © 2019 Jian Ma. All rights reserved.
//

import UIKit

class TODOCell: UITableViewCell {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var isFinsihedButton: UIButton!
   
    var isFinishedImage: UIImage?
    var event: Event! { 
        didSet{
            self.titleTextField.text = self.event?.title
            self.isFinishedImage = self.event.isFinished ?  #imageLiteral(resourceName: "finishedStar") : #imageLiteral(resourceName: "unfinishedStar")
            print(self.event.isFinished)
            DispatchQueue.main.async {
                 self.isFinsihedButton.setImage(self.isFinishedImage, for: .normal)
            }
        }
    }
    static var identifier = "TODOCell"
    func setUpCell(event: Event){
        self.event = event
//        self.titleTextField.text = event.title
//        isFinishedImage = event.isFinished ?  #imageLiteral(resourceName: "finishedStar") : #imageLiteral(resourceName: "unfinishedStar")
//        self.isFinsihedButton.setImage(isFinishedImage, for: .normal)
    }
    @IBAction func isFinishedButtonTapped(_ sender: UIButton) {
        event?.isFinished.toggle()
    }
}
