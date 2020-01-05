//
//  GameSceneMap.swift
//  Open Conquest
//
//  Created by Zach Wild on 5/30/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import SpriteKit

class GameSceneMapNode: SKTileMapNode {
    
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
                drawTileAt(row: tile.row, col: tile.col, tileGroup: tile.type)
            }
        }
    }
    
    func drawTileAt(row: Int, col: Int, tileGroup: String) {
        setTileGroup(tileSet.tileGroups[Int(tileGroup)!], forColumn: col, row: row)
    }
    
    func addMarch(march: March) -> GameSceneMapMarchNode {
        let startPoint = centerOfTile(atColumn: march.start_tile_col, row: march.start_tile_row)
        let endPoint = centerOfTile(atColumn: march.end_tile_col, row: march.end_tile_row)
        
        // create & add march node to the map
        let marchNode = GameSceneMapMarchNode(march: march, startPoint: startPoint, endPoint: endPoint)
        marchNode.position = startPoint
        addChild(marchNode)
        return marchNode
    }
    
    func updateTile() {
        
    }
    
    
    
}
