//
//  GameSceneMap.swift
//  Open Conquest
//
//  Created by Zach Wild on 5/30/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import SpriteKit

/**
 Map node for rendring tiles.
 */
class GameSceneMapNode: SKTileMapNode {
    let messageButton = SKSpriteNode(imageNamed: "message-button")
    let cityButton = SKSpriteNode(imageNamed: "view-city-button-1")
    let attackCityButton = SKSpriteNode(imageNamed: "attack-button-3")
    
    /**
     Initialize a map node and draw all tiles from a map model.
    
     - parameter map: The map model (contains all tile data)
     */
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
        
        // setup map tile buttons
        addChild(messageButton)
        addChild(cityButton)
        addChild(attackCityButton)
        messageButton.size = CGSize(width: 64, height: 64)
        cityButton.size = CGSize(width: 64, height: 64)
        attackCityButton.size = CGSize(width: 64, height: 64)
        
        // draw map from map model
        drawMapFromMapModel(map: map)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     Parses a map model, draws each tile in the proper row, column and adjusts the map node's size accordingly.
     
     - parameter map: The map model
     */
    func drawMapFromMapModel(map: Map) {
        numberOfRows = map.numRows
        numberOfColumns = map.numCols
        
        // draw each of the tiles in the map
        for row in map.tiles {
            for tile in row {
                drawTileAt(row: tile.row, col: tile.col, tileGroup: tile.type)
            }
        }
    }
    
    /**
     Draws a tile at a row and column.
    
     Example:
     ```
     mapNode.drawTileAt(row: 0, col: 0, tileGroup: TileType.GRASS)
     ```
     
     - parameter row: The 0 indexed row of the tile being drawn
     - parameter col: The 0 indexed column of the tile being drawn
     - parameter tileGroup: The tile type enum value (grass, castle
     */
    func drawTileAt(row: Int, col: Int, tileGroup: TileType) {
        setTileGroup(tileSet.tileGroups[tileGroup.rawValue], forColumn: col, row: row)
    }
    
    /**
     Adds a new march node to the map.
     
     - parameter march: The march model class. This contains all the information needed to draw the march correctly.
     
     - returns: The march node that was added
     */
    func addMarch(march: March) -> GameSceneMapMarchNode {
        let startPoint = centerOfTile(atColumn: march.start_tile_col, row: march.start_tile_row)
        let endPoint = centerOfTile(atColumn: march.end_tile_col, row: march.end_tile_row)
        
        // create & add march node to the map
        let marchNode = GameSceneMapMarchNode(march: march, startPoint: startPoint, endPoint: endPoint)
        marchNode.position = startPoint
        addChild(marchNode)
        return marchNode
    }
    
}
