import UIKit

class ViewController: UIViewController {
    
    private let background: UIImageView = {
        let background                                       = UIImageView()
        background.image                                     = UIImage(named: "cofe3")
        background.translatesAutoresizingMaskIntoConstraints = false
        background.contentMode                               = .scaleAspectFill
        return background
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.775, green: 0.487, blue: 0.304, alpha: 1.00)
        button.setTitle("Get Started", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        button.layer.cornerRadius = 20
        return button
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.text = "Welcome to our cozy coffee corner, where every cup is a delightful for you."
        return label
    }()
    
    private let label2: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.numberOfLines = 3
        label.font = .systemFont(ofSize: 38, weight: .semibold)
        label.text = "Fall in Love with Coffee in Blissful Delight!"
        return label
    }()

    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            // Hide the navigation bar
            self.navigationController?.setNavigationBarHidden(true, animated: animated)
        }
        
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            // Show the navigation bar for the next view controller
            self.navigationController?.setNavigationBarHidden(false, animated: animated)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        [background, button, label, label2] .forEach {view.addSubview($0)}
        
        //MARK: - Constraints

        background.anchor(top: view.topAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor)
        
        button.anchor(top: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor,padding: .init(top: 0, left: 10, bottom: 20, right: 10),size: .init(width: 0, height: 60))
        
        label.anchor(top: nil, bottom: button.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor,padding: .init(top: 0, left: 15, bottom: 20, right: 15),size: .init(width: 0, height: 60))
        
        label2.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor,padding: .init(top: 20, left: 30, bottom: 0, right: 30),size: .init(width: 0, height: 150))
        
        button.addTarget(self, action: #selector(setButton), for: .touchUpInside)
    }
    
    @objc func setButton() {
        
        let homeVC = HomeViewController()
        let homeNav = UINavigationController(rootViewController: homeVC)
        homeNav.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "Home"), tag: 0)
        homeNav.navigationBar.tintColor = .black
        homeNav.navigationBar.barTintColor = .black
               
        let detailVC = DetailItemViewController()
        let detailNav = UINavigationController(rootViewController: detailVC)
        detailNav.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "Heart"), tag: 1)
        detailNav.navigationBar.tintColor = .black
        detailNav.navigationBar.barTintColor = .black
        detailNav.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        
        let orderVC = OrderViewController()
        orderVC.title = "Order"
        let orderNav = UINavigationController(rootViewController: orderVC)
        orderNav.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "Bag"), tag: 2)
        orderNav.navigationBar.tintColor = .black
        orderNav.navigationBar.barTintColor = .black
        
        let deliveryVC = DeliveryViewController()
        let deliveryNav = UINavigationController(rootViewController: deliveryVC)
        deliveryNav.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "not"), tag: 3)
        deliveryNav.navigationBar.tintColor = .black
        deliveryNav.navigationBar.barTintColor = .black
        
        let tabBar = UITabBarController()
        tabBar.viewControllers = [homeNav, detailNav, orderNav, deliveryNav]
        
        tabBar.tabBar.tintColor =  UIColor(red: 0.775, green: 0.487, blue: 0.304, alpha: 1.00)
        tabBar.tabBar.unselectedItemTintColor = .black
        tabBar.delegate = self
        
        let navController = UINavigationController(rootViewController: tabBar)
                navController.navigationBar.tintColor = UIColor(red: 0.775, green: 0.487, blue: 0.304, alpha: 1.00)
                navController.navigationBar.barTintColor = UIColor.white
        
               guard let window = UIApplication.shared.connectedScenes
                   .filter({ $0.activationState == .foregroundActive })
                   .compactMap({ $0 as? UIWindowScene })
                   .first?.windows
                   .filter({ $0.isKeyWindow }).first else {
                       return
               }
               
               window.rootViewController = tabBar
        

        
    }
}
extension ViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if let navController = tabBarController.navigationController {
            navController.topViewController?.title = viewController.title
        }
    }
    
}
