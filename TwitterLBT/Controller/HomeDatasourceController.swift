//
//  HomeDatasourceController.swift
//  TwitterLBT
//
//  Created by 大室拓也 on 2018/04/06.
//  Copyright © 2018年 taku9321. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDatasourceController: DatasourceController{
    let errorMessageLabel:UILabel = {
        let label = UILabel()
        label.text = "Apologies Something went wrong.Please try agein later...."
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(errorMessageLabel)
        errorMessageLabel.fillSuperview()//LBTA method call
        
        setupNavigationBarItems()
        
        collectionView?.backgroundColor = UIColor(r: 232, g: 236, b: 241)
        
        //fetchHomeFeed()
        
        Service.sharedInstance.fetchHomeFeed{(homeDatasource,err)in
            if let err = err {
                self.errorMessageLabel.isHidden = false
                if let apiError = err as? APIError<Service.JsonError> {
                    if apiError.response?.statusCode != 200 {
                        self.errorMessageLabel.text = "Status code was not 200"
                        
                    }
                }
            }
            self.datasource = homeDatasource
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {
          
            guard let user = self.datasource?.item(indexPath) as? User else { return .zero }
                
                let estimatedFrame = estimatedHeightForText(user.bioText)
                return CGSize(width: view.frame.width, height: estimatedFrame + 66)
        } else if indexPath.section == 1 {
            guard let tweet = datasource?.item(indexPath) as? Tweet else { return .zero }
           
            let estimatedFrame = estimatedHeightForText(tweet.message)
            return CGSize(width: view.frame.width, height: estimatedFrame + 74)
        }
        
        return CGSize(width: view.frame.width, height: 200)
    }
    
    private  func estimatedHeightForText(_ text:String) -> CGFloat {
        let approximatedWidthOfBioTextView = view.frame.width - 12 - 50 - 12 - 2
        let size = CGSize(width: approximatedWidthOfBioTextView, height: 1000)
        let attributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]
        
        let estimatedFrame = NSString(string:text).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        return estimatedFrame.height
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 64)
    }
}

