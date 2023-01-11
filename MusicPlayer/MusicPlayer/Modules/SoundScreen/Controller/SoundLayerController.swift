//
//  SoundLayerController.swift
//  MusicPlayer
//
//  Created by Александр Косяков on 08.01.2023.
//

import UIKit
import AVFoundation

enum Constants {
    static let minPlayTime = 3.0
    static let minute = 60
}

final class SoundLayerController: UIViewController {
    
    // MARK: - Properties
    
    private let soundView = SoundLayerView()
    private var player: AVPlayer!
    
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
    
    func convertTimeToString(time: CMTime) -> String {
        guard !CMTimeGetSeconds(time).isNaN else { return "" }
        let totalSeconds = Int(CMTimeGetSeconds(time))
        let seconds = totalSeconds % Constants.minute
        let minutes = totalSeconds / Constants.minute
        let timeFormatString = String(
            format: "%02d:%02d",minutes, seconds
        )
        return timeFormatString
    }
    
    func setupPlayer() {
        
        player = AVPlayer(url:URL(fileURLWithPath:Bundle.main.path(forResource:"01. You Know You're Right",ofType: "mp3")!))
        
        player.addPeriodicTimeObserver(forInterval: CMTime(seconds: 1, preferredTimescale: 1000), queue: DispatchQueue.main) { [self]
            (time) in
          
            soundView.musicSlider.maximumValue = Float(player.currentItem?.duration.seconds ?? 0)
            soundView.musicSlider.value = Float(time.seconds)
            
            soundView.minuteStartLabel.text = convertTimeToString(time: time)
            soundView.minuteFinishLabel.text = convertTimeToString(time: (player.currentItem?.duration ?? CMTime()) - time)
        }
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
