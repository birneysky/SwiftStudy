import UIKit


enum Theme{
    case DayMode
    case NightMode
}

class UI{
    private var fontColor: UIColor!
    private var backgroundColor: UIColor!
    
    var themeMode: Theme = .DayMode{
        didSet{
            self.changeThemeMode(themeMode)
        }
    }
    
    init(){
        self.themeMode = .DayMode
        self.changeThemeMode(self.themeMode)
    }
    
    init(themeMode:Theme){
        self.themeMode = themeMode
        self.changeThemeMode(themeMode)
    }
    
    private func changeThemeMode(_ themeMode: Theme){
        switch themeMode {
        case .DayMode:
            fontColor = UIColor.black
            backgroundColor = UIColor.white
        case .NightMode:
            fontColor = UIColor.white
            backgroundColor = UIColor.black
        }
    }
    
    public func show(){
        print("the font color is \(fontColor == UIColor.white ? "WHITE" : "BLACK")")
        print("the background color is \(backgroundColor == UIColor.white ? "WHITE" : "BLACK")")
    }
}
