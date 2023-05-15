//
//  ButtonCell.swift
//  RegionPickerApp
//
//  Created by Luka Bugarin on 15.05.2023..
//

import UIKit

class ButtonCell: UICollectionViewCell {
    
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var buttonLabel: UILabel!
    
    var isEnabled: Bool = false {
        didSet {
            updateButtonState()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        buttonView.layer.cornerRadius = 10
        buttonView.layer.shadowColor = UIColor.black.cgColor
        buttonView.layer.shadowOpacity = 0.2
        buttonView.layer.shadowOffset = CGSize(width: 0, height: 2)
        buttonView.layer.shadowRadius = 4
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(buttonTapped))
        addGestureRecognizer(tapGestureRecognizer)
        
        updateButtonState()
    }
    
    @objc private func buttonTapped() {
        print("Button cell tapped!")
    }
    
    private func updateButtonState() {
        buttonView.backgroundColor = isEnabled ? .purple : .gray
        buttonView.isUserInteractionEnabled = isEnabled
    }
    
    func configure() {
        buttonLabel.text = "Submit"
    }
}






