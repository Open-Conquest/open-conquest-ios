///Users/mrwiki/Projects/open-conquest/open-conquest-ios/Open Conquest.xcodeproj
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
    
    var goldTicker = ResourceTickerView()
    var powerTicker = ResourceTickerView()

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
        let resourceBackgroundWidth = uiNavbarWidth/4
        let widthOffset = (resourceBackgroundWidth)/10
        let resourceBackgroundNavbarOffset: CGFloat = -5
        
        goldTicker.autoSetDimension(.height, toSize: resourceBackgroundHeight)
        goldTicker.autoSetDimension(.width, toSize: resourceBackgroundWidth)
        addSubview(goldTicker)
        goldTicker.autoPinEdge(.bottom, to: .bottom, of: uiNavbar, withOffset: resourceBackgroundNavbarOffset)
        goldTicker.autoPinEdge(.left, to: .left, of: self, withOffset: widthOffset)
        goldTicker.setupUI(resource: ResourceEnum.gold)
        
        powerTicker.autoSetDimension(.height, toSize: resourceBackgroundHeight)
        powerTicker.autoSetDimension(.width, toSize: resourceBackgroundWidth)
        addSubview(powerTicker)
        powerTicker.autoPinEdge(.top, to: .bottom, of: goldTicker, withOffset: resourceBackgroundNavbarOffset)
        powerTicker.autoPinEdge(.left, to: .left, of: self, withOffset: widthOffset)
        powerTicker.setupUI(resource: ResourceEnum.power)
    }
}
