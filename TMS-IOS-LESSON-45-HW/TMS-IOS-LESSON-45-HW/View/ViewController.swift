import UIKit
import Combine

class ViewController: UIViewController {
    
    var label = {
        let label = UILabel()
        label.text = ""
        label.font = label.font.withSize(30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let plusButton = {
        let btn = UIButton()
        btn.setTitle("+", for: .normal)
        btn.backgroundColor = .gray
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 4
        return btn
    }()
    
    let minusButton = {
        let btn = UIButton()
        btn.setTitle("-", for: .normal)
        btn.backgroundColor = .gray
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 4
        return btn
    }()
    
    private let vm = CounterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        vm.counter.sink {self.label.text = $0}.store(in: &vm.cancellable)
    }
    
    
    private func setupUI() {
        view.addSubview(label)
        view.addSubview(plusButton)
        view.addSubview(minusButton)
        
        let plusAction = UIAction {_ in
            self.vm.plus()
        }
        
        plusButton.addAction(plusAction, for: .touchUpInside)
        
        let minusAction = UIAction {_ in
            self.vm.minus()
        }
        
        minusButton.addAction(minusAction, for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            plusButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            plusButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 70),
            plusButton.widthAnchor.constraint(equalToConstant: 30),
            plusButton.heightAnchor.constraint(equalToConstant: 30),
            
            minusButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            minusButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -70),
            minusButton.widthAnchor.constraint(equalToConstant: 30),
            minusButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
}

