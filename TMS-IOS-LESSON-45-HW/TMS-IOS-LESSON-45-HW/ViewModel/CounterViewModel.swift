import Combine
import UIKit

final class CounterViewModel {
    private(set) var counter = CurrentValueSubject<String, Never>("0")
    var cancellable = [AnyCancellable]()

    func plus() {
        counter.send(String((Int(counter.value) ?? 0) + 1))
    }
    
    func minus() {
        counter.send(String((Int(counter.value) ?? 0) - 1))
    }
}
