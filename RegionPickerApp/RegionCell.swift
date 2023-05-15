//
//  RegionCell.swift
//  RegionPickerApp
//
//  Created by Luka Bugarin on 11.05.2023..
//

import UIKit

class RegionCell: UICollectionViewCell {
    
    @IBOutlet weak var regionView: UIView!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var regionImage: UIImageView!
    @IBOutlet weak var buttonImage: UIImageView!
    
    private var isCellSelected: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        regionView.layer.cornerRadius = 10
        regionView.layer.shadowColor = UIColor.black.cgColor
        regionView.layer.shadowOpacity = 0.2
        regionView.layer.shadowOffset = CGSize(width: 0, height: 2)
        regionView.layer.shadowRadius = 4
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cellTapped))
        regionView.addGestureRecognizer(tapGesture)
        regionView.isUserInteractionEnabled = true
    }
    
    func configure(with regionIndex: Int) {
       
        regionLabel.text = getRegionName(for: regionIndex)
        updateBorder()
    }
    
    @objc  func cellTapped() {
        isCellSelected.toggle()
        updateBorder()
        isSelected.toggle()
    }
    
    private func updateBorder() {
        if isCellSelected {
            regionView.layer.borderWidth = 2
            regionView.layer.borderColor = UIColor.purple.cgColor
        } else {
            regionView.layer.borderWidth = 0
            regionView.layer.borderColor = nil
        }
    }
    
    private func getRegionName(for index: Int) -> String {
        switch index {
        case 1:
            return "MENA"
        case 2:
            return "Japan"
        case 3:
            return "Russia"
        case 4:
            return "SEA"
        case 5:
            return "EU"
        case 6:
            return "China"
        case 7:
            return "NA"
        default:
            return ""
        }
    }
    
    func configure(with regionName: String, isSelected: Bool) {
        regionLabel.text = regionName
        self.isSelected = isSelected
    }
    
}
