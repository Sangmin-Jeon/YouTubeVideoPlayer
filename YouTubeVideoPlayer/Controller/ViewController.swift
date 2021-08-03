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
            load.list.append((alert.textFields?[0].text)!)
            print(load.list)
            listTableView.reloadData()
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
    
    // 왼쪽으로 swipe해서 제거 >
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "휴지통") {
            (action, view, completion) in
            self.delete(at: indexPath)
            completion(true)
        }
        deleteAction.image = UIImage(systemName: "trash")
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        // cell전체를 swipe했을때 삭제함 >
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
        cell.videoTitle.text = load.list[indexPath.row]
        return cell
    }
}
