import UIKit

class ViewController: UIViewController {
    
    private let button: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.backgroundColor = .red
        button.setTitle("Add a view", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        addCustomView()
        setUpButton()
    }
    
    private func addCustomView() {
        let alert = AlertWithMessage()
        alert.frame = CGRect(x: 50, y: 50, width: 276, height: 100)
        view.addSubview(alert)
        alert.text = "Хорошо, больше такого не посоветуем"
    }
    
    private func setUpButton() {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 120).isActive = true
        button.addTarget(self, action: #selector(addNewView), for: .touchUpInside)
    }
    
    @objc private func addNewView() {
        let numOfSubviews = view.subviews.count
        guard numOfSubviews != 0 else {
            print("You have a subview in the VC")
            return
        }
        
        addCustomView()
    }
}

