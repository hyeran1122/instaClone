//
//  LoginViewController.swift
//  instaClone
//
//  Created by 김혜란 on 12/21/23.
//

import UIKit


class LoginViewController: UIViewController {
    
    var email = String()
    var password = String()
    var userInfo: UserInfo?
    
    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()
        
        
    }
    
    
    //이메일에 뭔가 입력될때마다 이 함수가 호출됨
    @IBAction func emailTextFieldEditingChange(_ sender: UITextField) {
        let text = sender.text ?? ""
        
        self.loginButton.backgroundColor = text.isValidEmail() ? .facebool : .disabledButton
        
        self.email = text
    }
    
    @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        
        self.loginButton.backgroundColor = text.count > 2 ? .facebool : .disabledButton
        
        self.password = text
    }
    
    
    @IBAction func loginButtonDidTap(_ sender: UIButton) {
        //회원가입정보를 전달받고, 그것과 textField값이 일치하면 로그인이 되어야 한다.
        guard let userInfo = self.userInfo else { return }
        
        if userInfo.email == self.email
            && userInfo.password == self.password {
            let vc = storyboard?.instantiateViewController(withIdentifier: "TextVC") as! UITabBarController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
        else {
            
        }
    }
    
    
    @IBAction func registerButtonDidTap(_ sender: UIButton) {
        //1. 스토리 보드 생성
        let stotyboard = UIStoryboard(name:"Main", bundle: nil)
        
        //2. 뷰컨트롤러 생성
        let registerViewControllor = stotyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
        
        //3. 화면전환
        self.navigationController?.pushViewController(registerViewControllor, animated: true)
        
        registerViewControllor.userInfo = { [weak self] (userInfo) in
            self?.userInfo = userInfo
        }
    }
    
    
    private func setupAttribute() {
        
        let text1 = "계정이 없으신가요?"
        let text2 = "가입하기"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor.facebool
        
        let attributes = self.registerButton.generateButtonAttribute(texts: text1, text2,
                                                                     fonts: font1, font2,
                                                                     colors: color1, color2)
        
        self.registerButton.setAttributedTitle(attributes, for: .normal)
    }
    
}
