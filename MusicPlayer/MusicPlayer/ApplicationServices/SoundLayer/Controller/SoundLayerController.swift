//
//  SoundLayerController.swift
//  MusicPlayer
//
//  Created by Александр Косяков on 08.01.2023.
//

import UIKit

final class SoundLayerController: UIViewController {
    
    // MARK: - Properties
    
    private let soundView = SoundLayerView()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = soundView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Playing Now"
        
    }
}


