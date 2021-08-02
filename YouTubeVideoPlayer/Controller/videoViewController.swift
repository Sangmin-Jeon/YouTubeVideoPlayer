//
//  videoViewController.swift
//  YouTubeVideoPlayer
//
//  Created by 전상민 on 2021/08/02.
//

import UIKit
import YoutubePlayer_in_WKWebView

class videoViewController: UIViewController {
    
    // view의 비율: 16:9로 설정 >
    @IBOutlet weak var videoView: WKYTPlayerView!
    
    // playsinline >
    // 1: 기본 view에서 재생, 0: 전체화면에서 재생
    let playVarsDic = ["playsinline": 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        videoView.load(withVideoId: "yB-QqnRkx8Q", playerVars: playVarsDic)
    }


}
