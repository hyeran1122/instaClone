//
//  RegisterViewController.swift
//  instaClone
//
//  Created by 김혜란 on 12/21/23.
//

import UIKit

class RegisterViewController: UIViewController {
    //MARK: - Ptoperties
    var isValidEmail = false
    var isvalidName = false
    var isValidNickName = false
    var isValidPassword = false
    
    //텍스트 필드가져오기
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var nickNameTextField: UITextField!

    @IBOutlet weak var passwordTextField: UITextField!
    
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
        
        
    }
    
    
    
    //MARK: - Helpers

    //연결 메소드
    private func setupTextField() {
        
//        emailTextField.addTarget(self, action: #selector(textFieldEditingChange(_:)), for: .editingChanged)
    }
    
    
    
}
