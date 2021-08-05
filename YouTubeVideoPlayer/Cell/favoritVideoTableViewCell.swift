//
//  favoritVideoTableViewCell.swift
//  YouTubeVideoPlayer
//
//  Created by 전상민 on 2021/08/05.
//

import UIKit

class favoritVideoTableViewCell: UITableViewCell {

    @IBOutlet weak var videoLabel: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var favoritBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        favoritBtn.setImage(UIImage(systemName: "star.fill"), for: .normal)
        
        time.textColor = .gray

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
