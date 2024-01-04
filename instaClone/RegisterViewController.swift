//
//  RegisterViewController.swift
//  instaClone
//
//  Created by 김혜란 on 12/21/23.
//

import UIKit

class RegisterViewController: UIViewController {
    //MARK: - Ptoperties
    var email: String = ""
    var name: String = ""
    var nickname: String = ""
    var password: String = ""
    
    //데이터를 구조체로 선언하고, 유저인포를 인풋해주면 보이드처리(아웃풋X)
    var userInfo: ((UserInfo) -> Void)?
    
    var isValidEmail = false {
        didSet {
            self.validateUserInfo()
        }
    }
    
    var isvalidName = false{
        didSet {
            self.validateUserInfo()
        }
    }
    
    var isValidNickName = false{
        didSet {
            self.validateUserInfo()
        }
    }
    
    var isValidPassword = false{
        didSet {
            self.validateUserInfo()
        }
    }
    
    //텍스트 필드가져오기
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var nickNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var singupButton: UIButton!
    
    
    @IBOutlet weak var poptoLoginButton: UIButton!
    
    
    var textFields: [UITextField] {
        [emailTextField, nameTextField, nickNameTextField, passwordTextField]
    }
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
        setupAttribute()
        
        //bug fix
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    
    
    
    //MARK: - Acitons
    @objc
    func textFieldEditingChange(_ sender: UITextField) {
        let text =  sender.text ?? ""
        
        switch sender {
        case emailTextField:
            self.isValidEmail = text.isValidEmail()
            self.email = text
            
        case nameTextField:
            self.isvalidName = text.count > 2
            self.name = text
            
        case nickNameTextField:
            self.isValidNickName = text.count > 2
            self.nickname = text
            
        case passwordTextField:
            self.isValidPassword = text.isValidPassword()
            self.password = text
            
        default:
            fatalError("Missing")
            
        }
        
        validateUserInfo()
    }
    
    
    //뒤로가기
    @IBAction func backButtonDidTap(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func registerButtonDidTap(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        let userInfo = UserInfo(email: self.email, name: self.name, nickname: self.nickname, password: self.password)
        
        self.userInfo?(userInfo)
    }
    
    
    
    //MARK: - Helpers
    
    //연결 메소드
   
    private func setupTextField() {
        textFields.forEach { tf in
            tf.addTarget(self, action: #selector(textFieldEditingChange(_:)), for: .editingChanged)
        }
    }
    
   
    
    private func validateUserInfo() {
        if isValidEmail && isvalidName && isValidNickName && isValidPassword {
            UIView.animate(withDuration: 0.33) {
                self.singupButton.isEnabled = true
                self.singupButton.backgroundColor = UIColor.facebool
            }
        } else {
            UIView.animate(withDuration: 0.33) {
                self.singupButton.isEnabled = false
                self.singupButton.backgroundColor = .disabledButton
            }
        }
    }
    
    
    
    
    private func setupAttribute() {
        
        let text1 = "계정이 있으신가요?"
        let text2 = "로그인"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor.facebool
        
        let attributes = self.poptoLoginButton.generateButtonAttribute(texts: text1, text2,
                                                                       fonts: font1, font2,
                                                                       colors: color1, color2)
        
        self.poptoLoginButton.setAttributedTitle(attributes, for: .normal)
    }
}


//정규 표현식
extension String {
    func isValidPassword() -> Bool {
        let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}$"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        
        return passwordValidation.evaluate(with: self)
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}

