//
//  ViewController.swift
//  backviewvedioLogin
//
//  Created by lotawei on 16/9/22.
//  Copyright © 2016年 lotawei. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    var   playerViewControllercontext  = 0
    
    var   player:AVPlayer?
    
    var   duration:CMTime?
    var   time:Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        //添加监听
       time = Timer(timeInterval: 0.5, target: self, selector: #selector(repeataction), userInfo: nil, repeats: true)
       RunLoop.main.add(time!, forMode: .defaultRunLoopMode)
        
        
        view.backgroundColor = UIColor.clear
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.rege)))
       
        
        let   path =  Bundle.main.url(forResource: "ElephantSeals", withExtension: "mov")
        let   asset  = AVURLAsset(url: path!)
        let   item = AVPlayerItem.init(asset: asset)
        
        self.player = AVPlayer(playerItem: item)
        
        let  avalayer = AVPlayerLayer.init(player: self.player)
        avalayer.frame = self.view.bounds
        avalayer.backgroundColor =  UIColor.white.cgColor
        
        avalayer.setAffineTransform(CGAffineTransform(scaleX: 1.0, y: 2.5))
        
//        self.view.layer.insertSublayer(avalayer, at: 0)
        self.view.layer.insertSublayer(avalayer, at: 0)
        
        // Do any additional setup after loading the view, typically from a nib.
        
        avalayer.player?.play()
        
        self.duration = avalayer.player?.currentItem?.duration
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        player?.pause()
     
    
   
    }
   
    func  repeataction(){
        
      let  rate =  CMTimeGetSeconds(self.player!.currentItem!.currentTime()) / CMTimeGetSeconds((self.player?.currentItem?.duration)!);
        if  rate == 1.0 {
            
            self.player?.seek(to: CMTime(seconds: 0, preferredTimescale: 1))
            self.player?.play()
        }
    }
    func rege()  {
            self.view.endEditing(true)
    }
   
   

}

