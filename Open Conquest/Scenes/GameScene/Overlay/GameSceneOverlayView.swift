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
    var uiWood: UIView = UIView()
    var uiStone: UIView = UIView()
    var uiOre: UIView = UIView()

    func setupUI() {
           // setup navbar
           let uiNavbarHeight = screenSize.height/10
           let uiNavbarWidth = screenSize.width
           uiNavbar.image = UIImage(named: "navbar-background")
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
           uiGold.backgroundColor = UIColor.white
           uiGold.autoSetDimension(.height, toSize: resourceBackgroundHeight)
           uiGold.autoSetDimension(.width, toSize: resourceBackgroundWidth)
           addSubview(uiGold)
           uiGold.autoPinEdge(.bottom, to: .bottom, of: uiNavbar, withOffset: resourceBackgroundNavbarOffset)
           uiGold.autoPinEdge(.left, to: .left, of: self, withOffset: widthOffset)

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

           // setup wood
           uiWood.backgroundColor = UIColor.white
           uiWood.autoSetDimension(.height, toSize: resourceBackgroundHeight)
           uiWood.autoSetDimension(.width, toSize: resourceBackgroundWidth)
           addSubview(uiWood)
           uiWood.autoPinEdge(.bottom, to: .bottom, of: uiNavbar, withOffset: resourceBackgroundNavbarOffset)
           uiWood.autoPinEdge(.left, to: .right, of: uiGold, withOffset: widthOffset)

           let uiWoodIcon = UIImageView()
           uiWoodIcon.image = UIImage(named: "wood")
           uiWoodIcon.autoSetDimension(.height, toSize: resourceIconWidth)
           uiWoodIcon.autoSetDimension(.width, toSize: resourceIconWidth)
           uiWood.addSubview(uiWoodIcon)
           uiWoodIcon.autoPinEdge(.left, to: .left, of: uiWood, withOffset: 0)

           let uiWoodLabel = UILabel()
           uiWoodLabel.text = "0.34k"
           uiWoodLabel.font = UIFont(name: "Chalkduster", size: 14)
           uiWoodLabel.textColor = UIColor.black
           uiWoodLabel.textAlignment = NSTextAlignment.center
           uiWood.addSubview(uiWoodLabel)
           uiWoodLabel.autoPinEdge(.top, to: .top, of: uiWood, withOffset: 0)
           uiWoodLabel.autoPinEdge(.bottom, to: .bottom, of: uiWood, withOffset: 0)
           uiWoodLabel.autoPinEdge(.left, to: .right, of: uiWoodIcon, withOffset: 0)
           uiWoodLabel.autoPinEdge(.right, to: .right, of: uiWood, withOffset: -resourceBackgroundWidth/15)

           // setup stone
           uiStone.backgroundColor = UIColor.white
           uiStone.autoSetDimension(.height, toSize: resourceBackgroundHeight)
           uiStone.autoSetDimension(.width, toSize: resourceBackgroundWidth)
           addSubview(uiStone)
           uiStone.autoPinEdge(.bottom, to: .bottom, of: uiNavbar, withOffset: resourceBackgroundNavbarOffset)
           uiStone.autoPinEdge(.left, to: .right, of: uiWood, withOffset: widthOffset)

           let uiStoneIcon = UIImageView()
           uiStoneIcon.image = UIImage(named: "stone")
           uiStoneIcon.autoSetDimension(.height, toSize: resourceIconWidth)
           uiStoneIcon.autoSetDimension(.width, toSize: resourceIconWidth)
           uiStone.addSubview(uiStoneIcon)
           uiStoneIcon.autoPinEdge(.left, to: .left, of: uiStone, withOffset: 0)

           let uiStoneLabel = UILabel()
           uiStoneLabel.text = "0.34k"
           uiStoneLabel.font = UIFont(name: "Chalkduster", size: 14)
           uiStoneLabel.textColor = UIColor.black
           uiStoneLabel.textAlignment = NSTextAlignment.center
           uiStone.addSubview(uiStoneLabel)
           uiStoneLabel.autoPinEdge(.top, to: .top, of: uiStone, withOffset: 0)
           uiStoneLabel.autoPinEdge(.bottom, to: .bottom, of: uiStone, withOffset: 0)
           uiStoneLabel.autoPinEdge(.left, to: .right, of: uiStoneIcon, withOffset: 0)
           uiStoneLabel.autoPinEdge(.right, to: .right, of: uiStone, withOffset: -resourceBackgroundWidth/15)

           // setup ore
           uiOre.backgroundColor = UIColor.white
           uiOre.autoSetDimension(.height, toSize: resourceBackgroundHeight)
           uiOre.autoSetDimension(.width, toSize: resourceBackgroundWidth)
           addSubview(uiOre)
           uiOre.autoPinEdge(.bottom, to: .bottom, of: uiNavbar, withOffset: resourceBackgroundNavbarOffset)
           uiOre.autoPinEdge(.left, to: .right, of: uiStone, withOffset: widthOffset)

           let uiOreIcon = UIImageView()
           uiOreIcon.image = UIImage(named: "ore")
           uiOreIcon.autoSetDimension(.height, toSize: resourceIconWidth)
           uiOreIcon.autoSetDimension(.width, toSize: resourceIconWidth)
           uiOre.addSubview(uiOreIcon)
           uiOreIcon.autoPinEdge(.left, to: .left, of: uiOre, withOffset: 0)

           let uiOreLabel = UILabel()
           uiOreLabel.text = "0.34k"
           uiOreLabel.font = UIFont(name: "Chalkduster", size: 14)
           uiOreLabel.textColor = UIColor.black
           uiOreLabel.textAlignment = NSTextAlignment.center
           uiOre.addSubview(uiOreLabel)
           uiOreLabel.autoPinEdge(.top, to: .top, of: uiOre, withOffset: 0)
           uiOreLabel.autoPinEdge(.bottom, to: .bottom, of: uiOre, withOffset: 0)
           uiOreLabel.autoPinEdge(.left, to: .right, of: uiOreIcon, withOffset: 0)
           uiOreLabel.autoPinEdge(.right, to: .right, of: uiOre, withOffset: -resourceBackgroundWidth/15)
       }
}
