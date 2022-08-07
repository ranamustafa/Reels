//
//  BaseViewController.swift
//  Reels
//
//  Created by Rana Mustafa on 06/08/2022.
//

import Foundation
import UIKit

class BaseViewController: UIViewController{
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setNeedsStatusBarAppearanceUpdate()
        view.backgroundColor = UIColor.black
        customizeNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        customizeNavigationBar()
    }
    
    
    //MARK: - Helper Methods
    /*
     This Function is to customize the navigation bar colors and appearance to accord the desin
     */
    func customizeNavigationBar(){
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.black
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        extendedLayoutIncludesOpaqueBars = true
        navigationController?.navigationBar.tintColor = .white // items tint color in navigation bar
        navigationItem.leftItemsSupplementBackButton = true
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        let backImage = UIImage(named: "WhiteBackBTN")
        UINavigationBar.appearance().backIndicatorImage = backImage
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = backImage
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: -1000, vertical: 0), for:UIBarMetrics.default)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.view.backgroundColor = .white
        navigationController?.navigationBar.backgroundColor = UIColor.black
        
        //adding logo to navigation bar
        let logo = UIImage(named: "logo1")
        let imageView = UIImageView(image:logo)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
    }
}
