//
//  ViewController.swift
//  YouTubeVideoPlayer
//
//  Created by 전상민 on 2021/08/01.
//

import UIKit
import Kingfisher
import YoutubePlayer_in_WKWebView

class ViewController: UIViewController {

    @IBOutlet weak var listTableView: UITableView!
    var load = model()

    // Url추가 >
    func addUrl() {
        let alert = UIAlertController(title: "URL 추가", message: "", preferredStyle: .alert)
        // alert textField 추가 >
        alert.addTextField { (myTextField) in
            myTextField.placeholder = "YouTube Url"
        }
        // ok Btn >
        let ok = UIAlertAction(title: "OK", style: .default) { [self] (ok) in
            // 잘못된 주소 입력시 알림 >
            guard let youTubeId = (alert.textFields?[0].text)!.youTubeId else {
                let failAlert = UIAlertController(title: "잘못된 주소", message: nil, preferredStyle: .alert)
                let fail = UIAlertAction(title: "OK", style: .default, handler: nil)
                failAlert.addAction(fail)
                self.present(failAlert, animated: true, completion: nil)
                return
            }
            load.list.append(youTubeId)
            listTableView.reloadData()
            date()
        }
        // cancel Btn >
        let cancel = UIAlertAction(title: "cancel", style: .cancel, handler: nil)

        alert.addAction(cancel)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    // list 목록 제거 >
    func delete(at indexPath: IndexPath) {
        load.list.remove(at: indexPath.row)
        listTableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    // 추가한 시간 표시 >
    func date() {
        let nowDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let str = dateFormatter.string(from: nowDate)
        load.time.append(str)
    }
    
    // videoViewController로 id전달
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let videoViewController = segue.destination as? videoViewController else { return }
        // indexPath 생성 >
        let indexPath = listTableView.indexPathForSelectedRow
        guard let rowOfIndexPath: Int = indexPath?.row else { return }
        videoViewController.urlId = self.load.list[rowOfIndexPath]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "My YouTube List"

        // navigationBtn 추가 >
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showMenu(_:)))
        
    }
    
    @objc func showMenu(_ sender: UIBarButtonItem) {
        let menu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let addUrlAction = UIAlertAction(title: "Add URL", style: .default) { (action) in
            self.addUrl()
        }
        menu.addAction(addUrlAction)

        if let pc = menu.popoverPresentationController {
            pc.barButtonItem = sender
        }
        
        present(menu, animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDelegate {
    // 선택한 cell표시 해제 >
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        listTableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // swipe해서 제거 >
        let deleteAction = UIContextualAction(style: .destructive, title: "휴지통") {
            (action, view, completion) in
            self.delete(at: indexPath)
            completion(true)
        }
        deleteAction.image = UIImage(systemName: "trash")
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        // cell전체를 swipe했을때 삭제 >
        configuration.performsFirstActionWithFullSwipe = true
        
        return configuration
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return load.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! videoTableViewCell
        // 썸네일 이미지 >
        let fileURL = URL(string: "https://img.youtube.com/vi/\(load.list[indexPath.row])/0.jpg")
        cell.sumNailImage.kf.setImage(with: fileURL)
        cell.videoTitle.text = "Id: \(load.list[indexPath.row])"
        cell.timeLabel.text = load.time[indexPath.row]
        // call Back메소드 호출 >
        // 즐겨찾기 버튼이 눌린 cell의 indexPath
        cell.buttonAction = { [self] currentCell in
            let selectedIndexPath = tableView.indexPath(for: currentCell)!
            // print(load.list[selectedIndexPath.row])
            let videoTitle = load.list[selectedIndexPath.row]
            // Notification post >
            NotificationCenter.default.post(name: NSNotification.Name.videoTitleNotification, object: nil, userInfo: ["title":videoTitle])
        }
        return cell
    }
}

// NSNotification 이름 선언 >
extension NSNotification.Name {
    static let videoTitleNotification = NSNotification.Name("videoTitleNotification")
}

// URl Id추출 정규식 >
extension String {
    var youTubeId: String? {
        let typePattern = "(?:(?:\\.be\\/|embed\\/|v\\/|\\?v=|\\&v=|\\/videos\\/)|(?:[\\w+]+#\\w\\/\\w(?:\\/[\\w]+)?\\/\\w\\/))([\\w-_]+)"
        let regex = try? NSRegularExpression(pattern: typePattern, options: .caseInsensitive)
        return regex
            .flatMap { $0.firstMatch(in: self, range: NSMakeRange(0, self.count)) }
            .flatMap { Range($0.range(at: 1), in: self) }
            .map { String(self[$0]) }
    }
}
