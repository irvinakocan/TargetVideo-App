//
//  VideoDetailsViewController.swift
//  TargetVideo Task
//
//  Created by Macbook Air 2017 on 28. 1. 2025..
//

import UIKit

class VideoDetailsViewController: UIViewController {
    
    private let videoItem: YouTubeItem

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
    }
    
    init(videoItem: YouTubeItem) {
        self.videoItem = videoItem
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
