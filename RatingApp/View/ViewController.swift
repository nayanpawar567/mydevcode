//
//  ViewController.swift
//  RatingApp
//
//  Created by Nayan Pawar on 02/03/23.
//

import UIKit
import Kingfisher

protocol ViewControllerProtocol:AnyObject {
    func refreshTable()
}

class ViewController: UIViewController, ViewControllerProtocol{
    
    
     // MARK: Variables
    @IBOutlet weak var tableView: UITableView!
    lazy var viewModelDelegate:ReviewsViewModelProtocol = ReviewsViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        getReviewData()
    }

     // MARK: Initial TableView Setup
    func setUpUI(){
        tableView.delegate = self
        tableView.dataSource = self
        viewModelDelegate.bind(viewDelegate: self)
    }
    
    // Getting fetched data from viewModel
    func getReviewData() {
        viewModelDelegate.getData()

    }
    
    func refreshTable() {
        self.tableView.reloadData()
    }

}


extension ViewController : UITableViewDelegate, UITableViewDataSource{
    
    // Setting number of section for TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModelDelegate.numberOfCells()
    }
    
    // Setting data to be displayed on cell of TableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? RatingCell else { return UITableViewCell() }
        
        let model = viewModelDelegate.cellData(index: indexPath)
        let imgurl = URL(string: model.profile_image_url!)

        
        cell.lblFirstName.text = model.first_name
        cell.lblLastName.text = model.last_name
        cell.lblReview.text = model.review
        cell.lblRattingID.text = "RatingID: \(model.ratting_id!)"
        cell.lblRatting.text = "Rating: \(model.ratting!)"
        cell.lblDate.text = "Date: \(model.created!)"
        cell.profileImg.kf.setImage(with: imgurl)
        
        return cell
    }
}

