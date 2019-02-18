//
//  Extensions.swift
//  P3App
//
//  Created by aoi haru on 2/18/19.
//  Copyright © 2019 aoi haru. All rights reserved.
//

import Foundation
import SceneKit
import ARKit

var width : CGFloat = 0.02
var height : CGFloat = 1
var length : CGFloat = 1

var doorLength : CGFloat = 0.3

func createBox(isDoor : Bool) -> SCNNode {
    let node = SCNNode()
    
    let firstBox = SCNBox(width: width, height: height, length: isDoor ? doorLength : length, chamferRadius: 0)
    let firstBoxNode = SCNNode(geometry: firstBox)
    firstBoxNode.renderingOrder = 200
    
    node.addChildNode(firstBoxNode)
    
    let maskedBox = SCNBox(width: width, height: height, length: isDoor ? doorLength : length, chamferRadius: 0)
    maskedBox.firstMaterial?.diffuse.contents = UIColor.white
    maskedBox.firstMaterial?.transparency = 0.00001
    
    let maskedBoxNode = SCNNode(geometry: maskedBox)
    maskedBoxNode.renderingOrder = 100
    maskedBoxNode.position = SCNVector3.init(width, 0, 0)
    
    node.addChildNode(maskedBoxNode)
    
    return node
}


extension FloatingPoint {
    var degreeToRadians : Self {
        return self * .pi / 180
    }
    var radiansToDegree : Self {
        return self * 180 / .pi
    }
}
