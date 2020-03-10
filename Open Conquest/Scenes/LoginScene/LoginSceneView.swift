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
    var creditLabel: UILabel?
    var errorMessage: ErrorMessageLabel
    
    override init(frame: CGRect) {
        /* initialize subviews */
        errorMessage = ErrorMessageLabel(frame: .zero)
        
        super.init(frame: frame)
        
        /* add subviews to view */
        addSubview(errorMessage)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        if (frame == .zero) {
            return
        }
        
        errorMessage.text = "something important"
        errorMessage.autoPinEdge(.top, to: .bottom, of: creditLabel, withOffset: 10)
        errorMessage.autoPinEdge(toSuperviewEdge: .left, withInset: 20)
        errorMessage.autoPinEdge(toSuperviewEdge: .right, withInset: 20)
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
        creditLabel = UILabel()
    }
    
    func addSubviews() {
        addSubview(background!)
        addSubview(gameImage!)
        addSubview(gameLabel!)
        addSubview(usernameField!)
        addSubview(passwordField!)
        addSubview(loginButton!)
        addSubview(switchModeButton!)
        addSubview(creditLabel!)
    }
    
    func setupConstraints() {
        let viewWidth = frame.width
        let viewHeight = frame.height
        
        let backgroundHeight = viewHeight
        let backgroundWidth = viewWidth
        background?.autoSetDimension(.height, toSize: backgroundHeight)
        background?.autoSetDimension(.width, toSize: backgroundWidth)
        let color = UIColor(displayP3Red: 207.0/255.0, green: 185.0/255.0, blue: 151.0/255.0, alpha: 1.0)
        background?.backgroundColor = color
        
        let gameImageHeight = viewWidth/1.5
        let gameImageWidth = viewWidth/1.5
        let gameImageWidthOffset = (viewWidth - gameImageWidth) / 2
        gameImage?.autoSetDimension(.width, toSize: gameImageWidth)
        gameImage?.autoPinEdge(toSuperviewEdge: .right, withInset: gameImageWidthOffset)
        gameImage?.autoPinEdge(toSuperviewEdge: .left, withInset: gameImageWidthOffset)
        gameImage?.autoSetDimension(.height, toSize: gameImageHeight)
        gameImage?.autoPinEdge(toSuperviewEdge: .top, withInset: gameImageHeight/4)
        
        let usernameFieldHeight = viewHeight/15
        usernameField?.autoSetDimension(.height, toSize: usernameFieldHeight)
        usernameField?.autoPinEdge(.top, to: .bottom, of: gameImage, withOffset: 10)
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
        loginButton?.autoPinEdge(.top, to: .bottom, of: passwordField, withOffset: 20)
        loginButton?.autoPinEdge(toSuperviewEdge: .left, withInset: viewWidth/7)
        loginButton?.autoPinEdge(toSuperviewEdge: .right, withInset: viewWidth/7)
        loginButton?.layer.borderColor = UIColor.black.cgColor
        loginButton?.layer.borderWidth = 5.0
        loginButton?.layer.masksToBounds = true;
        
        let switchModeButtonHeight = viewHeight/18
        switchModeButton?.autoSetDimension(.height, toSize: switchModeButtonHeight)
        switchModeButton?.autoPinEdge(.top, to: .bottom, of: loginButton, withOffset: 20)
        switchModeButton?.autoSetDimension(.width, toSize: loginButtonWidth)
        switchModeButton?.autoPinEdge(toSuperviewEdge: .left, withInset: viewWidth/5)
        switchModeButton?.autoPinEdge(toSuperviewEdge: .right, withInset: viewWidth/5)
        switchModeButton?.setTitle("Register Account", for: UIControl.State.normal)
        switchModeButton?.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
        switchModeButton?.layer.borderColor = UIColor.black.cgColor
        switchModeButton?.layer.borderWidth = 5.0
        switchModeButton?.layer.masksToBounds = true;
        switchModeButton?.backgroundColor = .gray
        
        let creditLabelWidth = viewWidthi
        creditLabel?.autoPinEdge(.top, to: .bottom, of: loginButton, withOffset: 10)
        creditLabel?.autoPinEdge(toSuperviewEdge: .bottom, withInset: 20)
        creditLabel?.autoPinEdge(toSuperviewEdge: .left, withInset: 20)
        creditLabel?.autoPinEdge(toSuperviewEdge: .right, withInset: 20)
        creditLabel?.textAlignment = .center
        creditLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
        creditLabel?.textColor = UIColor.white
        creditLabel?.lineBreakMode = .byWordWrapping
        creditLabel?.numberOfLines = 0
        creditLabel?.text = "Developed by Zach Wild"
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
        errorMessage.text = message
    }
    
    func getUsername() -> String {
        return usernameField!.text!
    }
    
    func getPassword() -> String {
        return passwordField!.text!
    }

}
