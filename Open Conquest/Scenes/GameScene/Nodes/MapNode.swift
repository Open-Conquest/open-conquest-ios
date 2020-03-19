//
//  MapNode.swift
//  Open Conquest
//
//  Created by Zach Wild on 5/30/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import SpriteKit

/**
 Map node for rendring tiles.
 */
class MapNode: SKTileMapNode {
    var marches: [MarchNode]
    var messageCityButton: MessageCityButton
    var viewCityButton: ViewCityButton
    var attackCityButton: AttackCityButton
    
    /**
     Initialize a map node and draw all tiles from a map model.
    
     - parameter map: The map model (contains all tile data)
     */
    init(map: Map) {
        // init child nodes
        marches = [MarchNode]()
        attackCityButton = AttackCityButton()
        messageCityButton = MessageCityButton()
        viewCityButton = ViewCityButton()
        
        super.init()
        
        // add child nodes
        addChild(attackCityButton)
        addChild(messageCityButton)
        addChild(viewCityButton)
        
        // setup all SKTileMapNode properties
        name = GameSceneNodeNames.map.rawValue
        tileSet = SKTileSet(named: "Sample Hexagonal Tile Set")!
        tileSize = CGSize(width: 111, height: 128)
        numberOfRows = 10
        numberOfColumns = 10
        position = CGPoint(x: 0, y: 0)
        anchorPoint = CGPoint(x: 0, y: 0)
        
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
     */
    func addMarch(march: March) {
        let startPoint = centerOfTile(atColumn: march.start_tile_col, row: march.start_tile_row)
        let endPoint = centerOfTile(atColumn: march.end_tile_col, row: march.end_tile_row)
        
        // create & add march node to the map
        let marchNode = MarchNode(march: march, startPoint: startPoint, endPoint: endPoint)
        marchNode.position = startPoint
        addChild(marchNode)
        
        marches.append(marchNode)
    }
    
    func updateMarches() {
        for march in marches {
            march.update()
        }
    }
    
    /**
    Moves buttons to the tile that was pressed
    
    - parameter location: CGPoint of where the tap occured
    */
    func repositionButtons(location: CGPoint) {
        // get the tile (row, col) that we clicked and position
        let col = tileColumnIndex(fromPosition: location)
        let row = tileRowIndex(fromPosition: location)
        let tileCenter = centerOfTile(atColumn: col, row: row)
        
        messageCityButton.position = CGPoint(x: tileCenter.x - 64, y: tileCenter.y + 80)
        viewCityButton.position = CGPoint(x: tileCenter.x, y: tileCenter.y + 120)
        attackCityButton.position = CGPoint(x: tileCenter.x + 64, y: tileCenter.y + 80)
        
        showButtons()
    }
    
    func hideButtons() {
        messageCityButton.isHidden = true
        viewCityButton.isHidden = true
        attackCityButton.isHidden = true
    }
    
    func showButtons() {
        messageCityButton.isHidden = false
        viewCityButton.isHidden = false
        attackCityButton.isHidden = false
    }
    
}
