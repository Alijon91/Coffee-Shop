//
//  CustomCell.swift
//  CollectionView3
//
//  Created by Alijon Jumayev on 6/5/24.
//

import UIKit


class CustomCell: UICollectionViewCell {
    
    let coffee = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(coffee)
        coffee.textColor = .black
        coffee.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1.50)
        coffee.layer.cornerRadius = 10
        coffee.layer.masksToBounds = true
        coffee.textAlignment = .center
        coffee.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        
        coffee.translatesAutoresizingMaskIntoConstraints = false
        coffee.topAnchor.constraint(equalTo: topAnchor).isActive = true
        coffee.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        coffee.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        coffee.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
