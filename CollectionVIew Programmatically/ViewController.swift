//
//  ViewController.swift
//  CollectionVIew Programmatically
//
//  Created by DA MAC M1 157 on 2023/07/29.
//

import UIKit

class ViewController: UIViewController {
    
     var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        self.view.addSubview(collectionView)
    }
    
    func configureCollectionView() {
        
       let frame = CGRect(x: 0, y: 60, width: self.view.frame.width, height: self.view.frame.height - 120)
        
       let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .blue
        collectionView.isPrefetchingEnabled = false
        collectionView.allowsSelection = true
        collectionView.allowsMultipleSelection  = true
    }

}

