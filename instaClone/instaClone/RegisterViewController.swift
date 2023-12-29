//
//  RegisterViewController.swift
//  instaClone
//
//  Created by 김혜란 on 12/21/23.
//

import UIKit

class RegisterViewController: UIViewController {
    //MARK: - Ptoperties
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
    
    
    var textFields: [UITextField] {
        [emailTextField, nameTextField, nickNameTextField, passwordTextField]
    }
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    //MARK: - Acitons
    @objc
    func textFieldEditingChange(_ sender: UITextField) {
        let text =  sender.text ?? ""
        
        switch sender {
        case emailTextField:
            self.isValidEmail = text.isValidEmail()
            
        case nameTextField:
            self.isvalidName = text.count > 2
            
        case nickNameTextField:
            self.isValidNickName = text.count > 2
            
        case passwordTextField:
            self.isValidPassword = text.isValidPassword()
            
        default:
            fatalError("Missing")
            
        }
    }
    
    
    
    //MARK: - Helpers
    
    //연결 메소드
    private func setupTextField() {
        
        textFields.forEach { tf in
            tf.addTarget(self, action: #selector(textFieldEditingChange(_:)), for: .editingChanged)
        }
        
        //        emailTextField.addTarget(self, action: #selector(textFieldEditingChange(_:)), for: .editingChanged)
    }
    
    
    private func validateUserInfo() {
        
        if isValidEmail
            && isvalidName
            && isValidNickName
            && isValidPassword {
            
            UIView.animate(withDuration: 0.33) {
                self.singupButton.backgroundColor = UIColor.facebool
            }
        } else {
            UIView.animate(withDuration: 0.33) {
                self.singupButton.isEnabled = false
                self.singupButton.backgroundColor = .disabledButton
            }
        }
    }
}


//정규 표현식
extension String {
    func isValidPassword() -> Bool {
        let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&](8,]"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        
        return passwordValidation.evaluate(with: self)
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]=@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}

