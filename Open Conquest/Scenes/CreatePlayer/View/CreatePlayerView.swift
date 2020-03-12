//
//  CreatePlayerView.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/2/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation
import UIKit
import PureLayout

class CreatePlayerView: UIView {
    var background: CreatePlayerBackground
    var header: CreatePlayerHeader
    var pickerCard: CreatePlayerCard
    
    override init(frame: CGRect) {
        
        background = CreatePlayerBackground(frame: .zero)
        background.backgroundColor = .red
        
        header = CreatePlayerHeader(frame: .zero)
        header.backgroundColor = .blue
        
        pickerCard = CreatePlayerCard(frame: frame)
        pickerCard.backgroundColor = .green
        
        super.init(frame: frame)
        
        addSubview(background)
        addSubview(header)
        addSubview(pickerCard)
        
        setupGestures()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if (frame == .zero) {
            return
        }
        
        background.autoPinEdge(.left, to: .left, of: self)
        background.autoPinEdge(.right, to: .right, of: self)
        background.autoPinEdge(.top, to: .top, of: self)
        background.autoPinEdge(.bottom, to: .bottom, of: self)
        
        let headerHeight = frame.height/11
        header.autoPinEdge(.left, to: .left, of: self)
        header.autoPinEdge(.right, to: .right, of: self)
        header.autoPinEdge(.top, to: .top, of: self)
        header.autoSetDimension(.height, toSize: headerHeight)
        
        let heightOffset = (frame.height - headerHeight)/12
        let widthOffset = frame.width / 12
        pickerCard.autoPinEdge(.left, to: .left, of: self, withOffset: widthOffset)
        pickerCard.autoPinEdge(.right, to: .right, of: self, withOffset: -widthOffset)
        pickerCard.autoPinEdge(.top, to: .bottom, of: header, withOffset: heightOffset)
        pickerCard.autoPinEdge(.bottom, to: .bottom, of: self, withOffset: -heightOffset)
        pickerCard.layer.cornerRadius = 10;
        pickerCard.layer.masksToBounds = true;
    }
    
    func setupGestures() {
        // add pan gesture to override any in lower layers
        let panSelector = #selector(self.handlePan(panGesture:))
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: panSelector)
        self.addGestureRecognizer(panGestureRecognizer)
        
        let tapSelector = #selector(self.handleTap(tapGesture:))
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: tapSelector)
        tapGestureRecognizer.numberOfTapsRequired = 1
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func handlePan(panGesture: UIPanGestureRecognizer) {
        // do nothing
    }
    
    @objc func handleTap(tapGesture: UITapGestureRecognizer) {
        if tapGesture.state != .ended {
            return
        }
        
        let tapLocation = tapGesture.location(in: self)
//
//        // if invisible background was touched -> hide self
//        let view = hitTest(tapLocation, with: .none)
//        if (view == background) {
//            hide()
//        }
    }
}
