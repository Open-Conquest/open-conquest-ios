//
//  MarchSelectorTableView.swift
//  Open Conquest
//
//  Created by Zach Wild on 1/18/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import UIKit
import PureLayout

class MarchSelectorTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.delegate = self
        self.dataSource = self
        
        register(UnitSelectorCell.self, forCellReuseIdentifier: "unit")
        
        tableFooterView = UIView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "unit") as! UnitSelectorCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return frame.height / 5
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("Did select cell #\(indexPath.row)")
    }
}

 class UnitSelectorCell: UITableViewCell {
    var unitIcon = UnitIconView(unitType: .wizard)
    var unitName = UnitNameLabel(unitType: .bear)
    var slider = UISlider()
    var unitCount = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(unitIcon)
        contentView.addSubview(unitName)
        unitName.text = "Wizard"
        contentView.addSubview(slider)
        contentView.addSubview(unitCount)
        unitCount.text = "100"
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // setup constraints for subviews
        // 2/6 icon 3/6 slider 1/6 count
        let width = self.frame.width
        let height = self.frame.height
        let widthOffset = 10
        
        let iconHeight = height - 10
        unitIcon.autoSetDimensions(to: CGSize(width: iconHeight, height: iconHeight))
        unitIcon.autoPinEdge(.top, to: .top, of: self, withOffset: 5)
        unitIcon.autoPinEdge(.bottom, to: .bottom, of: self, withOffset: -5)
        
        unitName.autoPinEdge(.left, to: .right, of: unitIcon, withOffset: 10)
        unitName.autoPinEdge(.top, to: .top, of: unitIcon)
        
        let sliderWidth = 2*(width - iconHeight - 10)/3
        slider.autoSetDimension(.width, toSize: CGFloat(sliderWidth))
        slider.autoPinEdge(.left, to: .right, of: unitIcon, withOffset: 10)
        slider.autoPinEdge(.bottom, to: .bottom, of: unitIcon)
        
        let countWidth = (width - iconHeight - 10)/3
        unitCount.autoSetDimension(.width, toSize: countWidth)
        unitCount.autoPinEdge(.left, to: .right, of: slider, withOffset: CGFloat(widthOffset))
        unitCount.autoPinEdge(.top, to: .top, of: slider)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
