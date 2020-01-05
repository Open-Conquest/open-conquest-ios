//
//  GameSceneOverlay.swift
//  Open Conquest
//
//  Created by Zach Wild on 5/30/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import UIKit
import SpriteKit
import PureLayout

class GameSceneOverlayView: UIView {

    let screenSize = UIScreen.main.bounds

    var uiNavbar: UIImageView = UIImageView()
    var uiKingdomLabel: UILabel = UILabel()
    var uiGold: UIView = UIView()
    var uiPower: UIView = UIView()
    var uiWood: UIView = UIView()
    var uiStone: UIView = UIView()
    var uiOre: UIView = UIView()

    func setupUI() {
        // setup navbar
        let uiNavbarHeight = screenSize.height/10
        let uiNavbarWidth = screenSize.width
        uiNavbar.image = UIImage(named: "navbar-background")
        uiNavbar.alpha = 0
        uiNavbar.autoSetDimension(.height, toSize: uiNavbarHeight)
        uiNavbar.autoSetDimension(.width, toSize: uiNavbarWidth)
        addSubview(uiNavbar)
        uiNavbar.autoPinEdge(toSuperviewMargin: .top)

        // setup kingdom name
        uiKingdomLabel.text = "Kingdom"
        uiKingdomLabel.textAlignment = NSTextAlignment.center
        uiKingdomLabel.textColor = UIColor.white
        uiKingdomLabel.font = UIFont(name: "Chalkduster", size: 18)
        uiNavbar.addSubview(uiKingdomLabel)
        uiKingdomLabel.autoPinEdge(.top, to: .top, of: uiNavbar, withOffset: 2)
        uiKingdomLabel.autoPinEdge(.left, to: .left, of: uiNavbar)
        uiKingdomLabel.autoPinEdge(.right, to: .right, of: uiNavbar)

        // setup resources
        let resourceBackgroundHeight = uiNavbarHeight/2.2
        let resourceBackgroundWidth = uiNavbarWidth/4.5
        let widthOffset = (resourceBackgroundWidth)/10
        let resourceIconWidth = resourceBackgroundHeight
        let resourceBackgroundNavbarOffset: CGFloat = -5

        // setup gold
        uiGold.autoSetDimension(.height, toSize: resourceBackgroundHeight)
        uiGold.autoSetDimension(.width, toSize: resourceBackgroundWidth)
        addSubview(uiGold)
        uiGold.autoPinEdge(.bottom, to: .bottom, of: uiNavbar, withOffset: resourceBackgroundNavbarOffset)
        uiGold.autoPinEdge(.left, to: .left, of: self, withOffset: widthOffset)
        
        let uiGoldBackground = UIView()
        uiGoldBackground.backgroundColor = .black
        uiGoldBackground.alpha = 0.4
        uiGold.addSubview(uiGoldBackground)
        uiGoldBackground.autoPinEdge(.top, to: .top, of: uiGold)
        uiGoldBackground.autoPinEdge(.bottom, to: .bottom, of: uiGold)
        uiGoldBackground.autoPinEdge(.left, to: .left, of: uiGold)
        uiGoldBackground.autoPinEdge(.right, to: .right, of: uiGold)

        let uiGoldIcon = UIImageView()
        uiGoldIcon.image = UIImage(named: "gold")
        uiGoldIcon.autoSetDimension(.height, toSize: resourceIconWidth)
        uiGoldIcon.autoSetDimension(.width, toSize: resourceIconWidth)
        uiGold.addSubview(uiGoldIcon)
        uiGoldIcon.autoPinEdge(.left, to: .left, of: uiGold, withOffset: 0)

        let uiGoldLabel = UILabel()
        uiGoldLabel.text = "0.34k"
        uiGoldLabel.font = UIFont(name: "Chalkduster", size: 14)
        uiGoldLabel.textColor = UIColor.black
        uiGoldLabel.textAlignment = NSTextAlignment.center
        uiGold.addSubview(uiGoldLabel)
        uiGoldLabel.autoPinEdge(.top, to: .top, of: uiGold, withOffset: 0)
        uiGoldLabel.autoPinEdge(.bottom, to: .bottom, of: uiGold, withOffset: 0)
        uiGoldLabel.autoPinEdge(.left, to: .right, of: uiGoldIcon, withOffset: 0)
        uiGoldLabel.autoPinEdge(.right, to: .right, of: uiGold, withOffset: -resourceBackgroundWidth/15)
        
        // setup power
        uiPower.autoSetDimension(.height, toSize: resourceBackgroundHeight)
        uiPower.autoSetDimension(.width, toSize: resourceBackgroundWidth)
        addSubview(uiPower)
        uiPower.autoPinEdge(.bottom, to: .bottom, of: uiNavbar, withOffset: resourceBackgroundNavbarOffset)
        uiPower.autoPinEdge(.left, to: .right, of: uiGold, withOffset: widthOffset)
        
        let uiPowerBackground = UIView()
        uiPowerBackground.backgroundColor = .black
        uiPowerBackground.alpha = 0.4
        uiPower.addSubview(uiPowerBackground)
        uiPowerBackground.autoPinEdge(.top, to: .top, of: uiPower)
        uiPowerBackground.autoPinEdge(.bottom, to: .bottom, of: uiPower)
        uiPowerBackground.autoPinEdge(.left, to: .left, of: uiPower)
        uiPowerBackground.autoPinEdge(.right, to: .right, of: uiPower)

        let uiPowerIcon = UIImageView()
        uiPowerIcon.image = UIImage(named: "power")
        uiPowerIcon.autoSetDimension(.height, toSize: resourceIconWidth)
        uiPowerIcon.autoSetDimension(.width, toSize: resourceIconWidth)
        uiPower.addSubview(uiPowerIcon)
        uiPowerIcon.autoPinEdge(.left, to: .left, of: uiPower, withOffset: 0)

        let uiPowerLabel = UILabel()
        uiPowerLabel.text = "0.34k"
        uiPowerLabel.font = UIFont(name: "Chalkduster", size: 14)
        uiPowerLabel.textColor = UIColor.black
        uiPowerLabel.textAlignment = NSTextAlignment.center
        uiPower.addSubview(uiPowerLabel)
        uiPowerLabel.autoPinEdge(.top, to: .top, of: uiPower, withOffset: 0)
        uiPowerLabel.autoPinEdge(.bottom, to: .bottom, of: uiPower, withOffset: 0)
        uiPowerLabel.autoPinEdge(.left, to: .right, of: uiPowerIcon, withOffset: 0)
        uiPowerLabel.autoPinEdge(.right, to: .right, of: uiPower, withOffset: -resourceBackgroundWidth/15)
    }
}
