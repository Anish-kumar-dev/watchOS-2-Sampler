//
//  AudioRecAndPlayInterfaceController.swift
//  watchOS2Sampler
//
//  Created by Shuichi Tsutsumi on 2015/06/10.
//  Copyright © 2015 Shuichi Tsutsumi. All rights reserved.
//

import WatchKit
import Foundation


class AudioRecAndPlayInterfaceController: WKInterfaceController {

    
    @IBOutlet weak var recLabel: WKInterfaceLabel!
    @IBOutlet weak var playLabel: WKInterfaceLabel!
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
    }

    override func willActivate() {
        super.willActivate()
    }

    override func didDeactivate() {
        super.didDeactivate()
    }

    
    // =========================================================================
    // MARK: - Private

    func recFileURL() -> NSURL {
        
        // Must use a shared container
        let fileManager = NSFileManager.defaultManager()
        let container = fileManager.containerURLForSecurityApplicationGroupIdentifier("group.com.shu223.watchos2sampler") // replace with your own identifier!!!!
        let audioFileURL = container!.URLByAppendingPathComponent("rec.mp4")
        
        return audioFileURL
    }
    
    
    // =========================================================================
    // MARK: - Actions
    
    @IBAction func recBtnTapped() {

        self.presentAudioRecorderControllerWithOutputURL(
            self.recFileURL(),
            preset: WKAudioRecorderPreset.HighQualityAudio,
            options: nil,
            completion:
            { (didSave, error) -> Void in
                print("error:\(error)\n")
                self.recLabel.setText("didSave:\(didSave), error:\(error)")
            })
    }
    
    @IBAction func playBtnTapped() {
        
        self.presentMediaPlayerControllerWithURL(
            self.recFileURL(),
            options: nil) { (didPlayToEnd, endTime, error) -> Void in
                
                self.playLabel.setText("didPlayToEnd:\(didPlayToEnd), endTime:\(endTime), error:\(error)")
        }
    }
}
