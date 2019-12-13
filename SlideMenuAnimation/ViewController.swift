//
//  ViewController.swift
//  SlideMenuAnimation
//
//  Created by Jian Ma on 12/9/19.
//  Copyright © 2019 Jian Ma. All rights reserved.
//
//MARK: this project is meant to implement the animation of side menu sliding out like a fountain.
import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var menuButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        toggleMenuViewAppearance()
       
    }
    
    func toggleMenuViewAppearance(){
        
    }
    

    @IBAction func menuButtonTapped(_ sender: UIButton) {
        toggleMenuViewAppearance()
    }
    @IBAction func dismissMenuViewButtonTapped(_ sender: UIButton) {
        toggleMenuViewAppearance()
    }
    
}

