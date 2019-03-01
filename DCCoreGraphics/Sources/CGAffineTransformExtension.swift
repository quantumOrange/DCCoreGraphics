//
//  CGAffineTransformExtension.swift
//  demoApp
//
//  Created by David Crooks on 23/01/2015.
//  Copyright (c) 2015 David Crooks. All rights reserved.
//

import Foundation
import CoreGraphics

public func *(left: CGAffineTransform, right: CGAffineTransform) -> CGAffineTransform {
    return left.concatenating(right)
}

public extension CGAffineTransform {
    
    public static func rotationAboutPoint( _ angle:CGFloat,  point:CGPoint) -> CGAffineTransform {
        let Tminus = CGAffineTransform(translationX: -point.x, y: -point.y)
        let R = CGAffineTransform(rotationAngle: angle)
        let Tplus = CGAffineTransform(translationX: point.x, y: point.y)
        
        return Tminus * R  * Tplus
    }
    
    public static func scaleAboutPoint( _ scale:CGFloat,  point:CGPoint) -> CGAffineTransform {
        let Tminus = CGAffineTransform(translationX: -point.x, y: -point.y)
        let S = CGAffineTransform(scaleX: scale, y: scale)
        let Tplus = CGAffineTransform(translationX: point.x, y: point.y)
        
        return Tminus * S  * Tplus
    }
    
    public static func stretch(_ scale:CGFloat, angle:CGFloat, aboutPoint p:CGPoint) -> CGAffineTransform {
        let Tminus = CGAffineTransform(translationX: -p.x, y: -p.y)
        let Tplus = CGAffineTransform(translationX: p.x, y: p.y)
        let Rminus = CGAffineTransform(rotationAngle: -angle)
        let Rplus = CGAffineTransform(rotationAngle: angle)
        let S = CGAffineTransform( scaleX: scale,y: 1.0)
        
        return  Tminus * Rminus * S * Rplus * Tplus
    }
    
    public var angle:CGFloat {
        get {
            return atan2(self.b, self.a)
        }
        set {
            let T = self.translation
            let S = self.scale
            let R = CGAffineTransform(rotationAngle: newValue)
            
            self =   T * S * R
        }
    }
    
    public var rotation:CGAffineTransform {
        return CGAffineTransform(rotationAngle: self.angle)
    }

    public var translation:CGAffineTransform {
        return CGAffineTransform(translationX: self.tx,y: self.ty)
    }
    
    public var scale:CGAffineTransform {
        return CGAffineTransform(scaleX: self.xSscale, y: self.yScale)
    }
    
    public var xSscale:CGFloat {
        let t = self
        return sqrt(t.a * t.a + t.c * t.c);
    }
            
    public var yScale:CGFloat {
            let t = self
        return sqrt(t.b * t.b + t.d * t.d)
    }
    
}
