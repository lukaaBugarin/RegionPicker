//
//  ViewController.swift
//  RegionPickerApp
//
//  Created by Luka Bugarin on 11.05.2023..
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView?
    private let regions = ["MENA", "Japan", "Russia", "SEA", "EU", "China", "NA"]
    private var selectedRegionIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.delegate = self
        collectionView?.dataSource = self
    }
    
    // MARK: - UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "headerCell", for: indexPath) as! HeaderCell
            cell.configure()
            return cell
        } else if indexPath.item == 7 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "buttonCell", for: indexPath) as! ButtonCell
            cell.configure()
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "regionCell", for: indexPath) as! RegionCell
            let regionIndex = indexPath.item - 1
            cell.configure(with: regions[regionIndex], isSelected: regionIndex == selectedRegionIndex)
            return cell
        }
    }
    
    
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item != 0 && indexPath.item != 7 {
            let regionIndex = indexPath.item - 1
            selectedRegionIndex = regionIndex
            collectionView.reloadItems(at: [indexPath, IndexPath(item: 7, section: 0)]) 
        }
    }
    
}
