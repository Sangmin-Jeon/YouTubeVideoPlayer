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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
