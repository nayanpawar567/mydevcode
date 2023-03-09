//
//  ViewModel.swift
//  RatingApp
//
//  Created by Nayan Pawar on 02/03/23.
//

import Foundation

protocol ReviewsViewModelProtocol {
    
    func bind(viewDelegate:ViewControllerProtocol)
    func numberOfCells()->Int
    func cellData(index:IndexPath)->Data
    func getData()
}

class ReviewsViewModel {
    
     // MARK: Variables
    weak var vcDelegate:ViewControllerProtocol?
    
    // Variable to append the fetched data from JSON to tableView
    var arrayData :[Data] = [Data]()
    
    }

extension ReviewsViewModel:ReviewsViewModelProtocol {

    
    //  getting reviews from Network Manager
    func getData() {
//        NetworkManager.shared.getReviews { reviews in
//            print("Data Called from completion handler")
//            self.arrayData.append(contentsOf: reviews.data!)
//            print("Tableview Data appended")
//
//            // To switch the TableView data to main thread
//            DispatchQueue.main.async {
//                self.vcDelegate?.refreshTable()
//                print("Data Reloaded")
//            }
//
//        }
        
        NetworkManager.shared.getReviewsAlomofire { reviews in
            print("Data Called from completion handler")
            self.arrayData.append(contentsOf: reviews.data!)
            print("Tableview Data appended")
            
            // To switch the TableView data to main thread
            DispatchQueue.main.async {
                self.vcDelegate?.refreshTable()
                print("Data Reloaded")
            }
            
        }

    }
    
    func numberOfCells() -> Int {
        return arrayData.count
    }
    
    func cellData(index:IndexPath) -> Data {
        return arrayData[index.row]
    }
    
    func bind(viewDelegate: ViewControllerProtocol) {
        self.vcDelegate = viewDelegate
    }
    
    
}
