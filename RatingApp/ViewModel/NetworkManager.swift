//
//  NetworkManager.swift
//  RatingApp
//
//  Created by Nayan Pawar on 02/03/23.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    private init(){}
    
    
//    func getReviews(completion: @escaping (BaseModel) -> Void){
//        
//        //        Get url of the server
//        guard let url = URL(string: "http://52.76.221.73/demo/get_ratings.json")
//        else{
//            fatalError()
//        }
//        print("URL Called")
//        //  Fetch Data froom url
//            URLSession.shared.dataTask(with: url) { data, response, error in
//             
//            guard let data, error == nil
//            else{
//                fatalError()
//            }
//
//            do{
//                let decodedData = try JSONDecoder().decode(BaseModel.self, from: data)
//                print("Data Decoded")
//                completion(decodedData)
//            }catch let error{
//                print(error.localizedDescription)
//            }
//
//        }.resume()
//    }
    
    func getReviewsAlomofire(completion:@escaping (BaseModel)-> Void){
        AF.request("http://52.76.221.73/demo/get_ratings.json").response{
            response in
            guard let data = response.data
            else
            { fatalError()}
            do{
                let decodedData = try JSONDecoder().decode(BaseModel.self, from: data)
                print("Data Decoded")
                completion(decodedData)
            }catch let error{
                print(error.localizedDescription)
            }
            
        }.resume()
    }
}
