//
//  LoadingSceneView.swift
//  Open Conquest
//
//  Created by Zach Wild on 10/31/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//
import UIKit
import PureLayout

class LoadingSceneView: UIView {
    
    var background: LoadingSceneBackground?
    var progressBar: LoadingSceneProgressBar?
    var progressLabel: LoadingSceneProgressLabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        initSubviews()
        addSubviews()
        setupConstraints()
    }
    
    func initSubviews() {
        background = LoadingSceneBackground(frame: frame)
        progressBar = LoadingSceneProgressBar()
        progressLabel = LoadingSceneProgressLabel()
    }
    
    func addSubviews() {
        addSubview(background!)
        addSubview(progressBar!)
        addSubview(progressLabel!)
    }
    
    func setupConstraints() {
        let viewWidth = frame.width
        let viewHeight = frame.height
        
        let backgroundHeight = viewHeight
        let backgroundWidth = viewWidth
        background?.autoSetDimension(.height, toSize: backgroundHeight)
        background?.autoSetDimension(.width, toSize: backgroundWidth)
        
        let progressBarHeight = viewHeight / 10
        let progressBarWidth = viewWidth
        progressBar?.autoSetDimension(.height, toSize: progressBarHeight)
        progressBar?.autoSetDimension(.width, toSize: progressBarWidth)
        progressBar?.autoCenterInSuperview()
        
        // this logic should go somewhere else but ignore this for now TODO
        progressLabel!.textColor = UIColor.white
        let progressLabelHeight = progressBarHeight
        let progressLabelWidth = progressBarWidth / 2
        progressLabel?.autoSetDimension(.height, toSize: progressLabelHeight)
        progressLabel?.autoSetDimension(.width, toSize: progressLabelWidth)
        progressLabel?.autoPinEdge(.top, to: .bottom, of: progressBar!)
        progressLabel?.autoPinEdge(.left, to: .left, of: progressBar!)
        progressLabel?.autoPinEdge(.right, to: .right, of: progressBar!)
        
    }

}
