//
//  LayoutView.swift
//  TextKit
//
//  Created by zhangguang on 17/3/6.
//  Copyright © 2017年 com.Tech. All rights reserved.
//

import UIKit


///NSTextStorage 这个类是NSMutableAttributeString的子类，存储要管理的文本

/// NSTextContainer 这个组件表示文本要填充的区域，通常是一列或者一页，可以去除某些区域。多数情况下，这个区域是矩形。

/// NSLayoutManager 这个组件在文本容器上应用布局


class MDTextContainerView: UIView,NSLayoutManagerDelegate{
    private var textContainer: NSTextContainer!
    private var layoutManager: NSLayoutManager!
    private var textStorage: NSTextStorage!
    private var caretView: MDCaretView

    private var defaultTintColor: UIColor{
        return UIColor(red:69.0/255.0,green:111/255.0,blue:238/255.0, alpha:1.0)
    }
    
    public var text: String{
        get{
            return self.textStorage.string
        }
        set{
            let range: NSRange = NSMakeRange(0, self.text.characters.count)
            self.textStorage.replaceCharacters(in: range, with: newValue)
            let rect = self.textStorage.boundingRect(with: CGSize(width:self.bounds.size.width,height:0), options: [.usesLineFragmentOrigin,.usesFontLeading] , context: nil)
            print("xxxxx",self.text.characters.count)
            let glyphIndex = self.layoutManager.glyphIndexForCharacter(at: 402);
            let point =  self.layoutManager.location(forGlyphAt: glyphIndex)
            let lastRect = self.layoutManager.boundingRect(forGlyphRange: NSMakeRange(glyphIndex,1),in: self.textContainer)
        
            self.caretView.frame = CGRect(origin:lastRect.origin,size:CGSize(width:2,height:lastRect.size.height))
            print("text didSet rect",NSStringFromCGRect(rect),"point",point,"lastrect",NSStringFromCGRect(lastRect))
            self.textContainer.size = rect.size
            
            

            
            self.setNeedsDisplay()
        }
    }
    
    
    
     override var bounds: CGRect{
        didSet{
             self.textContainer.size = self.bounds.size
            print("============bounds didSet ================",NSStringFromCGRect(self.bounds))
        }
    }
    

    
    required init?(coder aDecoder: NSCoder) {
        self.caretView = MDCaretView()
        super.init(coder: aDecoder)
        
        self.caretView.color = self.defaultTintColor
        self.caretView.frame = CGRect(x:0,y:0,width:2,height:20)
        self.addSubview(self.caretView)
        self.caretView.caretBlinks = true
        
        //fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.textContainer = NSTextContainer()
        self.layoutManager = NSLayoutManager()
        self.textStorage = NSTextStorage(string: "NSTextContainer 这个组件表示文本要填充的区域，通常是一列或者一页，可以去除某些区域。多数情况下，这个区域是矩形")
    
        self.textContainer.size = self.bounds.size
        
        self.layoutManager.delegate = self
        
        self.layoutManager.addTextContainer(self.textContainer)
        self.textStorage.addLayoutManager(self.layoutManager)
        self.textContainer.lineBreakMode = .byWordWrapping
        
        
    }
    
    override func draw(_ rect: CGRect) {
        let range = self.layoutManager.glyphRange(for: self.textContainer)
        let rect = self.layoutManager.usedRect(for: self.textContainer)
        print("draw ",NSStringFromCGRect(rect))
        let pointZero = CGPoint()
        
        self.layoutManager .drawBackground(forGlyphRange: range, at: pointZero)
        self.layoutManager.drawGlyphs(forGlyphRange: range, at: pointZero)
    }
    
    
    func layoutManagerDidInvalidateLayout(_ sender: NSLayoutManager) {
        self.setNeedsDisplay()
    }
    
    
    
}
