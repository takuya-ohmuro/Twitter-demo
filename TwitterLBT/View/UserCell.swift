//
//  UserCell.swift
//  TwitterLBT
//
//  Created by 大室拓也 on 2018/04/08.
//  Copyright © 2018年 taku9321. All rights reserved.
//

import LBTAComponents
class UserCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet{
            guard let user = datasourceItem as? User  else { return }
            nameLabel.text = user.name
            userNameLabel.text = user.userName
            bioTextView.text = user.bioText
            
            profileImageView.loadImage(urlString:user.profileImageUrl )
        }
    }
    let profileImageView:CachedImageView = {
        let imageView = CachedImageView()
        imageView.image = #imageLiteral(resourceName: "profileImage")
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let nameLabel:UILabel = {
        let label = UILabel()
        label.text = "Bird"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let userNameLabel:UILabel = {
        let label = UILabel()
        label.text = "@bird.cat"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor =  UIColor(r: 130, g: 130, b:130)
        return label
    }()
    
    let bioTextView:UITextView = {
        let TextView = UITextView()
        TextView.text = "cat dog i dont have a pen. aaaaaaawwwwwwwwwww idon't know .takuyatakuytaktakkallakanaaka"
        TextView.font = UIFont.systemFont(ofSize: 15)
        TextView.backgroundColor = .clear
        return TextView
    }()
    
    let followButton:UIButton = {
        
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor.cyan.cgColor
        button.layer.borderWidth = 1
        button.setTitle("Follow", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setImage(#imageLiteral(resourceName: "follow"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 0)
        button.setTitleColor(TwiiterColor, for: .normal)
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        backgroundColor = .white
        
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(userNameLabel)
        addSubview(bioTextView)
        addSubview(followButton)
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant:50)
        
        nameLabel.anchor(profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right:followButton.leftAnchor , topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        
        userNameLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: nameLabel.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        bioTextView.anchor(userNameLabel.bottomAnchor, left: userNameLabel.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: -4, leftConstant: -4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        followButton.anchor(topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 12, leftConstant:0 , bottomConstant: 0, rightConstant: 12, widthConstant: 120, heightConstant: 34)
    }
}
