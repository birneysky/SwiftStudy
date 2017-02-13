import Foundation

public class GameManager{
    public var score = 0
    
    public static let defaultManager = GameManager()
    
    private init(){
        
    }
    
    public func addScore(){
        self.score += 10
    }
}
