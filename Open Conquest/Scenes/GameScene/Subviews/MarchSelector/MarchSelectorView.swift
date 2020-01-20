//
//  MarchSelectorView.swift
//  Open Conquest
//
//  Created by Zach Wild on 1/17/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation
import UIKit
import PureLayout

class MarchSelectorView: UIView {
    var header: MarchSelectorHeader
    var tableView: MarchSelectorTable
    var footer: MarchSelectorFooter
    
    override init(frame: CGRect) {
        header = MarchSelectorHeader(frame: .zero)
        tableView = MarchSelectorTable()
        footer = MarchSelectorFooter(frame: .zero)
        
        super.init(frame: frame)
        
        addSubview(header)
        addSubview(footer)
        addSubview(tableView)
        tableView.reloadData()
        
        setupGestures()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.updateConstraints()
        
        let height = self.frame.height
        let width = self.frame.width
        
        header.autoSetDimension(.height, toSize: height/5)
        header.autoSetDimension(.width, toSize: width)
        header.autoPinEdge(.top, to: .top, of: self)
        tableView.autoPinEdge(.left, to: .left, of: self)
        
        tableView.autoSetDimension(.height, toSize: 3*height/5)
        tableView.autoSetDimension(.width, toSize: width)
        tableView.autoPinEdge(.top, to: .bottom, of: header)
        tableView.autoPinEdge(.left, to: .left, of: self)
        
        footer.autoSetDimension(.height, toSize: height/5)
        footer.autoSetDimension(.width, toSize: width)
        footer.autoPinEdge(.top, to: .bottom, of: tableView)
        footer.autoPinEdge(.left, to: .left, of: self)
    }
    
    func setupGestures() {
        let tapSelector = #selector(self.handleTap(tapGesture:))
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: tapSelector)
        tapGestureRecognizer.numberOfTapsRequired = 1
        addGestureRecognizer(tapGestureRecognizer)
        
        isUserInteractionEnabled = true
    }
    
    @objc func handleTap(tapGesture: UITapGestureRecognizer) {
        if tapGesture.state != .ended {
            return
        }
        
        hide()
    }
    
    func hide() {
        let animation = CATransition()
        animation.type = .fade
        animation.duration = 0.4
        self.layer.add(animation, forKey: nil)
        
        self.isHidden = true
    }
    
    func show() {
        let animation = CATransition()
        animation.type = .reveal
        animation.duration = 0.4
        self.layer.add(animation, forKey: nil)
        
        self.isHidden = false
    }
}
