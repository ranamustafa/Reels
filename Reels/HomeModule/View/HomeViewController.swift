//
//  ViewController.swift
//  Reels
//
//  Created by Rana Mustafa on 05/08/2022.
//

import UIKit

class HomeViewController: BaseViewController {
    
    var homeViewModel: HomeViewModel?
    var vedios: [Item]?{
        didSet{
            print("Items are::: \(self.vedios) ")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Reels"
        self.fetchPlaylist()
    }


}


extension HomeViewController{
    
    func fetchPlaylist() {
        NetworkManager.shared.fetchPlayList{ [weak self] playlistModelResp, error  in
            guard let strongSelf = self else { return }
//            MBProgressHUD.hide(for: strongSelf.view, animated: true)
            guard let response = playlistModelResp else {
//                strongSelf.showAlert("Error", massege: error ?? "", context: strongSelf)
                print("ERROR::: \(error)")
                return
            }
            strongSelf.vedios = response.items



        }
        
        
        
     
    }
    
}
