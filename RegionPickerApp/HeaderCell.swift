//
//  HeaderCell.swift
//  RegionPickerApp
//
//  Created by Luka Bugarin on 11.05.2023..
//

import UIKit

class HeaderCell: UICollectionViewCell {
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        headerView.layer.cornerRadius = 10
        headerView.layer.shadowColor = UIColor.black.cgColor
        headerView.layer.shadowOpacity = 0.2
        headerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        headerView.layer.shadowRadius = 4

    }
    
    func configure() {


        
        headerLabel.text = "PlayHera"
        descriptionLabel.text = "Please choose a preferable region to optimize app parameters for the best gaming experience."
    }
}

