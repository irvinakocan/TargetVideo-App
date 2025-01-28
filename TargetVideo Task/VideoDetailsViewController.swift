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
    
    private lazy var playerView: YTPlayerView = {
        let playerView = YTPlayerView()
        playerView.load(withVideoId: videoItem.id,
                        playerVars: ["playsinline": 1])
        return playerView
    }()
    
    private lazy var name: UILabel = {
        let label = UILabel()
        label.text = videoItem.snippet.title
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.numberOfLines = 0
        label.textColor = .purple
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        title = "Video Details Page"
        
        playerView.delegate = self
        
        layout()
    }
    
    init(videoItem: YouTubeItem) {
        self.videoItem = videoItem
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        view.addSubview(playerView)
        view.addSubview(name)
        
        playerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            playerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            playerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            playerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            playerView.heightAnchor.constraint(equalToConstant: view.frame.size.width)
        ])
        
        name.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            name.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            name.topAnchor.constraint(equalTo: playerView.bottomAnchor, constant: 20),
            name.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}

extension VideoDetailsViewController: YTPlayerViewDelegate {
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        playerView.playVideo()
    }
}
