import UIKit


///NSTextStorage 这个类是NSMutableAttributeString的子类，存储要管理的文本

/// NSTextContainer 这个组件表示文本要填充的区域，通常是一列或者一页，可以去除某些区域。多数情况下，这个区域是矩形。

/// NSLayoutManager 这个组件在文本容器上应用布局


protocol MDTextContainerViewDelegate: class {
    func didTextContainerViewSizeChanged(newSize: CGSize)
}

public class MDTextContainerView: UIView,NSLayoutManagerDelegate{
    private var textContainer: NSTextContainer!
    private var layoutManager: NSLayoutManager!
    private var textStorage: NSTextStorage!
    private var caretView: MDCaretView!
    
    weak var delegate: MDTextContainerViewDelegate?
    
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
            /// 如果直接使用self.bounds.size.width为宽度 计算出来的高度会少一行的高度，最后一行会显示不全。减掉padding会解决这个问题。
            let actualWidth = self.bounds.size.width - self.textContainer.lineFragmentPadding * 2
            let boundingRect = self.textStorage.boundingRect(with: CGSize(width:actualWidth,height:0), options: [.usesLineFragmentOrigin,.usesFontLeading,.usesDeviceMetrics] , context: nil)
            self.textContainer.size = CGSize(width: self.bounds.size.width, height: boundingRect.size.height)
            let glyphIndex = self.layoutManager.glyphIndexForCharacter(at: self.text.characters.count-1);
            let glypPoint =  self.layoutManager.location(forGlyphAt: glyphIndex)
            let lastRect = self.layoutManager.boundingRect(forGlyphRange: NSMakeRange(glyphIndex,1),in: self.textContainer)
            
            let caretOrigin = CGPoint(x: lastRect.origin.x + lastRect.size.width, y: lastRect.origin.y)
            self.caretView.frame = CGRect(origin:caretOrigin,size:CGSize(width:2,height:lastRect.size.height))
           
            let containRect = self.layoutManager.boundingRect(forGlyphRange: NSMakeRange(0, self.text.characters.count), in: self.textContainer)
            
            //
            print("boundingRect:",NSStringFromCGRect(boundingRect),"glypPoint:",NSStringFromCGPoint(glypPoint),"containRect:",NSStringFromCGRect(containRect),"lastRect:",NSStringFromCGRect(lastRect),"bouds:",NSStringFromCGRect(self.bounds))
            if boundingRect.size.height > self.bounds.size.height {
                print("text changed .............")
                let size = CGSize(width: self.bounds.size.width, height: boundingRect.size.height )
                self.delegate?.didTextContainerViewSizeChanged(newSize: size)
                //
            }
            self.setNeedsDisplay()
        }
    }
    
    public var caretViewRect: CGRect{
        return self.caretView.frame
    }
    override public var bounds: CGRect{
        didSet{
            self.textContainer.size = self.bounds.size
            print("________")
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.initView()
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        self.initView()
    }
    
    private func initView(){
        self.textContainer = NSTextContainer()
        self.layoutManager = NSLayoutManager()
        self.textStorage = NSTextStorage()
        
        self.textContainer.size = self.bounds.size
        
        self.layoutManager.delegate = self
        
        self.layoutManager.addTextContainer(self.textContainer)
        self.textStorage.addLayoutManager(self.layoutManager)
        self.textContainer.lineBreakMode = .byWordWrapping
        
        self.caretView = MDCaretView()
        
        self.caretView.color = self.defaultTintColor
        self.caretView.frame = CGRect.zero
        self.addSubview(self.caretView)
        self.caretView.caretBlinks = true
    
        //self.text = "hello"
    }
    
    override public func draw(_ rect: CGRect) {
        let range = self.layoutManager.glyphRange(for: self.textContainer)
        let rect = self.layoutManager.usedRect(for: self.textContainer)
        //print("draw ",NSStringFromCGRect(rect))
        let pointZero = CGPoint.zero
        
        self.layoutManager .drawBackground(forGlyphRange: range, at: pointZero)
        self.layoutManager.drawGlyphs(forGlyphRange: range, at: pointZero)
    }
    
    
    public func layoutManagerDidInvalidateLayout(_ sender: NSLayoutManager) {
        self.setNeedsDisplay()
    }
    
    public func insertText(_ text: String ,at index: Int){
        self.textStorage.insert( NSAttributedString(string: text), at: index)
    }
    
}


