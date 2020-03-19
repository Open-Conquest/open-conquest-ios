//
//  CreatePlayerCard.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/2/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation
import UIKit
import PureLayout

class CreatePlayerCard: UIView {
    let header: UIView
    let worldNameLabel: UILabel
    let worldPlayerCountLabel: UILabel
    let playernameField: UITextField
    let createPlayerButton: CreatePlayerButton
    
    override init(frame: CGRect) {
        header = UIView(frame: .zero)
        worldNameLabel = UILabel()
        worldPlayerCountLabel = UILabel()
        playernameField = UITextField()
        createPlayerButton = CreatePlayerButton(frame: .zero)
        
        super.init(frame: frame)
        
        addSubview(header)
        header.addSubview(worldNameLabel)
        addSubview(worldPlayerCountLabel)
        addSubview(playernameField)
        addSubview(createPlayerButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutIfNeeded()
        
        if (frame == .zero) {
            return
        }
        
        header.autoPinEdge(.top, to: .top, of: self)
        header.autoPinEdge(.left, to: .left, of: self)
        header.autoPinEdge(.right, to: .right, of: self)
        header.autoSetDimension(.height, toSize: frame.height/8)
        header.backgroundColor = .white
        
        worldNameLabel.autoPinEdge(.top, to: .top, of: header)
        worldNameLabel.autoPinEdge(.bottom, to: .bottom, of: header)
        worldNameLabel.autoPinEdge(.left, to: .left, of: header)
        worldNameLabel.autoPinEdge(.right, to: .right, of: header)
        worldNameLabel.autoSetDimension(.width, toSize: frame.width)
        worldNameLabel.text = "America"
        worldNameLabel.textAlignment = .center
        worldNameLabel.font = UIFont(name: "Chalkduster", size: 18)
        
        worldPlayerCountLabel.autoPinEdge(.top, to: .bottom, of: header, withOffset: 10)
        worldPlayerCountLabel.autoPinEdge(.left, to: .left, of: header)
        worldPlayerCountLabel.autoPinEdge(.right, to: .right, of: header)
        worldPlayerCountLabel.autoSetDimension(.width, toSize: frame.width)
        worldPlayerCountLabel.text = "100 Players"
        worldPlayerCountLabel.textAlignment = .center
        worldPlayerCountLabel.font = UIFont(name: "Chalkduster", size: 18)
        
        playernameField.autoPinEdge(.bottom, to: .bottom, of: self, withOffset: -frame.height/2)
        playernameField.autoPinEdge(.left, to: .left, of: self, withOffset: frame.width/12)
        playernameField.autoPinEdge(.right, to: .right, of: self, withOffset: -frame.width/12)
        playernameField.autoSetDimension(.height, toSize:  frame.height/8)
        playernameField.placeholder = "new player's name"
        playernameField.backgroundColor = .white
        
        createPlayerButton.autoPinEdge(.bottom, to: .bottom, of: self, withOffset: -10)
        createPlayerButton.autoPinEdge(.left, to: .left, of: self, withOffset: frame.width/10)
        createPlayerButton.autoPinEdge(.right, to: .right, of: self, withOffset: -frame.width/10)
        createPlayerButton.autoSetDimension(.height, toSize: frame.height/10)
        createPlayerButton.titleLabel?.text = "Create Player"
        createPlayerButton.backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
