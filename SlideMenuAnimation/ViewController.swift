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
    @IBOutlet weak var dismissMenuViewButton: UIButton!
    @IBOutlet weak var menuViewCurveImageView: UIImageView!
    @IBOutlet weak var menuViewButton1: UIButton!
    @IBOutlet weak var menuViewButton2: UIButton!
    @IBOutlet weak var menuViewButton3: UIButton!
    @IBOutlet weak var menuViewButton4: UIButton!
    @IBOutlet weak var menuViewButton5: UIButton!
    @IBOutlet weak var menuViewButton6: UIButton!
    @IBOutlet weak var menuViewButton7: UIButton!
    private var menuViewButtonList: [UIButton]?
    @IBOutlet weak var menuView: UIView!
    
    override func viewDidLoad() {
        menuViewButtonList = [menuViewButton1, menuViewButton2, menuViewButton3, menuViewButton4, menuViewButton5, menuViewButton6, menuViewButton7]
        super.viewDidLoad()
        
        toggleMenuViewAppearance()
        
    }
    //MARK: helper funcs
    private func toggleMenuViewAppearance(){
        //MARK: if the menu view is hidden, show the buttons with animation and show the menu view
        if menuView.isHidden{
            menuView.isHidden = false
            UIView.animate(withDuration: 0.7, animations: {
                self.dismissMenuViewButton.alpha = 1
            })
            animateShowComponents(components: [self.menuViewCurveImageView], duration: 0.5, delay: 0.1)
            animateShowComponents(components: [self.menuViewButton4], duration: 0.4, delay: 0)
            animateShowComponents(components: [self.menuViewButton3, self.menuViewButton5], duration: 0.4, delay: 0.1)
            animateShowComponents(components: [self.menuViewButton2, self.menuViewButton6], duration: 0.4, delay: 0.2)
            animateShowComponents(components: [self.menuViewButton1, self.menuViewButton7], duration: 0.4, delay: 0.3)
        }else{//if the menu view is not hidden, hide it and perform animation to hide the buttons
            UIView.animate(withDuration: 0.7, animations: {
                self.dismissMenuViewButton.alpha = 0
            })
            animateHideComponents(components: [self.menuViewButton1, self.menuViewButton7], duration: 0.4, delay: 0)
            animateHideComponents(components: [self.menuViewButton2, self.menuViewButton6], duration: 0.4, delay: 0.1)
            animateHideComponents(components: [self.menuViewButton3, self.menuViewButton5], duration: 0.4, delay: 0.2)
            animateHideComponents(components: [self.menuViewCurveImageView], duration: 0.5, delay: 0.1)
            UIView.animate(withDuration: 0.4, delay: 0.3, options: [.curveEaseOut, .allowUserInteraction], animations: {
                self.menuViewButton4.transform = CGAffineTransform(translationX: -self.menuView.frame.width, y: 0)
            }) { success in
                self.menuView.isHidden = true
            }
        }
    }
    
    private func animateShowComponents(components: [UIView], duration: TimeInterval, delay: TimeInterval){
        UIView.animate(withDuration: duration, delay: delay,options: [.allowUserInteraction, .curveEaseOut], animations: {
            components.forEach{
                $0.transform = .identity
            }
        })
    }
    
    private func animateHideComponents(components: [UIView], duration: TimeInterval, delay: TimeInterval){
        UIView.animate(withDuration: duration, delay: delay, options: [.curveEaseOut, .allowUserInteraction], animations: {
            components.forEach{
                $0.transform = CGAffineTransform(translationX: -self.menuView.frame.width, y: 0)
            }
        })
    }
    
    
    @IBAction func menuButtonTapped(_ sender: UIButton) {
        toggleMenuViewAppearance()
    }
    @IBAction func dismissMenuViewButtonTapped(_ sender: UIButton) {
        toggleMenuViewAppearance()
    }
    
}

