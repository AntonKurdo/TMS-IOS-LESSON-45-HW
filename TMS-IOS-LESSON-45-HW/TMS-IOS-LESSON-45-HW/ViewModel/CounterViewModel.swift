import Combine
import UIKit

final class CounterViewModel {
    private var counter = CurrentValueSubject<String, Never>("0")
    private var cancellable = [AnyCancellable]()
    
    func subscribeToCounter(label: UILabel) {
        counter.sink {label.text = $0}.store(in: &cancellable)
    }
    
    func plus() {
        counter.send(String((Int(counter.value) ?? 0) + 1))
    }
    
    func minus() {
        counter.send(String((Int(counter.value) ?? 0) - 1))
    }
}
