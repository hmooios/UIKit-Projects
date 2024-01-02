//
//  MessageCell.swift
//  Let'sChat-UIKit
//
//  Created by Hmoo Myat Theingi on 31/12/2023.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet var messageBubble: UIView!
    
    @IBOutlet var label: UILabel!
    
    @IBOutlet var rightPersonImage: UIImageView!
    
    
    @IBOutlet var leftPersonImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        messageBubble.layer.cornerRadius = messageBubble.frame.size.height/5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
