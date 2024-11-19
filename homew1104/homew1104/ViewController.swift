import SwiftUI
import UIKit


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
    }() //processlabel. 생성
    
    private let resultLabel: UILabel = {
        let resultLabel = UILabel() // 결과를 검정으로 표시
        resultLabel.textColor = .white
        resultLabel.text = "ResultLabel"
        resultLabel.textAlignment = .right
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.font = UIFont.systemFont(ofSize: 30)
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return resultLabel
    }() //resultLabel 생성
    
    private let resultStackView: UIStackView = {
        let resultStackView = UIStackView()
        resultStackView.axis = .vertical
        resultStackView.distribution = .fillEqually
        resultStackView.translatesAutoresizingMaskIntoConstraints = false
        return resultStackView
    }()
    
    private let excelStackView: UIStackView = {
        let excelStackView = UIStackView()
        excelStackView.axis = .vertical
        excelStackView.distribution = .fillEqually
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
        return excelStackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultStackView.addArrangedSubview(processLabel)
        resultStackView.addArrangedSubview(resultLabel)
        //stackView 설정
        
        view.addSubview(resultStackView)
        view.addSubview(excelStackView)
        
        
        NSLayoutConstraint.activate([
            resultStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            resultStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            resultStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant : -30),
            resultStackView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            excelStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            excelStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            excelStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            excelStackView.topAnchor.constraint(equalTo: resultStackView.bottomAnchor, constant:20)
        ])
        
        view.backgroundColor = .darkGray
    }
    
    @objc func anyButoon(_ sender: UIButton) {
        
    }
    
    @objc func clickACButton(_ sender: UIButton) {
        resultLabel.text = ""
        processLabel.text = ""
    }
    
    @objc func clickEqualButton(_ sender: UIButton) {
    
    }
    
    
}


// SwiftUI Canvas에서 사용할 수 있도록 ViewController를 래핑(내가 지금 볼 필요 x)
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
