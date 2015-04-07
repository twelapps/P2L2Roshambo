//
//  ViewController.swift
//  P2L2Roshambo
//
//  Created by Twelker on Apr/7/15.
//  Copyright (c) 2015 Twelker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //***********************
    // Define class constants
    //***********************
    struct MyClassConstants{
        static let paperValue          = 1
        static let rockValue           = 2
        static let scissorsValue       = 3
        static let paperCoversRock     = "PaperCoversRock"
        static let scissorsCutPaper    = "ScissorsCutPaper"
        static let rockCrushesScissors = "RockCrushesScissors"
        static let itsATie             = "ItsATie"
    }
    
    //**********************************************************************************
    // This function simulates computer generated inut for the Roshambo game.
    // It randomly generates an Integer value from 1 to 3 as defined in MyClassConstants
    //**********************************************************************************
    func randomComputerValue() -> Int {
        // Generate a random Int32 using arc4Random
        let randomValue = 1 + arc4random() % 3
        
        // Return a more convenient Int, initialized with the random value
        return Int(randomValue)
    }
    
    //**********************************************************************************************
    // Determine field values to be set for ResultView, depending on the user and computer input
    //**********************************************************************************************
    func determineResultViewInput(userInput: Int, computerInput: Int) -> (String, String) {
        
        // Output variables
        var imageName: String!
        var gameResult: String!

        switch (userInput, computerInput) {
        case (MyClassConstants.paperValue, MyClassConstants.rockValue):
            imageName = MyClassConstants.paperCoversRock
            gameResult = "Paper covers rock, you won!"
        case (MyClassConstants.paperValue, MyClassConstants.scissorsValue):
            imageName = MyClassConstants.scissorsCutPaper
            gameResult = "Scissors cut paper, computer won!"
        case (MyClassConstants.rockValue, MyClassConstants.paperValue):
            imageName = MyClassConstants.paperCoversRock
            gameResult = "Paper covers rock, computer won!"
        case (MyClassConstants.rockValue, MyClassConstants.scissorsValue):
            imageName = MyClassConstants.rockCrushesScissors
            gameResult = "Rock crushes scissors, you won!"
        case (MyClassConstants.scissorsValue, MyClassConstants.paperValue):
            imageName = MyClassConstants.scissorsCutPaper
            gameResult = "Scissors cut paper, you won!"
        case (MyClassConstants.scissorsValue, MyClassConstants.rockValue):
            imageName = MyClassConstants.rockCrushesScissors
            gameResult = "Rock crushes scissors, computer won!"
        default:
            imageName = MyClassConstants.itsATie
            gameResult = "It is a tie! No one won this game."
        }
        
        return (String, String) (imageName, gameResult)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "paperSegue" {
            
            let controller = segue.destinationViewController as ResultView
            
            // Ok, we now have the user input, let's now generate the computer's input
            let i = randomComputerValue()
            
            //**************************************************************************************
            // Define ResultView, pass image name & game result to be displayed and display the view
            //**************************************************************************************
            controller.imageNamePassed = determineResultViewInput(MyClassConstants.paperValue, computerInput: i).0
            controller.gameResultPassed = determineResultViewInput(MyClassConstants.paperValue, computerInput: i).1
            
        }
        
        if segue.identifier == "scissorsSegue" {
            
            let controller = segue.destinationViewController as ResultView
            
            // Ok, we now have the user input, let's now generate the computer's input
            let i = randomComputerValue()
            
            //**************************************************************************************
            // Define ResultView, pass image name & game result to be displayed and display the view
            //**************************************************************************************
            controller.imageNamePassed = determineResultViewInput(MyClassConstants.scissorsValue, computerInput: i).0
            controller.gameResultPassed = determineResultViewInput(MyClassConstants.scissorsValue, computerInput: i).1
            
        }
    }


    @IBAction func paper(sender: UIButton) { // Based on "perform Segue by identifier" invocation of ResultView
        
        performSegueWithIdentifier("paperSegue", sender: self)
        
    }
    
    @IBAction func scissors() { // Based on "automatically triggered segue" invocation of ResultView
        
    }
    
    @IBAction func rock() { // Based on coded invocation of ResultView
        
        // Ok, we now have the user input, let's now generate the computer's input
        let i = randomComputerValue()
        
        //       println(i)
        
        //**************************************************************************************
        // Define ResultView, pass image name & game result to be displayed and display the view
        //**************************************************************************************
        var controller: ResultView
        
        controller = self.storyboard?.instantiateViewControllerWithIdentifier("ResultView") as ResultView
        
        controller.imageNamePassed  = determineResultViewInput(MyClassConstants.rockValue, computerInput: i).0
        controller.gameResultPassed = determineResultViewInput(MyClassConstants.rockValue, computerInput: i).1
        
        presentViewController(controller, animated: true, completion: nil)

        
    }
        
}

