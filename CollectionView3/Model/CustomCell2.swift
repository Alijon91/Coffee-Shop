//
//  CostumCell2.swift
//  CollectionView3
//
//  Created by Alijon Jumayev on 6/8/24.
//

import UIKit


class CustomCell2: UICollectionViewCell {
    
    let view = UIView()
    
    let imageView: UIImageView = {
            let iv = UIImageView()
            iv.contentMode = .scaleAspectFill
            iv.clipsToBounds = true
        iv.layer.cornerRadius = 10
            return iv
        }()
    let coffeeNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    let namelabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .thin)
        return label
    }()
   let costlabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
     let addButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.775, green: 0.487, blue: 0.304, alpha: 1.00)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .white
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(view)
        [imageView,costlabel,namelabel,coffeeNameLabel,addButton].forEach {view.addSubview($0)}
       
  
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        imageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor,padding: .init(top: 5, left: 5, bottom: 0, right: 5),size: .init(width: 0, height: 130))
        coffeeNameLabel.anchor(top: imageView.bottomAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor,padding: .init(top: 10, left: 5, bottom: 0, right: 5),size: .init(width: 0, height: 20))
        
        namelabel.anchor(top: coffeeNameLabel.bottomAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor,padding: .init(top: 10, left: 5, bottom: 0, right: 5),size: .init(width: 0, height: 10))
        costlabel.anchor(top: namelabel.bottomAnchor, bottom: nil, leading: view.leadingAnchor, trailing: nil ,padding: .init(top: 10, left: 5, bottom: 0, right: 0),size:  .init(width: 100, height: 20))
        addButton.anchor(top: namelabel.bottomAnchor, bottom: nil, leading: costlabel.trailingAnchor, trailing: view.trailingAnchor,padding: .init(top: 5, left: 5, bottom: 0, right: 5), size: .init(width: 0, height: 30))
        
        addButton.addTarget(self, action: #selector(setButton), for: .touchUpInside)
    }
    @objc func setButton() {
        print("salom")
       
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
