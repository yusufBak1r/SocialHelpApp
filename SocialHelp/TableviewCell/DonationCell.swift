//
//  DonationCellTableViewCell.swift
//  SocialHelp
//
//  Created by yusuf bakır on 26.11.2023.
//

import UIKit
protocol DonationCellButtomProtocol  {
    func toButtom (indexPath : IndexPath)
}
class DonationCell: UITableViewCell {

    @IBOutlet var Fname: UILabel!
    @IBOutlet var Fımage: UIImageView!
    @IBOutlet var view1: UIView!
    var urlString = ""
    @IBOutlet var buttom: UIButton!
    @IBOutlet var Fcontex: UITextView!
    
    var cellProtocol :DonationCellButtomProtocol?
    var indexPath : IndexPath?
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        Fcontex.isEditable = false
        view1.layer.cornerRadius = 15
        buttom.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    




    @IBAction func ButtonUrl(_ sender: Any) {
        cellProtocol?.toButtom(indexPath: self.indexPath!)
        
    }
    
 

    
    
}
