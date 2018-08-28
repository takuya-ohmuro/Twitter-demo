//
//  Cells.swift
//  TwitterLBT
//
//  Created by 大室拓也 on 2018/04/06.
//  Copyright © 2018年 taku9321. All rights reserved.
//

import LBTAComponents

let TwiiterColor = UIColor(r: 61, g: 167, b: 244)

class UserFooter: DatasourceCell {
    let Textlabel:UILabel = {
        let label = UILabel()
        label.text = "show me more"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = TwiiterColor
        return label
    }()
    
    
    override func setupViews() {
        super.setupViews()
        
        let whiteBackgroundView = UIView()
        whiteBackgroundView.backgroundColor = .white

        addSubview(whiteBackgroundView)
        addSubview(Textlabel)
        
        whiteBackgroundView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 14, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        Textlabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 14, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
    }
}

class UserHeader: DatasourceCell {
    let Textlabel:UILabel = {
        let label = UILabel()
        label.text = "WHO TO FOllOW"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .white
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        addSubview(Textlabel)
        Textlabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}


