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
    
    //MARK: outlets
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var dismissMenuViewButton: UIButton!
    @IBOutlet weak var menuViewButton1: UIButton!
    @IBOutlet weak var menuViewButton2: UIButton!
    @IBOutlet weak var menuViewButton3: UIButton!
    @IBOutlet weak var menuViewButton4: UIButton!
    @IBOutlet weak var menuViewButton5: UIButton!
    @IBOutlet weak var menuViewButton6: UIButton!
    @IBOutlet weak var menuViewButton7: UIButton!
    private var menuViewButtonList: [UIButton]?
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var menuViewCurveImageView: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var eventDescriptionTextView: UITextView!
    //MARK: variables
    private let daysInWeek = [""]
    let event = Event(title: "buy food", isFinished: true, desp: "buy some oil and beef")
    var events: [Event] = []
    override func viewDidLoad() {
        menuViewButtonList = [menuViewButton1, menuViewButton2, menuViewButton3, menuViewButton4, menuViewButton5, menuViewButton6, menuViewButton7]
        events = [event]
        super.viewDidLoad()
        setUpTableView()
        setUpTableViewCells()
        menuViewCurveImageView.image = #imageLiteral(resourceName: "MenuCurve")
        toggleMenuViewAppearance()
        
    }
    //MARK: helper funcs
    private func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
    }
    private func setUpTableViewCells(){
        tableView.register(UINib(nibName: TODOCell.identifier, bundle: .main), forCellReuseIdentifier: TODOCell.identifier)
       // tableView.register(TODOCell.self, forCellReuseIdentifier: TODOCell.identifier)
    }
    
    private func toggleMenuViewAppearance(){
        //MARK: if the menu view is hidden, show the buttons with animation and show the menu view
        if menuView.isHidden{
            menuView.isHidden = false
            UIView.animate(withDuration: 0.7, animations: {
                self.dismissMenuViewButton.alpha = 0.5
            })
            animateShowComponents(components: [self.menuViewCurveImageView], duration: 0.5, delay: 0.05)
            animateShowComponents(components: [self.menuViewButton4], duration: 0.4, delay: 0)
            animateShowComponents(components: [self.menuViewButton3, self.menuViewButton5], duration: 0.4, delay: 0.05)
            animateShowComponents(components: [self.menuViewButton2, self.menuViewButton6], duration: 0.4, delay: 0.1)
            animateShowComponents(components: [self.menuViewButton1, self.menuViewButton7], duration: 0.4, delay: 0.15)
        }else{//if the menu view is not hidden, hide it and perform animation to hide the buttons
            UIView.animate(withDuration: 0.7, animations: {
                self.dismissMenuViewButton.alpha = 0
            })
            animateHideComponents(components: [self.menuViewButton1, self.menuViewButton7], duration: 0.4, delay: 0)
            animateHideComponents(components: [self.menuViewButton2, self.menuViewButton6], duration: 0.4, delay: 0.05)
            animateHideComponents(components: [self.menuViewButton3, self.menuViewButton5], duration: 0.4, delay: 0.1)
            UIView.animate(withDuration: 0.4, delay: 0.05, options: [.curveEaseOut, .allowUserInteraction], animations: {
                self.menuViewCurveImageView.transform = CGAffineTransform(translationX: -self.menuViewCurveImageView.frame.width, y: 0)
            })
            UIView.animate(withDuration: 0.4, delay: 0.15, options: [.curveEaseOut, .allowUserInteraction], animations: {
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

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: TODOCell.identifier, index) as! TODOCell
        let cell = tableView.dequeueReusableCell(withIdentifier: TODOCell.identifier, for: indexPath) as! TODOCell
        cell.backgroundView?.backgroundColor = #colorLiteral(red: 0.9612876773, green: 1, blue: 0.679187417, alpha: 1) 
        cell.event = self.event
        self.titleTextField.text = self.event.title
        self.eventDescriptionTextView.text = self.event.desp
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    
}
