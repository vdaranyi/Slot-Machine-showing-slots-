//
//  ViewController.swift
//  SlotMachine
//
//  Created by Vincent on 06/10/2014.
//  Copyright (c) 2014 VD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Containers
    
    var firstContainer: UIView!
    var secondContainer: UIView!
    var thirdContainer: UIView!
    var fourthContainer: UIView!
    
    
    // Information Labels
    
    var creditsLabel = UILabel()
    var betLabel = UILabel()
    var winnerPaidLabel = UILabel()
    var creditsTitleLabel = UILabel()
    var betTitleLabel = UILabel()
    var winnerPaidTitleLabel = UILabel()
    
    
    // Buttons
    
    var resetButton = UIButton()
    var betOneButton = UIButton()
    var betMaxButton = UIButton()
    var spinButton = UIButton()
    
    
    // First Container
    
    var titleLabel: UILabel!
    
    
    // Slots Array
    
    var slots: [[Slot]] = []
    
    
    // Constants
    
    let kMarginForView:CGFloat = 10
    let kSixth:CGFloat = 1/6
    let kThird:CGFloat = 1/3
    let noOfContainers = 3
    let noOfSlots = 3
    let kFifth: CGFloat = 1/5
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupContainerViews()
        setupFirstContainer(self.firstContainer)
        setupSecondContainer(self.secondContainer)
        setupThirdContainerTop(self.thirdContainer, contLabel: creditsLabel, position: 0)
        setupThirdContainerTop(self.thirdContainer, contLabel: betLabel, position: 1)
        setupThirdContainerTop(self.thirdContainer, contLabel: winnerPaidLabel, position: 2)
        setupThirdContainterBottom(thirdContainer, contLabel: creditsTitleLabel, name: "Credits", position: 0)
        setupThirdContainterBottom(thirdContainer, contLabel: betTitleLabel, name: "Bet", position: 1)
        setupThirdContainterBottom(thirdContainer, contLabel: winnerPaidTitleLabel, name: "Winner Paid", position: 2)
        setupFourthContainer(fourthContainer, button: resetButton, name: "Reset", bcolor: UIColor.lightGrayColor(), position: 0, action: "resetButtonPressed:")
        setupFourthContainer(fourthContainer, button: betOneButton, name: "Bet 1", bcolor: UIColor.greenColor(), position: 1, action: "betOneButtonPressed:")
        setupFourthContainer(fourthContainer, button: betMaxButton, name: "Bet Max", bcolor: UIColor.redColor(), position: 2, action: "betMaxButtonPressed:")
        setupFourthContainer(fourthContainer, button: spinButton, name: "Spin", bcolor: UIColor.greenColor(), position: 3, action: "spinButtonPressed:")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Actions
    
    func resetButtonPressed (button: UIButton) {
        println("All working")
    }
    
    func betOneButtonPressed (button: UIButton) {
        println("Betting One!")
    }
    
    func betMaxButtonPressed (button: UIButton) {
        println("Betting it ALL!")
    }
    
    func spinButtonPressed (button: UIButton) {
        slots = Factory.createSlots()
        setupSecondContainer(secondContainer)
    }
    
    
    func setupContainerViews() {
        self.firstContainer = UIView(frame: CGRectMake(self.view.bounds.origin.x + kMarginForView, 0, self.view.bounds.width - (kMarginForView * 2), self.view.bounds.height * kSixth - 20))
        self.firstContainer.backgroundColor = UIColor.redColor()
        self.view.addSubview(self.firstContainer)
        
        self.secondContainer = UIView(frame: CGRectMake(self.view.bounds.origin.x + kMarginForView, firstContainer.frame.height, self.view.bounds.width - (kMarginForView * 2), self.view.bounds.height * (3 * kSixth)))
        self.secondContainer.backgroundColor = UIColor.blackColor()
        self.view.addSubview(self.secondContainer)
        
        self.thirdContainer = UIView(frame: CGRectMake(self.view.bounds.origin.x + kMarginForView, firstContainer.frame.height + secondContainer.frame.height, firstContainer.frame.width, self.view.bounds.height * kSixth))
        self.thirdContainer.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(self.thirdContainer)
        
        self.fourthContainer = UIView(frame: CGRectMake(self.view.bounds.origin.x + kMarginForView, firstContainer.frame.height + secondContainer.frame.height + thirdContainer.frame.height, firstContainer.frame.width, thirdContainer.frame.height))
        self.fourthContainer.backgroundColor = UIColor.blackColor()
        self.view.addSubview(fourthContainer)
    }
    
    func setupFirstContainer(containerView: UIView) {
        self.titleLabel = UILabel()
        self.titleLabel.text = "Super Slots"
        self.titleLabel.textColor = UIColor.yellowColor()
        self.titleLabel.font = UIFont(name: "Menlo", size: 30)
        self.titleLabel.sizeToFit()
        self.titleLabel.center = containerView.center
        containerView.addSubview(self.titleLabel)
    }
    
    func setupSecondContainer(containerView: UIView) {
        for var containerNo = 0; containerNo < noOfContainers; containerNo++ {
            for var slotNo = 0; slotNo < noOfSlots; slotNo++ {
                var slot: Slot
                var container = UIImageView()
                if slots.count != 0 {
                    let slotContainer = slots[containerNo]
                    slot = slotContainer[slotNo]
                    container.image = slot.image
                }
                else {
                    container.image = UIImage(named: "Ace")
                    println("SETUP")
                }
            
                container.frame = CGRectMake(
                    containerView.bounds.width / CGFloat(noOfContainers) * CGFloat(containerNo),
                    containerView.bounds.height / CGFloat(noOfSlots) * CGFloat(slotNo),
                    containerView.bounds.width / CGFloat(noOfContainers) - 2,
                    containerView.bounds.height / CGFloat(noOfSlots) - 2)
                containerView.addSubview(container)
                
                // println("containerNo: \(containerNo), slotNo: \(slotNo), x: \(containerView.bounds.origin.x + containerView.bounds.size.width / CGFloat(noOfContainers) * CGFloat(containerNo))")
                
            }
        }
    }
    
    
    func setupThirdContainerTop(containerView: UIView, contLabel: UILabel, position: Int) {
        contLabel.text = "000000"
        contLabel.font = UIFont(name: "Menlo-Bold", size: 16)
        contLabel.sizeToFit()
        contLabel.center = CGPointMake(containerView.frame.width * kSixth * CGFloat((position * 2 + 1)), containerView.frame.height * kThird)
        contLabel.textColor = UIColor.redColor()
        contLabel.backgroundColor = UIColor.darkGrayColor()
        contLabel.textAlignment = NSTextAlignment.Center
        containerView.addSubview(contLabel)
        println("\(containerView.frame.width * kSixth * CGFloat((position * 2 + 1)))")
    }
    
    func setupThirdContainterBottom(containerView: UIView, contLabel: UILabel, name: String, position: Int) {
        contLabel.text = name
        contLabel.font = UIFont(name: "AmericanTypeWriter", size: 14)
        contLabel.sizeToFit()
        contLabel.center = CGPointMake(containerView.frame.width * kSixth * CGFloat(position * 2 + 1), containerView.frame.height * kThird * 2)
        contLabel.textColor = UIColor.blackColor()
        containerView.addSubview(contLabel)
    }
    
    func setupFourthContainer(containerView: UIView, button: UIButton, name: String, bcolor: UIColor, position: Int, action: Selector) {
        button.setTitle(name, forState: UIControlState.Normal)
        button.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        button.backgroundColor = bcolor
        button.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)
        button.sizeToFit()
        button.center = CGPointMake(containerView.frame.width * kFifth * CGFloat(position + 1 ), containerView.frame.height * 0.5)
        button.addTarget(self, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(button)
    
    }
    
    
}













































