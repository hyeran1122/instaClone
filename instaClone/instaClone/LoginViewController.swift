//
//  LoginViewController.swift
//  instaClone
//
//  Created by 김혜란 on 12/21/23.
//

import UIKit


class LoginViewController: UIViewController {
    
    var eamil = String()
    var password = String()
    
    @IBOutlet weak var registerButton: UIButton!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()
        
        
        
        
        
        
    }
    
    
    //이메일에 뭔가 입력될때마다 이 함수가 호출됨
    @IBAction func emailTextFieldEditingChange(_ sender: UITextField) {
        let text = sender.text ?? ""
        print(text)
    }
    
    @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
        
    }
    
    
    @IBAction func loginButtonDidTap(_ sender: UIButton) {
    }
    
    
    @IBAction func registerButtonDidTap(_ sender: UIButton) {
        //1. 스토리 보드 생성
        let stotyboard = UIStoryboard(name:"Main", bundle: nil)
        
        //2. 뷰컨트롤러 생성
        let registerViewControllor = stotyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
        
        //3. 화면전환
        self.navigationController?.pushViewController(registerViewControllor, animated: true)
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
