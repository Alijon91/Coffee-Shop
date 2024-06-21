//
//  InformationCoffeeViewController.swift
//  CollectionView3
//
//  Created by Alijon Jumayev on 6/14/24.
//

import UIKit

class InformationCoffeeViewController: UIViewController {
    
    var coffeeImage: String?
    var coffeeName:  String?
    var coffeeBrandName: String?

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.navigationBar.barTintColor = UIColor.black
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        let rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Heart"), style: .plain, target: self, action: #selector(rightBarButtonTapped))
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        
        }
    @objc func rightBarButtonTapped() {
        let vc = DetailItemViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
   
    private let imageView: UIImageView = {
        let imageV = UIImageView()
        imageV.contentMode = .scaleAspectFit
        imageV.layer.cornerRadius = 30
        imageV.clipsToBounds = true
        return imageV
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    private let label2: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .thin)
        return label
    }()
    
    private let delivery: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.19, green: 0.21, blue: 0.25, alpha: 1.00)
        button.setImage(UIImage(named: "d"), for: .normal)
        button.layer.cornerRadius = 10
        return button
        
    }()
    private let bean: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.19, green: 0.21, blue: 0.25, alpha: 1.00)
        button.setImage(UIImage(named: "b"), for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let extra: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.19, green: 0.21, blue: 0.25, alpha: 1.00)
        button.setImage(UIImage(named: "e"), for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let descriptionOfLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.text = "Description"
        return label
    }()
    
    private let descriptionCoffee: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .thin)
        label.numberOfLines = 3
        label.text = "A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the foaming action creates the additional volume. Foam's consistency depends on the milk's fat content. For the most velvety, rich cappuccino, use whole milk."
        return label
    }()
    
    private let showText: UIButton = {
        var button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.setTitleColor(UIColor(red: 0.775, green: 0.487, blue: 0.304, alpha: 1.00), for: .normal)
        button.setTitle("Read More", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        return button
    }()
    
    private let sizeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.text = "Size"
        return label
    }()
    
    private let buttonS: UIButton = {
        var button = UIButton()
        button.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.00)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("S", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let buttonM: UIButton = {
        var button = UIButton()
        button.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.00)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("M", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let buttonL: UIButton = {
        var button = UIButton()
        button.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.00)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("L", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.layer.cornerRadius = 10
        return button
    }()
 
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Detail"
        view.backgroundColor = .white
        [imageView,label,label2,delivery,bean,extra,descriptionOfLabel,descriptionCoffee,showText,sizeLabel,buttonS,buttonM,buttonL].forEach {view.addSubview($0)}
        
        imageView.image = UIImage(named: coffeeImage!)
        label.text = coffeeName!
        label2.text = coffeeBrandName!
        
        
        imageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, padding: .init(top: 10, left: 20, bottom: 0, right: 20),size: .init(width: 0, height: 200))
        
        label.anchor(top: imageView.bottomAnchor, bottom: nil, leading: view.leadingAnchor, trailing: nil,padding: .init(top: 10, left: 20, bottom: 0, right: 0),size: .init(width: 150, height: 40))
        
        label2.anchor(top: label.bottomAnchor, bottom: nil, leading: view.leadingAnchor, trailing: nil,padding: .init(top: 0, left: 20, bottom: 0, right: 0),size: .init(width: 100, height: 20))
        
        delivery.anchor(top: label.topAnchor, bottom: nil, leading: label.trailingAnchor, trailing: nil, padding: .init(top: 10, left: 10, bottom: 0, right: 0), size:  .init(width: 50, height: 50))
        
        bean.anchor(top: label.topAnchor, bottom: nil, leading: delivery.trailingAnchor, trailing: nil, padding: .init(top: 10, left: 20, bottom: 0, right: 0), size:  .init(width: 50, height: 50))
        
        extra.anchor(top: label.topAnchor, bottom: nil, leading: bean.trailingAnchor, trailing: nil, padding: .init(top: 10, left: 20, bottom: 0, right: 0), size:  .init(width: 50, height: 50))
        
        descriptionOfLabel.anchor(top: label2.bottomAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, padding:  .init(top: 10, left: 20, bottom: 0, right: 20), size: .init(width: 0, height: 30))
        
        descriptionCoffee.anchor(top: descriptionOfLabel.bottomAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, padding: .init(top: 10, left: 20, bottom: 0, right: 20))

        showText.anchor(top: descriptionCoffee.bottomAnchor, bottom: nil, leading: nil, trailing: view.trailingAnchor, padding: .init(top: 5, left: 0, bottom: 0, right: 20), size: .init(width: 100, height: 30))
        
        sizeLabel.anchor(top: showText.bottomAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 20), size: .init(width: 0, height: 30))
        
        buttonS.anchor(top: sizeLabel.bottomAnchor, bottom: nil, leading: view.leadingAnchor, trailing: nil, padding: .init(top: 20, left: 20, bottom: 0, right: 0),size: .init(width: 100, height: 40))
        
        buttonM.anchor(top: sizeLabel.bottomAnchor, bottom: nil, leading: buttonS.trailingAnchor, trailing: nil, padding: .init(top: 20, left: 20, bottom: 0, right: 0),size: .init(width: 100, height: 40))
        
        buttonL.anchor(top: sizeLabel.bottomAnchor, bottom: nil, leading: buttonM.trailingAnchor, trailing: view.trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 20),size: .init(width: 100, height: 40))

        showText.addTarget(self, action: #selector(readMoreTapped), for: .touchUpInside)
        
        }

        @objc func readMoreTapped() {
            
           if descriptionCoffee.numberOfLines == 3 {
               descriptionCoffee.numberOfLines = 0
               showText.setTitle("Read Less", for: .normal)
           } else {
               descriptionCoffee.numberOfLines = 3
               showText.setTitle("Read More", for: .normal)
           }
            
           UIView.animate(withDuration: 0.3) {
               self.view.layoutIfNeeded()
           }
        }
}
