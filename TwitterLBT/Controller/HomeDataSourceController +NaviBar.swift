//
//  HomeDataSourceController +NaviBar.swift
//  TwitterLBT
//
//  Created by 大室拓也 on 2018/04/08.
//  Copyright © 2018年 taku9321. All rights reserved.
//

import UIKit

extension HomeDatasourceController {
   
    func setupNavigationBarItems() {
        setupRemainingNavItem()
        setupRightNavItem()
        setupLeftNavItem()
    }
    private func setupRemainingNavItem(){
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "title_icon"))
        titleImageView.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default )
        
        let navBarSeparatoView = UIView()
        navBarSeparatoView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
       view.addSubview(navBarSeparatoView)
        navBarSeparatoView.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
    }
    
    private func setupRightNavItem() {
        let followButton = UIButton(type: .system)
        followButton.setImage(#imageLiteral(resourceName: "follow").withRenderingMode(.alwaysOriginal), for: .normal)
        followButton.frame = CGRect(x: 0, y: 0, width: 28, height: 28)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView:followButton )
    }
    
    private func setupLeftNavItem() {
        let searchButton = UIButton(type: .system)
        searchButton.setImage(#imageLiteral(resourceName: "search").withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 28, height: 28)
        
        let composeButton = UIButton(type: .system)
        composeButton.setImage(#imageLiteral(resourceName: "compose").withRenderingMode(.alwaysOriginal),  for: .normal)
        composeButton.frame = CGRect(x: 0, y: 0, width: 28, height: 28)
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView:composeButton),UIBarButtonItem(customView: searchButton)]
    }
    
}

