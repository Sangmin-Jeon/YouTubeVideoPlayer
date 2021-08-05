//
//  videoTableViewCell.swift
//  YouTubeVideoPlayer
//
//  Created by 전상민 on 2021/08/02.
//

import UIKit

class videoTableViewCell: UITableViewCell {

    @IBOutlet weak var sumNailImage: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var favoritBtn: UIButton!
    
    var toggle = false
    var buttonAction : ((UITableViewCell) -> ())?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        timeLabel.textColor = .gray
        
        favoritBtn.setImage(UIImage(systemName: "star"), for: .normal)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // 즐겨찾기 버튼
    @IBAction func favoritBtnToggle(_ sender: Any) {
        toggle = !toggle
        if toggle {
            buttonAction?(self)
            favoritBtn.setImage(UIImage(systemName: "star.fill"), for: .normal)
        } else {
            favoritBtn.setImage(UIImage(systemName: "star"), for: .normal)
        }
    }
    
}
