//
//  SecondViewController.swift
//  CollectionView3
//
//  Created by Alijon Jumayev on 5/26/24.
//

import UIKit

class HomeViewController: UIViewController, UISearchBarDelegate{
    
    let id = "cell"
    let id2 = "ceel2"
    var lastIndexActive: IndexPath?

    private let background: UIImageView = {
        let background                                       = UIImageView()
        background.backgroundColor = .black
        background.translatesAutoresizingMaskIntoConstraints = false
        background.contentMode                               = .scaleAspectFill
        return background
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.text = "Location"
        return label
    }()
    
    private let label2: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.text = "Uzbekistan, Namanagan"
        return label
    }()
    
    private let navigationButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Icon"), for: .normal)
        return button
    }()
    
    private let searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.placeholder = "Search coffee"
        sb.tintColor = .black
        sb.searchBarStyle = .minimal
        
        return sb
    }()
    
    private let searchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Icon 1"), for: .normal)
        button.backgroundColor = UIColor(red: 0.775, green: 0.487, blue: 0.304, alpha: 1.00)
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let promoImage: UIView = {
        let imageView = UIImageView(image: UIImage(named: "Banner"))
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let promoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.backgroundColor = .red
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.text = "Promo"
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        label.textAlignment = .center
        return label
    }()

    private let promoLabel2: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 28, weight: .semibold)
        label.text = "Buy one get one FREE"
        label.layer.masksToBounds = true
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
    }()
    
    private let collection1: UICollectionView = {
        // Create and configure the layout
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 50)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1.00)
        collection.showsHorizontalScrollIndicator = false
        collection.tag = 1
        return collection
    }()
    
    private let collection2: UICollectionView = {
        // Create and configure the layout
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 150, height: 240)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1.00)
        collection.showsVerticalScrollIndicator = false
        collection.tag = 2
        return collection
    }()

    
    private let categoriesCoffee: [String] = ["All Coffee", "Machiato", "Latte", "Americano"]
    
    private var coffeeName: [String] = []
    private var coffeeName2: [String] = []
    private var nameOfProduct2: [String] = []
    private var costOfCoffee: [String] = []
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        collection1.reloadData()
    }
        
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backButtonTitle = ""
        view.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1.00)
        
        searchBar.delegate = self
        collection1.dataSource = self
        collection1.delegate = self
        collection2.dataSource = self
        collection2.delegate = self
   
       
        
        collection1.register(CustomCell.self, forCellWithReuseIdentifier: id)
        collection2.register(CustomCell2.self, forCellWithReuseIdentifier: id2)
        
        promoImage.addSubview(promoLabel)
        promoImage.addSubview(promoLabel2)
        
        [background,label,label2,navigationButton, searchBar, searchButton, promoImage, collection1, collection2].forEach {view.addSubview($0)}
        
        background.anchor(top: view.topAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor,padding: .init(top: 0, left: 0, bottom: 0, right: 0),size: .init(width: 0, height: 280))
        
        label.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: nil, leading: view.leadingAnchor, trailing: nil ,padding: .init(top: 10, left: 20, bottom: 0, right: 0),size: .init(width: 161, height: 20))
        
        label2.anchor(top: label.bottomAnchor, bottom: nil, leading: view.leadingAnchor, trailing: nil,padding: .init(top: 5, left: 20, bottom: 0, right: 0),size: .init(width: 210, height: 20))
        
        navigationButton.anchor(top: label.bottomAnchor, bottom: nil, leading: label2.trailingAnchor, trailing: nil,padding: .init(top: 5, left: 0, bottom: 0, right: 0),size: .init(width: 30, height: 20))
        
        searchBar.anchor(top: navigationButton.bottomAnchor, bottom: nil, leading: view.leadingAnchor, trailing: nil,padding: .init(top: 20, left: 10, bottom: 0, right: 0),size: .init(width: 300, height: 50))
      
        
        searchButton.anchor(top: navigationButton.bottomAnchor, bottom: nil, leading: searchBar.trailingAnchor, trailing: view.trailingAnchor,padding: .init(top: 26, left: 15, bottom: 0, right: 15),size: .init(width: 0, height: 35))
        
        promoImage.anchor(top: searchBar.bottomAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor,padding: .init(top: 20, left: 10, bottom: 0, right: 10),size: .init(width: 0, height: 140))
        
        promoLabel.anchor(top: promoImage.topAnchor, bottom: nil, leading: promoImage.leadingAnchor, trailing: nil,padding: .init(top: 20, left: 30, bottom: 0, right: 0),size: .init(width: 70, height: 26))
        
        promoLabel2.anchor(top: promoLabel.bottomAnchor, bottom: promoImage.bottomAnchor, leading: promoImage.leadingAnchor, trailing: promoImage.trailingAnchor,padding: .init(top: 10, left: 30, bottom: 10, right: 70),size: .init(width: 0, height: 100))
        
        collection1.anchor(top: promoImage.bottomAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor,padding: .init(top: 20, left: 10, bottom: 0, right: 10),size: .init(width: 0, height: 60))
        
        collection2.anchor(top: collection1.bottomAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor,padding: .init(top: 10, left: 10, bottom: 10, right: 10))
        
        coffeeName = ["image1", "image2", "image3", "image4"]
        coffeeName2 = ["Caffe Mocha", "Flat White", "Mocha Fusi", "Caffe Panna"]
        nameOfProduct2 = ["Deep Foam", "Espresso", "Ice hot", "Ice hot"]
        costOfCoffee = ["$4.50","4.23","3.58","3.90"]
    }
    
    

 
}

//MARK: - CollectionView1 DataSource

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView.tag == 1 {
            return categoriesCoffee.count
        } else if collectionView.tag == 2 {
            return coffeeName.count
        }
        return 0
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 1 {
            let cell = collection1.dequeueReusableCell(withReuseIdentifier: id, for: indexPath) as! CustomCell
            
            cell.coffee.text = categoriesCoffee[indexPath.row]
            
            if let lastIndex = lastIndexActive, lastIndex == indexPath {
                    cell.coffee.textColor = .white
                    cell.coffee.backgroundColor = UIColor(red: 0.775, green: 0.487, blue: 0.304, alpha: 1.00)
                } else {
                    cell.coffee.textColor = .black
                    cell.coffee.backgroundColor = .clear
                }
            
            return cell
        } else if collectionView.tag == 2 {
            let cell = collection2.dequeueReusableCell(withReuseIdentifier: id2, for: indexPath) as! CustomCell2
            
            cell.imageView.image = UIImage(named: coffeeName[indexPath.row])
            cell.coffeeNameLabel.text = coffeeName2[indexPath.row]
            cell.namelabel.text = nameOfProduct2[indexPath.row]
            cell.costlabel.text = costOfCoffee[indexPath.row]
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)

        if let lastIndex = self.lastIndexActive, let lastCell = collectionView.cellForItem(at: lastIndex) as? CustomCell {
            lastCell.coffee.textColor = .black
            lastCell.coffee.backgroundColor = .clear
        }

        if self.lastIndexActive != indexPath {
            if let cell = collectionView.cellForItem(at: indexPath) as? CustomCell {
                cell.coffee.textColor = .white
                cell.coffee.backgroundColor = UIColor(red: 0.775, green: 0.487, blue: 0.304, alpha: 1.00)
            }
        }
        
        self.lastIndexActive = indexPath
        
        if collectionView.tag == 1 {
      
            switch indexPath.row {
            case 0:
                coffeeName = ["image1", "image2", "image3", "image4"]
                coffeeName2 = ["Caffe Mocha", "Flat White", "Mocha Fusi", "Caffe Panna"]
                nameOfProduct2 = ["Deep Foam", "Espresso", "Ice hot", "Ice hot"]
                costOfCoffee = ["$4.50","4.23","3.58","3.90"]
                
            case 1:
                coffeeName = ["image1","image2"]
                coffeeName2 = ["Caffe Mocha", "Flat White"]
                nameOfProduct2 = ["Deep Foam", "Espresso",]
                costOfCoffee = ["$4.50","4.23"]
            case 2:
                coffeeName = ["image3"]
                coffeeName2 = ["Mocha Fusi"]
                nameOfProduct2 = ["Ice hot"]
                costOfCoffee = ["3.58"]
            case 3:
                coffeeName = ["image4"]
                coffeeName2 = ["Caffe Panna"]
                nameOfProduct2 = ["Ice hot"]
                costOfCoffee = ["3.90"]
            default:
                coffeeName = []
            }
                  collection2.reloadData()
                  collection2.isHidden = false
                        
           
            
        } else if collectionView.tag == 2 {
            
            let imageCoffee = coffeeName[indexPath.row]
            let coffeeNames = coffeeName2[indexPath.row]
            let coffeeBrandNames = nameOfProduct2[indexPath.row]
            
            let vc = InformationCoffeeViewController()
            vc.coffeeImage = imageCoffee
            vc.coffeeName  = coffeeNames
            vc.coffeeBrandName = coffeeBrandNames
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        
    }


    

    
}



