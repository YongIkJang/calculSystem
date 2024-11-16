import SwiftUI
import UIKit


let excelStackView = UIStackView()

let buttonTitles : [[String]] = [["AC","+/-","%","/"],["7","8","9","X"],["4","5","6","-"],["1","2","3","+"],["","0",".","="]]

class ViewController: UIViewController {
    
    private let processLabel : UILabel = {
        let processLabel = UILabel() //과정을 회색으로 표시
        processLabel.textColor = .lightGray
        processLabel.text = "ProcessLabel"
        processLabel.textAlignment = .right
        processLabel.font = UIFont.systemFont(ofSize: 30)
        processLabel.translatesAutoresizingMaskIntoConstraints = false

        return processLabel
    }()
    
    private let resultLabel: UILabel = {
        let resultLabel = UILabel() // 결과를 검정으로 표시
        resultLabel.textColor = .white
        resultLabel.text = "ResultLabel"
        resultLabel.textAlignment = .right
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.font = UIFont.systemFont(ofSize: 30)
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return resultLabel
    }()
    
    private let resultStackView: UIStackView = {
        let resultStackView = UIStackView()
        resultStackView.axis = .vertical
        resultStackView.distribution = .fillEqually
        resultStackView.translatesAutoresizingMaskIntoConstraints = false
        return resultStackView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultStackView.addArrangedSubview(processLabel)
        resultStackView.addArrangedSubview(resultLabel)
        //stackView 설정
        
        
        excelStackView.axis = .vertical
        
        excelStackView.translatesAutoresizingMaskIntoConstraints = false
        
        for buttonTitle in buttonTitles {
            let newStackView = UIStackView()
            newStackView.axis = .horizontal
            newStackView.distribution = .fillEqually
            newStackView.spacing = 10
            for button in buttonTitle {
                let calculButton = UIButton(type: .system)
                calculButton.tintColor = .white
                

                calculButton.setTitle(button, for: .normal)
                newStackView.addArrangedSubview(calculButton)
            }
            excelStackView.addArrangedSubview(newStackView)
        }
        
        
        view.addSubview(resultStackView)
        view.addSubview(excelStackView)
        
        
        NSLayoutConstraint.activate([
            resultStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            resultStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            resultStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant : -30),
            resultStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25),
        
        ])
        
        NSLayoutConstraint.activate([
            excelStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            excelStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            excelStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
           // excelStackView.topAnchor.constraint(equalTo: resultStackView.bottomAnchor, constant:20)
            
        ])
        
        view.backgroundColor = .darkGray
    }
    
    @objc func calculbuttonTapped(_ sender: UIButton) {
        // 버튼 클릭 이벤트 처리
    }
}




// SwiftUI Canvas에서 사용할 수 있도록 ViewController를 래핑
struct ViewControllerPreview: PreviewProvider {
    static var previews: some View {
        // UIKit ViewController를 SwiftUI에서 Preview로 표시
        ViewControllerWrapper()
            .edgesIgnoringSafeArea(.all) // 화면의 전체 영역을 사용
    }
}
struct ViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ViewController {
        return ViewController()
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        // 업데이트 로직
    }
}
