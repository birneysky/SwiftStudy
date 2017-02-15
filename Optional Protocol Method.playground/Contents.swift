//: Playground - noun: a place where people can play

import UIKit

/**
 可选协议方法
 */


///回合制的游戏
protocol TurnBasedGame{
    var turn: Int {get set}
    func play()
}

@objc protocol TurnBasedGameDelegate{
    func gameStart()
    func gameMove()
    func gameEnd()
    
    @objc optional func turnStart()
    @objc optional func turnEnd()
    
    func gameOver() -> Bool
}


///单人玩的回合制游戏
class SinglePlayerTurnBaseGame:NSObject, TurnBasedGame{
    var turn: Int = 0
    
    var delegate: TurnBasedGameDelegate!
    
    func play() {
        delegate.gameStart()
        while !delegate.gameOver() {
            ///解包
            if let turnStart = delegate.turnStart{
                turnStart()
            }
            else{
                print("ROUND",turn,":")
            }
            delegate.gameMove()
           
            ///解包
            delegate.turnEnd?()
            
            turn += 1
        }
        delegate.gameEnd()
    }
}

class RollNumberGame: SinglePlayerTurnBaseGame,TurnBasedGameDelegate{
    var score = 0
    override init(){
        super.init()
        delegate = self;
    }
    
    func gameStart() {
        score = 0
        turn = 0
        print("Welcome to Roll Number Game.")
        print("Try to use least turn to make total 100 scores !!")
    }
    
    func gameMove() {
        let randomNum = Int(arc4random()) % 50 + 1;
        score += randomNum
        print("You rolled a", randomNum, "! The score is",score,"now!")
    }
    
    func gameEnd() {
        print("Congratulation ! You Win the game in", turn,"ROUND !")
    }
    
    func gameOver() -> Bool {
        return score >= 100
    }
    
    func turnStart() {
        print("== Round Start ==")
    }
    
    func turnEnd() {
        print("=====================")
    }
}

/// 石头剪子布游戏
class  RockPaperScissor: SinglePlayerTurnBaseGame, TurnBasedGameDelegate{
    enum Shape: Int,CustomStringConvertible{
        case Rock
        case Paper
        case Scissor
        
        func beat(shape: Shape) -> Bool {
            return (self.rawValue + 1) % 3 == shape.rawValue
        }
        var description: String{
            switch self {
            case .Rock: return "Rock"
            case .Paper: return "Paper"
            case .Scissor: return "Scissor"
            }
        }
    }
    
    var wins = 0
    
    override init(){
        super.init()
        delegate = self;
    }
    
    static func go() -> Shape{
        return Shape(rawValue: Int(arc4random() % 3))!
    }
    
    
    
    func gameStart() {
        wins = 0
        print("== Rock Paper Scissor")
    }
    
    func gameEnd() {
        if wins >= 2 {
            print("You Win !")
        }
        else{
            print("You loose ...")
        }
    }
    
    func gameMove() {
        let yourShape = RockPaperScissor.go()
        let otherShape = RockPaperScissor.go()
        print("Your:",yourShape)
        print("Other:",otherShape)
        
        if yourShape.beat(shape: otherShape) {
            print("You Win this round!")
            wins += 1
        }
        else{
            print("You don't win")
        }
    }
    
    func gameOver() -> Bool {
        return wins >= 2
    }
}


let rollNumberGame = RollNumberGame()
rollNumberGame.play()
let rockPaperScissor = RockPaperScissor()
rockPaperScissor.play()