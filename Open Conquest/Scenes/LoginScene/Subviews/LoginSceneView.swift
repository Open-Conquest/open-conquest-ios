//
//  LoginSceneView.swift
//  Open Conquest
//
//  Created by Zach Wild on 5/28/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import UIKit
import PureLayout

class LoginSceneView: UIView {
    
    var background: LoginSceneBackground?
    var gameImage: LoginSceneGameImage?
    var usernameField: LoginSceneUsernameField?
    var passwordField: LoginScenePasswordField?
    var loginButton: LoginSceneLoginButton?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        initSubviews()
        addSubviews()
        setupConstraints()
    }
    
    func initSubviews() {
        background = LoginSceneBackground()
        gameImage = LoginSceneGameImage()
        usernameField = LoginSceneUsernameField()
        passwordField = LoginScenePasswordField()
        loginButton = LoginSceneLoginButton()
    }
    
    func addSubviews() {
        addSubview(background!)
        addSubview(gameImage!)
        addSubview(usernameField!)
        addSubview(passwordField!)
        addSubview(loginButton!)
    }
    
    func setupConstraints() {
        let viewWidth = frame.width
        let viewHeight = frame.height
        
        let backgroundHeight = viewHeight
        let backgroundWidth = viewWidth
        background?.autoSetDimension(.height, toSize: backgroundHeight)
        background?.autoSetDimension(.width, toSize: backgroundWidth)
        
        let gameImageHeight = viewWidth/3
        let gameImageWidth = viewWidth/3
        gameImage?.autoSetDimension(.width, toSize: gameImageWidth)
        gameImage?.autoPinEdge(toSuperviewEdge: .right, withInset: viewWidth/3)
        gameImage?.autoPinEdge(toSuperviewEdge: .left, withInset: viewWidth/3)
        gameImage?.autoSetDimension(.height, toSize: gameImageHeight)
        gameImage?.autoPinEdge(toSuperviewEdge: .top, withInset: gameImageHeight)
        
        let usernameFieldHeight = viewHeight/15
        let usernameFieldWidth = viewWidth - 20
        usernameField?.autoSetDimension(.height, toSize: usernameFieldHeight)
        usernameField?.autoPinEdge(.top, to: .bottom, of: gameImage, withOffset: 20)
        usernameField?.autoSetDimension(.width, toSize: usernameFieldWidth)
        usernameField?.autoPinEdge(toSuperviewEdge: .left, withInset: 10)
        usernameField?.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
        
        let passwordFieldHeight = viewHeight/15
        let passwordFieldWidth = viewWidth - 20
        passwordField?.autoSetDimension(.height, toSize: passwordFieldHeight)
        passwordField?.autoPinEdge(.top, to: .bottom, of: usernameField, withOffset: 20)
        passwordField?.autoSetDimension(.width, toSize: passwordFieldWidth)
        passwordField?.autoPinEdge(toSuperviewEdge: .left, withInset: 10)
        passwordField?.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
        
        let loginButtonHeight =  viewHeight/14
        let loginButtonWidth = viewWidth - 40
        loginButton?.autoSetDimension(.height, toSize: loginButtonHeight)
        loginButton?.autoPinEdge(.top, to: .bottom, of: passwordField, withOffset: 20)
        loginButton?.autoSetDimension(.width, toSize: loginButtonWidth)
        loginButton?.autoPinEdge(toSuperviewEdge: .left, withInset: 20)
        loginButton?.autoPinEdge(toSuperviewEdge: .right, withInset: 20)
    }
    
    func getUsername() -> String {
        return usernameField!.text!
    }
    
    func getPassword() -> String {
        return passwordField!.text!
    }

}
