//
//  GameAudio.swift
//  my-little-monster
//
//  Created by Amadeu Andrade on 20/04/16.
//  Copyright © 2016 Amadeu Andrade. All rights reserved.
//

import Foundation
import AVFoundation

class GameAudio {
    
    var biteSound: AVAudioPlayer!
    var caveMusicSound: AVAudioPlayer!
    var deathSound: AVAudioPlayer!
    var heartSound: AVAudioPlayer!
    var skullSound: AVAudioPlayer!
    
    init() {
        initCaveMusicSound()
        initBiteSound()
        initDeathSound()
        initHeartSound()
        initSkullSound()
    }
    
    func initBiteSound() {
        let biteSoundPath = NSBundle.mainBundle().pathForResource("bite", ofType: "wav")
        let biteSoundUrl = NSURL(fileURLWithPath: biteSoundPath!)
        
        do {
            try biteSound = AVAudioPlayer(contentsOfURL: biteSoundUrl)
            biteSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func initCaveMusicSound() {
        let caveMusicSoundPath = NSBundle.mainBundle().pathForResource("cave-music", ofType: "mp3")
        let caveMusicSoundUrl = NSURL(fileURLWithPath: caveMusicSoundPath!)
        
        do {
            try caveMusicSound = AVAudioPlayer(contentsOfURL: caveMusicSoundUrl)
            caveMusicSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func initDeathSound() {
        let deathSoundPath = NSBundle.mainBundle().pathForResource("death", ofType: "wav")
        let deathSoundUrl = NSURL(fileURLWithPath: deathSoundPath!)
        
        do {
            try deathSound = AVAudioPlayer(contentsOfURL: deathSoundUrl)
            deathSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func initHeartSound() {
        let heartSoundPath = NSBundle.mainBundle().pathForResource("heart", ofType: "wav")
        let heartSoundUrl = NSURL(fileURLWithPath: heartSoundPath!)
        
        do {
            try heartSound = AVAudioPlayer(contentsOfURL: heartSoundUrl)
            heartSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func initSkullSound() {
        let skullSoundPath = NSBundle.mainBundle().pathForResource("skull", ofType: "wav")
        let skullSoundUrl = NSURL(fileURLWithPath: skullSoundPath!)
        
        do {
            try skullSound = AVAudioPlayer(contentsOfURL: skullSoundUrl)
            skullSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func playBiteSound() {
        if biteSound.playing {
            biteSound.stop()
            biteSound.currentTime = 0
        }
        biteSound.play()
    }
    
    func playCaveMusicSound() {
        if caveMusicSound.playing {
            caveMusicSound.stop()
            caveMusicSound.currentTime = 0
        }
        caveMusicSound.play()
    }
    
    func playDeathSound() {
        if deathSound.playing {
            deathSound.stop()
            deathSound.currentTime = 0
        }
        deathSound.play()
    }
    
    func playHeartSound() {
        if heartSound.playing {
            heartSound.stop()
            heartSound.currentTime = 0
        }
        heartSound.play()
    }
    
    func playSkullSound() {
        if skullSound.playing {
            skullSound.stop()
            skullSound.currentTime = 0
        }
        skullSound.play()
    }
    
}