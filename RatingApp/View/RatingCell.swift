//
//  RatingCell.swift
//  RatingApp
//
//  Created by Nayan Pawar on 02/03/23.
//

import UIKit

class RatingCell: UITableViewCell {

     // MARK: IBOutlets
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var lblFirstName: UILabel!
    @IBOutlet weak var lblLastName: UILabel!
    @IBOutlet weak var lblReview: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblRatting: UILabel!
    @IBOutlet weak var lblRattingID: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImg.layer.borderWidth = 1
    }



}
