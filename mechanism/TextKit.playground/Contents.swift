//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport



///NSTextStorage 这个类是NSMutableAttributeString的子类，存储要管理的文本

/// NSTextContainer 这个组件表示文本要填充的区域，通常是一列或者一页，可以去除某些区域。多数情况下，这个区域是矩形。

/// NSLayoutManager 这个组件在文本容器上应用布局


class LayoutView: UIView,NSLayoutManagerDelegate{
    var textContainer: NSTextContainer!
    var layoutManager: NSLayoutManager!
    var textStorage: NSTextStorage!
    
    
    override init(frame: CGRect) {
        self.textContainer = NSTextContainer(size: frame.size)
        self.layoutManager = NSLayoutManager()
        self.layoutManager.addTextContainer(self.textContainer)
        self.textStorage = NSTextStorage(string: "NSTextContainer 这个组件表示文本要填充的区域，通常是一列或者一页，可以去除某些区域。多数情况下，这个区域是矩形")
        super.init(frame: frame)
        
        
        self.layoutManager.delegate = self
        self.textStorage.addLayoutManager(self.layoutManager)
    }
    
    
    
    var text: String{
        get{
            return self.textStorage.string
        }
        set{
            let range: NSRange = NSMakeRange(0, self.text.characters.count)
            self.textStorage.replaceCharacters(in: range, with: newValue)
            self.setNeedsDisplay()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
    
    
    override func draw(_ rect: CGRect) {
        let range = self.layoutManager.glyphRange(for: self.textContainer)
        //let rect = self.layoutManager.usedRect(for: self.textContainer)
        let pointZero = CGPoint()
        
        self.layoutManager .drawBackground(forGlyphRange: range, at: pointZero)
        self.layoutManager.drawGlyphs(forGlyphRange: range, at: pointZero)
    }
    
    
    func layoutManagerDidInvalidateLayout(_ sender: NSLayoutManager) {
        self.setNeedsDisplay()
    }
    
    
    
}

let layoutViewx = LayoutView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
layoutViewx.backgroundColor = UIColor.green
layoutViewx.text = "TextContainer 这个组件表示文本要填充的区域，通常是一列或者一页，可以去除某些区域。多数情况下，这个区域是矩形 aaaaaaaaaaaaaaaaaa"

PlaygroundPage.current.liveView = layoutViewx
