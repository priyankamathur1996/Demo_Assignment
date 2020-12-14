//
//  NewsFeedCell.swift
//  Demo_Assignment
//
//  Created by User on 15/12/20.
//

import UIKit

class NewsFeedCell: UITableViewCell {

    //MARK: - OUTLET's
    //TODO:
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblContent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configureData( info : Articles){
        
        lblTitle.text = info.title
        lblContent.text = info.content
        
    }
    
}
