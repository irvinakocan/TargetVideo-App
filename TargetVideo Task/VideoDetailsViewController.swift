//
//  VideoDetailsViewController.swift
//  TargetVideo Task
//
//  Created by Macbook Air 2017 on 28. 1. 2025..
//

import UIKit
import youtube_ios_player_helper

class VideoDetailsViewController: UIViewController {
    
    private let videoItem: YouTubeItem

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        title = "Video Details Page"
    }
    
    init(videoItem: YouTubeItem) {
        self.videoItem = videoItem
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
