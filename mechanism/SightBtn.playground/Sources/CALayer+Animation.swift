import UIKit

extension CALayer
{
  func setValue(_ value: Any?, forKey keyPath: String, duration: CFTimeInterval, delay: CFTimeInterval) {
    CATransaction.begin()
    
    CATransaction.setDisableActions(true)
    let anim = CABasicAnimation(keyPath: keyPath)
    anim.duration = duration
    anim.beginTime = CACurrentMediaTime() + delay
    anim.fillMode = kCAFillModeBoth
    anim.fromValue = self.presentation()?.value(forKeyPath: keyPath)
    anim.toValue = value
    self.add(anim, forKey: keyPath)
    self.setValue(value, forKey: keyPath)
    CATransaction.commit()
  }
}

