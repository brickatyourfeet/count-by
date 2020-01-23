//
//  ViewController.swift
//  Count By
//
//  Created by Kyle Braden on 1/20/20.
//  Copyright © 2020 Kyle Braden. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        
        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 90).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        
        collectionView.backgroundColor = .lightGray
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }


}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.12, height: collectionView.frame.width/2.35)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("this is index row: \(indexPath.row)")
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        //cell.backgroundColor = .blue
        
        cell.smallLabel.text = String(indexPath.row + 1)
        cell.smallLabel.sizeToFit()
        print(cell.smallLabel.text)
        return cell
    }
    
    
}

//can have a configureCell function that will do the logic for each one
//could turn CustomCell into a struct?  -- figure it out later -- leave as class for now - will want to maintain state

//function can set small labels by index row + 1
//add by logic can be adding by small label's value when each button is pressed, until over 100, then start over


class CustomCell: UICollectionViewCell {
    
    var smallLabel = UILabel()
    var bigLabel = UILabel()
    
    fileprivate let cellBackground: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "cell-background")
        iv.layer.cornerRadius = 11
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)  //has to be .zero not frame!
        
        contentView.addSubview(cellBackground)
        
        //add labels here
        smallLabel = UILabel(frame: self.frame)
//        smallLabel.textAlignment = .left
        smallLabel.textColor = .white
        cellBackground.addSubview(smallLabel)
//        cellBackground.addSubview(bigLabel)
        
        cellBackground.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        cellBackground.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        cellBackground.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        cellBackground.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
