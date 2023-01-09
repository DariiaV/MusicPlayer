//
//  SoundLayerController.swift
//  MusicPlayer
//
//  Created by Александр Косяков on 08.01.2023.
//

import UIKit
import AVFoundation

final class SoundLayerController: UIViewController {
    
    // MARK: - Properties
    
    private let soundView = SoundLayerView()
    private var player: AVPlayer!
    private var isFavorite = false
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = soundView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Playing Now"
        
        setupTarget()
        setupPlayer()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let nav = self.navigationController?.navigationBar
        nav?.tintColor = UIColor.white
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
    }
    
   
    
    // MARK: - Public Methods
    
    func setupTarget() {
        
        soundView.playButton.addTarget(self, action: #selector(playBut), for:.touchUpInside)
        soundView.musicSlider.addTarget(self, action: #selector(sliderBut), for:.touchUpInside)
    }
    
    func setupPlayer() {
        
        player = AVPlayer(url:URL(fileURLWithPath:Bundle.main.path(forResource:"01. You Know You're Right",ofType: "mp3")!))
        
        player.addPeriodicTimeObserver(forInterval: CMTime(seconds: 1, preferredTimescale: 1000), queue: DispatchQueue.main) { [self]
            (time) in
            soundView.minuteStartLabel.text = getStringTime(time: time)
            
            soundView.musicSlider.maximumValue = Float(player.currentItem?.duration.seconds ?? 0)
            soundView.musicSlider.value = Float(time.seconds)
            soundView.minuteFinishLabel.text = getStringTime(time: (player.currentItem?.duration ?? CMTime()) - time)
        }
    }
    
    func getStringTime(time: CMTime) -> String {
        let minutes = Int(time.seconds / 60)
        let seconds = Int(time.seconds.truncatingRemainder(dividingBy: 60))
        return "\(minutes):\(seconds)"
    }
    
    
    // MARK: - Private Methods
    
    @objc
    private func playBut (){
        
        if player.timeControlStatus == . playing {
            soundView.playButton.setImage(UIImage(named: "play"), for: .normal)
            player.pause()
        } else {
            soundView.playButton.setImage(UIImage(named: "pause"), for: .normal)
            player.play()
            
        }
    }
    

    @objc
    private func sliderBut (){
        
        player.seek(to: CMTime(seconds: Double(soundView.musicSlider.value),
                              preferredTimescale: 1000))
        soundView.minuteStartLabel.text = "\(soundView.musicSlider.value)"
        
    }
}
