import UIKit

class AlertWithMessage: UILabel {
    override init(frame: CGRect) {
        let customFrame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.width, height: 36)
        super.init(frame: customFrame)
        setUpSelf()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)
        super.drawText(in: rect.inset(by: insets))
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let newFrame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.width, height: 36)
        self.frame = newFrame
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.text = ""
            UIView.animate(withDuration: 0.5) {
                let positionX = self.frame.origin.x + self.frame.width / 2 - 5
                self.frame = CGRect(x: positionX, y: self.frame.origin.y, width: 40, height: self.frame.height)
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.removeFromSuperview()
            }
        }
    }
    
    private func setUpSelf() {
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.cornerRadius = 12
        self.font = UIFont.systemFont(ofSize: 14)
    }
}
