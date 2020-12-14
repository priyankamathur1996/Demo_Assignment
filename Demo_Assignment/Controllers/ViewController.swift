//
//  ViewController.swift
//  Demo_Assignment
//
//  Created by User on 14/12/20.
//

import UIKit


class ViewController: UIViewController {
    
    
    //MARK: - OUTLET's
    //TODO:
    @IBOutlet weak var newsFeedTblView: UITableView!
    
    
    //MARK: - Variable's & Object's
    //TODO:
    let apiHandle = ApiHandler()
    let viewModel = ViewModel()
    
    var model:Articles?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Feed News"
        commonController = self
        getapiService()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "Feed News"
    }
   
}

//MARK: - Custom Methods
//TODO:
extension ViewController {
    
    //TODO: Register Nib method
     func registerNib(){
        
        self.newsFeedTblView.register(UINib(nibName:  "NewsFeedCell", bundle: nil), forCellReuseIdentifier:  "NewsFeedCell")
        
        newsFeedTblView.delegate = self
        newsFeedTblView.dataSource = self
        self.newsFeedTblView.tableFooterView = UIView()
        self.newsFeedTblView.reloadData()
        
    }

    
    //MARK: - CLOSURE FOR EXCLUSIVE
    //TODO:
    func closerSetup(){
        
        viewModel.reloadList = {() in
            self.registerNib()
        }
       
        viewModel.errorMessage = { (message) in
            print(message)
        }
    }
    
    //MARK: - Navigation On Selection
    //TODO:
    func selectOnCell(_ index: Int){
        
        let vc = self.storyboard?.instantiateViewController(identifier: "NewsDetailVC") as! NewsDetailVC
        vc.model = (viewModel.rootArticleArr.first?.articles?[index])!
        self.title = ""
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

//MARK: - UITableView DataSource & Delegates
//TODO:
extension ViewController: UITableViewDelegate , UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rootArticleArr.first?.articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = (viewModel.rootArticleArr.first?.articles?[indexPath.row])!
        
        guard let newCell = newsFeedTblView.dequeueReusableCell(withIdentifier: "NewsFeedCell", for: indexPath) as? NewsFeedCell else { return UITableViewCell() }
        
        newCell.configureData(info: model)
        
        return newCell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       self.selectOnCell(indexPath.row)
        
        
    }
    
    
    
}

//MARK: - WebService Implementation
//TODO: API Calling Function Initialization
extension ViewController {
    
    //MARK: - News Data APi
    //TODO:
    func getapiService(){
                
        viewModel.getNewsData("http://newsapi.org/v2/everything?q=bitcoin&from=2020-11-14&sortBy=publishedAt&apiKey=80ad98650b8b42b8b24b7cf5c53b7026")
        
        closerSetup()
        
    }
}
