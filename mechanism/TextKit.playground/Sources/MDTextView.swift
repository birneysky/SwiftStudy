import UIKit


public class MDTextView: UIScrollView,MDTextContainerViewDelegate{
    private var textContainView: MDTextContainerView!
    
    public var text: String{
        set{
            self.textContainView.text = newValue
        }
        get{
            return self.textContainView.text
        }
    }
   
    
    
    private func  initView(size: CGSize){
        self.textContainView = MDTextContainerView(frame: CGRect(origin: CGPoint(x:0,y:0), size: CGSize(width: size.width, height: size.height)))
        self.textContainView.delegate = self
        self.textContainView.backgroundColor = UIColor.white
        self.addSubview(self.textContainView)
        print("-->contentInset",NSStringFromUIEdgeInsets(self.contentInset),"-->cotentOffset:",NSStringFromCGPoint(self.contentOffset))
    }
    
    public override init(frame: CGRect){
        super.init(frame: frame)
        self.initView(size: frame.size)
    }
    
    public required  init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initView(size: CGSize.zero)
    }
    
    
    func didTextContainerViewSizeChanged(newSize: CGSize) {
        let rect = self.textContainView.frame
        let size = CGSize(width: rect.size.width, height: newSize.height);
        //self.textContainView.bounds = CGRect(origin: CGPoint.zero, size:size)
        print("size: ",NSStringFromCGSize(size))
        self.contentSize = size
        self.textContainView.frame  = CGRect(origin: rect.origin, size: size)
        self.scrollRectToVisible(self.textContainView.caretViewRect, animated: true)
    }
   
}

