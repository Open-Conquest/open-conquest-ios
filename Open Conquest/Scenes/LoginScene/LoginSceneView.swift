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
    var gameLabel: UILabel?
    var usernameField: LoginSceneUsernameField?
    var passwordField: LoginScenePasswordField?
    var loginButton: LoginSceneLoginButton?
    var switchModeButton: UIButton?
    var errorMessage: UILabel?
    
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
        background = LoginSceneBackground(frame: .zero)
        gameImage = LoginSceneGameImage()
        gameLabel = UILabel()
        usernameField = LoginSceneUsernameField()
        passwordField = LoginScenePasswordField()
        loginButton = LoginSceneLoginButton()
        switchModeButton = UIButton()
        errorMessage = UILabel()
    }
    
    func addSubviews() {
        addSubview(background!)
        addSubview(gameImage!)
        addSubview(gameLabel!)
        addSubview(usernameField!)
        addSubview(passwordField!)
        addSubview(loginButton!)
        addSubview(switchModeButton!)
        addSubview(errorMessage!)
    }
    
    func setupConstraints() {
        let viewWidth = frame.width
        let viewHeight = frame.height
        
        let backgroundHeight = viewHeight
        let backgroundWidth = viewWidth
        background?.autoSetDimension(.height, toSize: backgroundHeight)
        background?.autoSetDimension(.width, toSize: backgroundWidth)
        background!.backgroundColor = .black
        
        let gameImageHeight = viewWidth/1.5
        let gameImageWidth = viewWidth/1.5
        let gameImageWidthOffset = (viewWidth - gameImageWidth) / 2
        gameImage?.autoSetDimension(.width, toSize: gameImageWidth)
        gameImage?.autoPinEdge(toSuperviewEdge: .right, withInset: gameImageWidthOffset)
        gameImage?.autoPinEdge(toSuperviewEdge: .left, withInset: gameImageWidthOffset)
        gameImage?.autoSetDimension(.height, toSize: gameImageHeight)
        gameImage?.autoPinEdge(toSuperviewEdge: .top, withInset: gameImageHeight/4)
        
//        gameLabel?.autoPinEdge(.top, to: .bottom, of: gameImage, withOffset: 10)
//        gameLabel?.autoPinEdge(toSuperviewEdge: .left, withInset: viewWidth/7)
//        gameLabel?.autoPinEdge(toSuperviewEdge: .left, withInset: viewWidth/7)
//        gameLabel?.text = "Open Conquest"
//        gameLabel?.font = UIFont(name: "Chalkduster", size: 24)
        
        
        let usernameFieldHeight = viewHeight/15
        let usernameFieldWidth = viewWidth - 20
        usernameField?.autoSetDimension(.height, toSize: usernameFieldHeight)
        usernameField?.autoPinEdge(.top, to: .bottom, of: gameImage, withOffset: 50)
        usernameField?.autoPinEdge(toSuperviewEdge: .left, withInset: viewWidth/7)
        usernameField?.autoPinEdge(toSuperviewEdge: .right, withInset: viewWidth/7)
        usernameField?.text = "test_username"
        
        let passwordFieldHeight = viewHeight/15
        let passwordFieldWidth = viewWidth - 20
        passwordField?.autoSetDimension(.height, toSize: passwordFieldHeight)
        passwordField?.autoPinEdge(.top, to: .bottom, of: usernameField, withOffset: 20)
        passwordField?.autoSetDimension(.width, toSize: passwordFieldWidth)
        passwordField?.autoPinEdge(toSuperviewEdge: .left, withInset: viewWidth/7)
        passwordField?.autoPinEdge(toSuperviewEdge: .right, withInset: viewWidth/7)
        passwordField?.text = "test_password"
        
        let loginButtonHeight =  viewHeight/14
        let loginButtonWidth = viewWidth/2
        loginButton?.autoSetDimension(.height, toSize: loginButtonHeight)
        loginButton?.autoPinEdge(.top, to: .bottom, of: passwordField, withOffset: loginButtonHeight-10)
        loginButton?.autoPinEdge(toSuperviewEdge: .left, withInset: viewWidth/7)
        loginButton?.autoPinEdge(toSuperviewEdge: .right, withInset: viewWidth/7)
        loginButton?.layer.cornerRadius = 20;
        loginButton?.layer.masksToBounds = true;
        
        let switchModeButtonHeight = viewHeight/14
        let switchModeButtonWidth = viewWidth
        switchModeButton?.autoSetDimension(.height, toSize: switchModeButtonHeight)
        switchModeButton?.autoPinEdge(.top, to: .bottom, of: loginButton, withOffset: 20)
        switchModeButton?.autoSetDimension(.width, toSize: loginButtonWidth)
        switchModeButton?.autoPinEdge(toSuperviewEdge: .left, withInset: 20)
        switchModeButton?.autoPinEdge(toSuperviewEdge: .right, withInset: 20)
        switchModeButton?.setTitle("Register Account", for: UIControl.State.normal)
        switchModeButton?.titleLabel?.font = UIFont(name: "Chalkduster", size: 18)
        
        let errorMessageWidth = viewWidth
        errorMessage?.autoPinEdge(.top, to: .bottom, of: loginButton, withOffset: 10)
        errorMessage?.autoPinEdge(toSuperviewEdge: .bottom, withInset: 20)
        errorMessage?.autoPinEdge(toSuperviewEdge: .left, withInset: 20)
        errorMessage?.autoPinEdge(toSuperviewEdge: .right, withInset: 20)
        errorMessage?.textAlignment = .center
        errorMessage?.font = UIFont(name: "Chalkduster", size: 18)
        errorMessage?.textColor = UIColor.red
        errorMessage?.lineBreakMode = .byWordWrapping
        errorMessage?.numberOfLines = 0
    }
    
    func switchMode(mode: LoginSceneMode) {
        switch mode {
        case .Login:
            switchModeButton?.setTitle("Register Account", for: UIControl.State.normal)
            loginButton?.setTitle("Login", for: UIControl.State.normal)
        case .Register:
            switchModeButton?.setTitle("Login to Account", for: UIControl.State.normal)
            loginButton?.setTitle("Register", for: UIControl.State.normal)
        }
    }
    
    func setErrorMessage(message: String) {
        errorMessage?.text = message
    }
    
    func getUsername() -> String {
        return usernameField!.text!
    }
    
    func getPassword() -> String {
        return passwordField!.text!
    }

}
