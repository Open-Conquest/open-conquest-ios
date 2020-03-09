
//
//  MarchSelectorViewContent.swift
//  Open Conquest
//
//  Created by Zach Wild on 1/20/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation
import UIKit

class MarchSelectorContent: UIView {
//    var header: MarchSelectorHeader
//    var tableView: MarchSelectorTable
//    var footer: MarchSelectorFooter
//    
    override init(frame: CGRect) {
//        header = MarchSelectorHeader(frame: .zero)
        
//        var units = [Unit: Int]()
//        let bear = Unit(id: 1, attack: 100, defense: 200, level: 1, name: "Bear")
//        let wizard = Unit(id: 0, attack: 150, defense: 50, level: 1, name: "Wizard")
//        units[wizard] = 10
//        units[bear] = 20
//        let army = Army(units: units)
//        tableView = MarchSelectorTable(frame: .zero, style: .plain, army: army)
//        footer = MarchSelectorFooter(frame: .zero)
//        super.init(frame: frame)
//        addSubview(header)
//        addSubview(tableView)
//        addSubview(footer)
//        tableView.reloadData()
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
//        let height = self.frame.height
//        let width = self.frame.width
//
//        header.autoSetDimension(.height, toSize: height/5)
//        header.autoSetDimension(.width, toSize: width)
//        header.autoPinEdge(.top, to: .top, of: self)
//        tableView.autoPinEdge(.left, to: .left, of: self)
//
//        tableView.autoSetDimension(.height, toSize: 3*height/5)
//        tableView.autoSetDimension(.width, toSize: width)
//        tableView.autoPinEdge(.top, to: .bottom, of: header)
//        tableView.autoPinEdge(.left, to: .left, of: self)
//
//        footer.autoSetDimension(.height, toSize: height/5)
//        footer.autoSetDimension(.width, toSize: width)
//        footer.autoPinEdge(.top, to: .bottom, of: tableView)
//        footer.autoPinEdge(.left, to: .left, of: self)
    }
}
