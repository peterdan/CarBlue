//
//  ViewController.swift
//  BluetoothAudoUpgrade
//
//  Created by Daniel Leonard on 8/18/15.
//  Copyright (c) 2015 Macme. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer
import iAd


class ViewController: UIViewController, ADBannerViewDelegate {
    
    @IBOutlet weak var volView: MPVolumeView!
    
    @IBOutlet weak var asdf: AsdfView!
    @IBOutlet weak var carview: CarBlueView!
    
   
    
    
    var bannerAdView = ADBannerView(adType: ADAdType.Banner)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bannerAdView.delegate = self
        self.canDisplayBannerAds = true
        configureAudioSession()
        asdf.addDoitAnimation()
        carview.addCarStartAnimation()
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        println("Banner added")
        self.view.addSubview(banner)
    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        println("Failed adding ad")
        banner.removeFromSuperview()
    }
    
    func configureAudioSession() {
        let session:AVAudioSession = AVAudioSession.sharedInstance()
        var error: NSError?
        if !session.setCategory(AVAudioSessionCategoryPlayAndRecord, withOptions: AVAudioSessionCategoryOptions.MixWithOthers | AVAudioSessionCategoryOptions.AllowBluetooth, error: nil) {
            println("could not set session catigory")
            if let e = error    {
                println(e.localizedDescription)
            }
        }
        
        if !session.setActive(true, error: &error)  {
            println("Could not make session active")
            if let e = error{
                println(e.localizedDescription)
            }
        }
    }
}

