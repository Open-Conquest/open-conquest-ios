//
//  GameSceneMap.swift
//  Open Conquest
//
//  Created by Zach Wild on 5/30/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import SpriteKit

class GameSceneMapNode: SKTileMapNode {
    
    // depends on map model (which is a part of game model)
    init(map: Map) {
        super.init()
        
        // setup all SKTileMapNode properties
        name = "GameScene_map"
        tileSet = SKTileSet(named: "Sample Hexagonal Tile Set")!
        tileSize = CGSize(width: 111, height: 128)
        numberOfRows = 20
        numberOfColumns = 20
        position = CGPoint(x: 0, y: 0)
        anchorPoint = CGPoint(x: 0, y: 0)
        
        // draw map from map model
        drawMapFromMapModel(map: map)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawMapFromMapModel(map: Map) {
        numberOfRows = map.numRows
        numberOfColumns = map.numCols
        
        for row in map.tiles {
            for tile in row {
                print("Drawing tile row: \(tile.row), col: \(tile.col), type:\(tile.type)")
                drawTileAt(row: tile.row, col: tile.col, tileGroup: tile.type)
            }
        }
    }
    
    func drawMarches(marches: [March]) {
        
        for march in marches {
            
            // get the starting tile of the march
            // get the ending tile of the marc
            
            // determine the path of the march
        }
    }
    
    func updateTile() {
        
    }
    
    func drawTileAt(row: Int, col: Int, tileGroup: String) {
        print(tileSet.tileGroups[Int(tileGroup)!] )
        setTileGroup(tileSet.tileGroups[Int(tileGroup)!], forColumn: col, row: row)
    }
    
    
}
