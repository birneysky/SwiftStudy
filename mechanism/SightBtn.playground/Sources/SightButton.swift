import UIKit



open class SightButton: UIView{
  
  /// 中心圆形图层
  private lazy var centerLayer: CAShapeLayer = {
    let layer = CAShapeLayer()
    layer.frame = self.bounds
    layer.fillColor = UIColor.white.cgColor
    return layer;
  }()
  
  /// 外层环形图层
  private lazy var ringLayer: CAShapeLayer = {
    let layer = CAShapeLayer()
    layer.frame = self.bounds
    layer.fillColor = UIColor.lightGray.cgColor
    return layer
  }()
  
  /// 进度条图层
  private lazy var progressLayer: CAShapeLayer = {
    let layer = CAShapeLayer()
    return layer;
  }()
  
  /// 刷新定时器
  private lazy var displayLink: CADisplayLink = {
    let link = CADisplayLink(target: self, selector: #selector(dispalyLinkRun))
    link.preferredFramesPerSecond = 60;
    link.add(to: RunLoop.current, forMode: .defaultRunLoopMode)
    return link;
  }()
  
  private var progress: Float = 0.0
  private var isTimeOut: Bool = false
  private var isPressed: Bool = false
  private var isCancel: Bool = false
  
  // MARK:- initializers
  override public init(frame: CGRect) {
    super.init(frame: frame)
    self.setup()
  }
  
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder);
    self.setup()
  }
  
  func setup(){
    let width = self.bounds.size.width
    self.layer.addSublayer(self.ringLayer)
    self.layer.addSublayer(self.centerLayer)
    let centerWith = width / 2
    let centerRect = CGRect(x: centerWith / 2, y: centerWith / 2, width: centerWith, height: centerWith)
    let centerPath = UIBezierPath(roundedRect: centerRect, cornerRadius: centerWith / 2)
    self.centerLayer.path = centerPath.cgPath
    
    let ringRect = centerRect.insetBy(dx: -0.3 * centerWith / 2, dy: -0.3*centerWith / 2);
    let ringPath = UIBezierPath(roundedRect: ringRect, cornerRadius: ringRect.width / 2);
    self.ringLayer.path = ringPath.cgPath
    
    let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPressHandle))
    self.addGestureRecognizer(longPress)
  
    let tap = UITapGestureRecognizer(target: self, action: #selector(tapHandle(gesture:)))
    self.addGestureRecognizer(tap)
  }
  
  //MARK:- gestrue selector
  func longPressHandle(_ gesture: UILongPressGestureRecognizer){
    switch gesture.state {
    case .began:
      self.isPressed = true
      //self.displayLink.isPaused = false
      self.layer.addSublayer(self.progressLayer)
    case .changed:
      self.isPressed = false
    case .ended:
      self.isPressed = false
    case .cancelled:
      self.isPressed = false
    default:
      self.isPressed = false
    }
  }
  
  func tapHandle( gesture: UITapGestureRecognizer){
    
  }
  
  //MARK:- DisplayLink Selector
  func dispalyLinkRun(){
    print("\(Date().description)")
  }
  
  //MARK:- Helper
  func updateLayerWithAnimation(){
    let width = self.bounds.size.width
    let halfWith = width / 2
    
  }

}
