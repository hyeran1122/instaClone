//
//  UIViewController+Extantion.swift
//  instaClone
//
//  Created by 김혜란 on 12/29/23.
//

import UIKit

extension UIButton {
    func generateButtonAttribute(texts: String..., fonts: UIFont..., colors: UIColor...) -> NSMutableAttributedString {
        
        guard let wholeText = self.titleLabel?.text else { fatalError("버튼에 텍스트가 없음.") }
        
        let customFonts: [UIFont] = fonts
        
        let customTextRanges = texts.indices.map { index in
            (wholeText as NSString).range(of: texts[index])
        }
        
        let attributedString = NSMutableAttributedString(string: wholeText)
        
        texts.indices.forEach { index in
            attributedString.addAttributes([.font: customFonts[index]],
                                           range: customTextRanges[index])
            
            attributedString.addAttributes([.foregroundColor: colors[index]],
                                           range: customTextRanges[index])
        }
        
        return attributedString
    }
}
