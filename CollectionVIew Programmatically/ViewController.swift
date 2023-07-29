//
//  ViewController.swift
//  CollectionVIew Programmatically
//
//  Created by DA MAC M1 157 on 2023/07/29.
//

import UIKit

class ViewController: UIViewController  {

     var titles: [String] = []
    var topLabel: UILabel!
    
     var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        self.view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        titles = [ "Hello", "This", "Is", "Carrington", "Practising", "IOS", "Programmatically"]
        topLabel = UILabel()
        topLabel.font = UIFont.systemFont(ofSize: 16)
        topLabel.text  = "Tap the cell"
        topLabel.sizeToFit()
        topLabel.center.x = self.view.center.x
        topLabel.frame.origin.y = 60
        topLabel.textAlignment = .center
        self.view.addSubview(topLabel)
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

extension ViewController:  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        cell.backgroundColor = .white
        // Creating cell's label programmatically
        let label = UILabel()
        label.text = titles[indexPath.row]
        label.font = UIFont.systemFont(ofSize: 18)
        label.sizeToFit()
        label.center = cell.contentView.center
        cell.contentView.addSubview(label)
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //Creating size's coknstant (3 cells horizontally)
        let size = self.view.frame.width / 3
        return CGSize(width: size, height: size)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        
        // Assigning title from the [title array] object
        topLabel.text = titles[indexPath.row]
        topLabel.sizeToFit()
        topLabel.center.x
        = self.view.center.x
        return true
    }
    
    
}
