import SwiftUI
import UIKit

// 새로운 화면을 나타낼 뷰 컨트롤러 (예시로 SecondViewController 생성)
class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        let label = UILabel()
        label.text = "새로운 화면입니다!"
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

class ViewController: UIViewController {
    
    private let addButton: UIButton = {
        let addButton = UIButton()
        addButton.setTitle("+", for: .normal)
        addButton.setTitleColor(.white, for: .normal)
        addButton.backgroundColor = .systemGray
        addButton.translatesAutoresizingMaskIntoConstraints = false
        return addButton
    }()
    
    private let inputEvent : UITextField = {
        let inputEvent = UITextField()
        inputEvent.placeholder = "어떤 이벤트 인가요?"
        inputEvent.borderStyle = .roundedRect
        inputEvent.translatesAutoresizingMaskIntoConstraints = false
        return inputEvent
    }()
    
    private let nameEvent : UITextField = {
        let nameEvent = UITextField()
        nameEvent.placeholder = "누구랑 약속인가요?"
        nameEvent.borderStyle = .roundedRect
        nameEvent.translatesAutoresizingMaskIntoConstraints = false
        return nameEvent
    }()
    
    private let timerLabel : UIDatePicker = {
        let timerLabel = UIDatePicker()
        timerLabel.datePickerMode = .dateAndTime
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        return timerLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 배경색 설정
        view.backgroundColor = .white

        // 버튼 추가
        view.addSubview(addButton)
        view.addSubview(inputEvent)
        view.addSubview(nameEvent)
        view.addSubview(timerLabel)

        // 버튼 제약 조건 설정
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            inputEvent.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            inputEvent.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            inputEvent.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            inputEvent.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        NSLayoutConstraint.activate([
            timerLabel.topAnchor.constraint(equalTo: nameEvent.bottomAnchor, constant: 30),
            timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            nameEvent.topAnchor.constraint(equalTo: inputEvent.topAnchor, constant: 100),
            nameEvent.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            nameEvent.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            nameEvent.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        // 버튼 클릭 이벤트 설정
        addButton.addTarget(self, action: #selector(navigateToSecondScreen), for: .touchUpInside)
    }
    
    @objc func navigateToSecondScreen() {
        // 네비게이션 컨트롤러에서 새로운 화면을 푸시
        let secondViewController = SecondViewController()
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
}


// SwiftUI Preview를 위한 ContentView
struct ContentView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = ViewController()
        let navigationController = UINavigationController(rootViewController: viewController) // 네비게이션 컨트롤러로 감싸기
        return navigationController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
