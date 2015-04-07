//
//  ResultView.swift
//  P2L2Roshambo
//
//  Created by Twelker on Apr/7/15.
//  Copyright (c) 2015 Twelker. All rights reserved.
//

import Foundation
import UIKit

class ResultView: UIViewController {
    
    var imageNamePassed: String?
    var gameResultPassed: String?
    
    @IBOutlet var imageGameResult: UIImageView!
    @IBOutlet var labelGameResult: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        
        // The game result will only appear if imageNamePassed and gameResultPassed have been set
        if let imageNamePassed = self.imageNamePassed {
            self.imageGameResult.image = UIImage(named: "\(imageNamePassed)")
            self.labelGameResult.text = gameResultPassed
        } else {
            self.imageGameResult.image = nil
            self.labelGameResult.text = nil
        }
        
        self.imageGameResult.alpha = 0
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        UIView.animateWithDuration(0.3) {
            self.imageGameResult.alpha = 1
        }
    }
    
    /**
    *    dismiss this view controller
    */
    @IBAction func dismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}


