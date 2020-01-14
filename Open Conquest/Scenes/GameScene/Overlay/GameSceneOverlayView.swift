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
    
    var goldTicker = ResourceTickerView()
    var powerTicker = ResourceTickerView()
    
    var navbar = NavbarView()

    /**
     Setup constraints for subviews.
     */
    func setupUI() {
        // determining offsets and sizes based on screen size
        let resourceBackgroundHeight = screenSize.height/22.0
        let resourceBackgroundWidth = screenSize.width/4
        let resourceHeightOffset = resourceBackgroundHeight
        let resourceWidthOffset = (resourceBackgroundWidth)/10
        let resourceBackgroundNavbarOffset: CGFloat = -5

        // setup constraints for resource tickers
        goldTicker.autoSetDimension(.height, toSize: resourceBackgroundHeight)
        goldTicker.autoSetDimension(.width, toSize: resourceBackgroundWidth)
        addSubview(goldTicker)
        goldTicker.autoPinEdge(.top, to: .top, of: self, withOffset: resourceHeightOffset)
        goldTicker.autoPinEdge(.left, to: .left, of: self, withOffset: resourceWidthOffset)
        goldTicker.setupUI(resource: ResourceEnum.gold)
        
        powerTicker.autoSetDimension(.height, toSize: resourceBackgroundHeight)
        powerTicker.autoSetDimension(.width, toSize: resourceBackgroundWidth)
        addSubview(powerTicker)
        powerTicker.autoPinEdge(.top, to: .bottom, of: goldTicker, withOffset: resourceBackgroundNavbarOffset)
        powerTicker.autoPinEdge(.left, to: .left, of: self, withOffset: resourceWidthOffset)
        powerTicker.setupUI(resource: ResourceEnum.power)
        
        // setup constraints for navbar
        let navbarHeight = screenSize.height / 11
        let navbarWidth = screenSize.width
        navbar.autoSetDimension(.width, toSize: navbarWidth)
        navbar.autoSetDimension(.height, toSize: navbarHeight)
        addSubview(navbar)
        navbar.autoPinEdge(.left, to: .left, of: self)
        navbar.autoPinEdge(.right, to: .right, of: self)
        navbar.autoPinEdge(.bottom, to: .bottom, of: self)
        navbar.setupUI()
    }
}
