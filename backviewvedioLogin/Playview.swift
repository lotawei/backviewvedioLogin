//
//  Playview.swift
//  backviewvedioLogin
//
//  Created by lotawei on 16/9/22.
//  Copyright © 2016年 lotawei. All rights reserved.
//

import UIKit
import  AVFoundation
class Playview: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
     */  var player: AVPlayer? {
        
        get {
            return playerLayer.player
        }
        
        set {
            playerLayer.player = newValue
        }
    }
    
    var playerLayer: AVPlayerLayer {
        return layer as! AVPlayerLayer
    }
    
    override class var layerClass: AnyClass {
        return AVPlayerLayer.self
    }


}
