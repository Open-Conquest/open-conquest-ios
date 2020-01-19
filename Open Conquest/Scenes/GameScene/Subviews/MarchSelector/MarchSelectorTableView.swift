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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        autoSetDimensions(to: CGSize(width: superview!.frame.width, height: superview!.frame.height))
        autoPinEdge(.left, to: .left, of: superview!)
        autoPinEdge(.right, to: .right, of: superview!)
        autoPinEdge(.top, to: .top, of: superview!)
        autoPinEdge(.bottom, to: .bottom, of: superview!)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        cell.textLabel!.text = "hello"
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("Did select cell #\(indexPath.row)")
    }
}
