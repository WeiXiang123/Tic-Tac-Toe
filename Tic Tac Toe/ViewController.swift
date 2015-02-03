//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by WeiXiang on 15/2/3.
//  Copyright (c) 2015年 WeiXiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var goNumber = 1
    var winner = 0
    // 0 = empty 1 = nought 2 = cross
    var gameState = [0,0,0,0,0,0,0,0,0]
    let winningConditions = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[0,3,6],[1,4,7],[2,5,8],[2,4,6]]

    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var playAgain: UIButton!

    @IBAction func buttonPressed(sender: UIButton) {

        if gameState[sender.tag] == 0 {
            var image = UIImage()

            if goNumber % 2 == 0 {
                image = UIImage(named: "cross.png")!
                gameState[sender.tag] = 2
            }else {
                image = UIImage(named: "nought.png")!
                gameState[sender.tag] = 1
            }

            for conbimation in winningConditions {
                if gameState[conbimation[0]] == gameState[conbimation[1]] && gameState[conbimation[0]] == gameState[conbimation[2]] && gameState[conbimation[0]] != 0 && gameState[conbimation[1]] != 0 {
                    winner = gameState[conbimation[0]]
                }
            }

            if winner != 0 {

                if winner == 1 {
                    winnerLabel.text = "Nought win!"
                }else {
                    winnerLabel.text = "Cross win!"
                }

                UIView.animateWithDuration(1, animations: { () -> Void in
                    self.winnerLabel.alpha = 1

                    self.playAgain.alpha = 1
                })
            }

            goNumber++

            sender.setImage(image, forState: UIControlState.Normal)
        }


    }

    @IBAction func playAgainButton(sender: UIButton) {
        gameState = [0,0,0,0,0,0,0,0,0]
        winner = 0
        goNumber = 1

        winnerLabel.alpha = 0
        playAgain.alpha = 0

        for var i = 0; i < 9; ++i {
            var button = view.viewWithTag(i) as UIButton
            button.setImage(nil, forState: UIControlState.Normal)
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        winnerLabel.alpha = 0
        playAgain.alpha = 0
    }


}

