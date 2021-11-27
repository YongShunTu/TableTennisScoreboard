//
//  ViewController.swift
//  TableTennisScoreboard
//
//  Created by 姜又寧 on 2021/11/25.
//

import UIKit

class ScoreViewController: UIViewController {
    
    @IBOutlet weak var changePlayerSide: UIButton!
    @IBOutlet weak var resetScore: UIButton!
    @IBOutlet weak var rightPlayerScore: UILabel!
    @IBOutlet weak var leftPlayerScore: UILabel!
    
    @IBOutlet weak var leftTeamScore: UILabel!
    @IBOutlet weak var rightTeamScore: UILabel!
    @IBOutlet weak var leftServe: UILabel!
    @IBOutlet weak var rightServe: UILabel!
    
    @IBOutlet weak var peterName: UILabel!
    @IBOutlet weak var hookName: UILabel!
    
    var rightTeam : Int = 0
    var rightPlayer : Int = 0
    var leftTeam : Int = 0
    var leftPlayer : Int = 0
    var numberOfTimes : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        reset()
    }

    @IBAction func resetScore(_ sender: Any) {
        reset()
    }
    
    func reset() {
        self.rightPlayer = 0
        self.leftPlayer = 0
        self.rightTeam = 0
        self.leftTeam = 0
        self.numberOfTimes = 0
        changeServe()
        self.rightPlayerScore.text = String(self.rightPlayer)
        self.leftPlayerScore.text = String(self.leftPlayer)
        self.rightTeamScore.text = String(self.rightTeam)
        self.leftTeamScore.text = String(self.leftTeam)
        self.peterName.text = "Handsome Peter"
        self.hookName.text = "Ugly Hook"
    }
    
    @IBAction func rightPlayerGetScore(_ sender: Any) {
        if self.rightPlayer < 10 {
            self.rightPlayer += 1
            self.rightPlayerScore.text = "\(self.rightPlayer)"
            self.leftServe.text = "\(self.rightPlayer)"
        }else{
            self.rightPlayer = 0
            self.rightPlayerScore.text = "\(self.rightPlayer)"
            self.rightTeamGetScore()
        }
        self.changeServe()
    }
    
    
    @IBAction func leftPlayerGetScore(_ sender: Any) {
        if self.leftPlayer < 10 {
            self.leftPlayer += 1
            self.leftPlayerScore.text = "\(self.leftPlayer)"
        }else{
            self.leftPlayer = 0
            self.leftPlayerScore.text = "\(self.leftPlayer)"
            self.leftTeamGetScore()
        }
        self.changeServe()
    }
    
    
    func rightTeamGetScore() {
        if self.rightTeam < 5 {
            self.rightTeam += 1
            self.rightTeamScore.text = String(self.rightTeam)
        }
    }
    
    func leftTeamGetScore() {
        if self.leftTeam < 5 {
            self.leftTeam += 1
            self.leftTeamScore.text = String(self.leftTeam)
        }
    }
    
    @IBAction func changeSide(_ sender: Any) {
        
        let leftPlayerText = self.leftPlayerScore.text
        let leftPlayerScore = self.leftPlayer
        let rightPlayerText = self.rightPlayerScore.text
        let rightPlayerScore = self.rightPlayer
        let leftTeamText = self.leftTeamScore.text
        let leftTeamScore = self.leftTeam
        let rightTeamText = self.rightTeamScore.text
        let rightTeamScore = self.rightTeam
        let leftServe = self.leftServe.text
        let rightServe = self.rightServe.text
        let peter = self.peterName.text
        let hook = self.hookName.text
        
        self.rightPlayerScore.text = leftPlayerText
        self.leftPlayerScore.text = rightPlayerText
        self.rightTeamScore.text = leftTeamText
        self.leftTeamScore.text = rightTeamText
        self.rightServe.text = leftServe
        self.leftServe.text = rightServe
        self.rightPlayer = leftPlayerScore
        self.leftPlayer = rightPlayerScore
        self.rightTeam = leftTeamScore
        self.leftTeam = rightTeamScore
        self.peterName.text = hook
        self.hookName.text = peter
        self.numberOfTimes += 2
    }
    
    func changeServe() {
        self.numberOfTimes += 1
        let number = self.numberOfTimes
        if (number % 4) == 1 || (number % 4) == 2 {
            self.leftServe.text = "Serve"
            self.rightServe.text = ""
            view?.backgroundColor = .brown
        }else if (number % 4) == 3 || (number % 4) == 0{
            self.leftServe.text = ""
            self.rightServe.text = "Serve"
            view?.backgroundColor = .systemGreen
        }
        print(number % 4)
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    .landscape
    }
        
}

