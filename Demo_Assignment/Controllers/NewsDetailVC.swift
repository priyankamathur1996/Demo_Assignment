//
//  NewsDetailVC.swift
//  Demo_Assignment
//
//  Created by User on 15/12/20.
//

import UIKit

class NewsDetailVC: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var imgNews: UIImageView!

    var model:Articles?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialSetup()
        
    }
   
}

//MARK: -
//TODO
extension NewsDetailVC{
    
    func initialSetup(){
        
        self.title = "Full Feed News"
        lblTitle.text = "\(model?.title ?? "")"
        lblAuthor.text = "\(model?.author ?? "")"
        lblDescription.text = model?.description ?? ""
        imgNews.setImage(withImageId: model?.urlToImage ?? "", placeholderImage: #imageLiteral(resourceName: "elephant.png"))
        
    }
    
    
}
