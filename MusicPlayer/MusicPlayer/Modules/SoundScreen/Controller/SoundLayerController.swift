//
//  SoundLayerController.swift
//  MusicPlayer
//
//  Created by Александр Косяков on 08.01.2023.
//

import AVFoundation
import UIKit

enum Constants {
    static let minPlayTime = 3.0
    static let minute = 60
}

final class SoundLayerController: UIViewController {
    
    // MARK: - Properties
    
    private let soundView = SoundLayerView()
    private var audioPlayer: AVPlayer!
    private var audioPlayer1: AVPlayerItem!
    private var isFavorite = false
    private var trackSound = [TrackModel]()
    
    var data: TrackModel? {
        didSet {
            guard let data = data else { return }
            soundView.authorLabel.text = data.artistName
            soundView.nameMusicLabel.text = data.trackName
            
            // сетим мелодию
            guard let url = URL(string: data.previewUrl!) else {
                return
            }
            audioPlayer = AVPlayer(url: url)
            
            // сетим картинку
            guard let imageURL = data.artworkUrl100 else {
                return
            }
            
            NetworkManager.shared.downloadImage(from: imageURL) { image in
                DispatchQueue.main.async { [self] in
                    soundView.imageViewMain.image = image
                }
            }
        }
    }
    
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
        
        soundView.playButton.addTarget(self, action: #selector(playBut), for: .touchUpInside)
        soundView.musicSlider.addTarget(self, action: #selector(sliderBut), for: .touchUpInside)
        soundView.favouritesButton.addTarget(self, action: #selector(favouritesTapButton), for: .touchUpInside)
    }
    
    func convertTimeToString(time: CMTime) -> String {
        guard !CMTimeGetSeconds(time).isNaN else { return "" }
        let totalSeconds = Int(CMTimeGetSeconds(time))
        let seconds = totalSeconds % Constants.minute
        let minutes = totalSeconds / Constants.minute
        let timeFormatString = String(
            format: "%02d:%02d", minutes, seconds
        )
        return timeFormatString
    }
    
    func setupPlayer() {
        
        //        audioPlayer = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "01. You Know You're Right", ofType: "mp3")!))
        
        audioPlayer.addPeriodicTimeObserver(forInterval: CMTime(seconds: 1, preferredTimescale: 1000), queue: DispatchQueue.main) { [self]time in
            
            soundView.musicSlider.maximumValue = Float(audioPlayer.currentItem?.duration.seconds ?? 0)
            soundView.musicSlider.value = Float(time.seconds)
            
            soundView.minuteStartLabel.text = convertTimeToString(time: time)
            soundView.minuteFinishLabel.text = convertTimeToString(time: (audioPlayer.currentItem?.duration ?? CMTime()) - time)
        }
    }
    
    private func changeFavorite() {
        if isFavorite {
            soundView.favouritesButton.setImage(UIImage(named: "heart1"), for: .normal)
        } else {
            soundView.favouritesButton.setImage(UIImage(named: "heart2"), for: .normal)
        }
    }
    
    // MARK: - Private Methods
    
    @objc
    private func playBut () {
        
        if audioPlayer.timeControlStatus == . playing {
            soundView.playButton.setImage(UIImage(named: "play"), for: .normal)
            audioPlayer.pause()
        } else {
            soundView.playButton.setImage(UIImage(named: "pause"), for: .normal)
            audioPlayer.play()
            
        }
    }
    
    @objc
    private func sliderBut () {
        
        audioPlayer.seek(to: CMTime(seconds: Double(soundView.musicSlider.value),
                                    
                                    preferredTimescale: 1000))
        soundView.minuteStartLabel.text = "\(soundView.musicSlider.value)"
        
    }
    
    @objc
    private func favouritesTapButton () {
        
        isFavorite.toggle()
        changeFavorite()
    }
}

