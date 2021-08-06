//
//  favoritViewController.swift
//  YouTubeVideoPlayer
//
//  Created by 전상민 on 2021/08/05.
//

import UIKit
import Kingfisher

class favoritViewController: UIViewController {

    @IBOutlet weak var favoritVideo: UITableView!
    
    var token: NSObjectProtocol?
    
    var load2 = model()
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let videoViewController = segue.destination as? videoViewController else { return }
        // indexPath 생성 >
        let indexPath = favoritVideo.indexPathForSelectedRow
        guard let rowOfIndexPath: Int = indexPath?.row else { return }
        videoViewController.urlId = self.load2.favoritList[rowOfIndexPath]
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "⭐️ favorit List"
        
        token =  NotificationCenter.default.addObserver(forName: NSNotification.Name.videoTitleNotification, object: nil, queue: OperationQueue.main) {  [self] (notification) in
            guard let value = notification.userInfo?["title"] as? String else {
                return
            }
            // key값이 중복되지 않을때만 추가
            if !(load2.favoritList.contains(value)) {
                // 없으면 추가
                load2.favoritList.append(value)
                date()
            }
            favoritVideo.reloadData()
        }
        
    }
    
    func date() {
        let nowDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let str = dateFormatter.string(from: nowDate)
        load2.time.append(str)
    }
    
    deinit {
        if let token = token {
            NotificationCenter.default.removeObserver(token)
        }
        NotificationCenter.default.removeObserver(self)
    }

}

extension favoritViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        favoritVideo.deselectRow(at: indexPath, animated: false)
    }
}

extension favoritViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return load2.favoritList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoritCell", for: indexPath) as! favoritVideoTableViewCell
        // 이미지 타이틀 추가 
        cell.videoLabel.text = "Id: \(load2.favoritList[indexPath.row])"
        let fileURL = URL(string: "https://img.youtube.com/vi/\(load2.favoritList[indexPath.row])/0.jpg")
        cell.videoImage.kf.setImage(with: fileURL)
        cell.time.text = load2.time[indexPath.row]
        return cell
    }
    
}
