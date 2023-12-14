//
//  DonationVC.swift
//  SocialHelp
//
//  Created by yusuf bakır on 7.11.2023.
//

import UIKit

class DonationVC: UIViewController,UITableViewDelegate,UITableViewDataSource,DonationCellButtomProtocol{
   
    var list :[Donation] = Donation.listFoundation
   
  
    @IBOutlet weak var tableview: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundImage(imageName: "back.jpeg")
        
        tableview.dataSource = self
        
        tableview.delegate = self
        
        // Do any additional setup after loading the view.

        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableview.dequeueReusableCell(withIdentifier: "Cell",for: indexPath) as! DonationCell
        cell.Fname.text = list[indexPath.row].foundationName
        cell.Fcontex.text = list[indexPath.row].Statement
        cell.Fımage.image = UIImage(named: list[indexPath.row].ImageName)
        cell.cellProtocol  = self
        cell.indexPath = indexPath
        
        

        return cell
        
    }
   
    func toButtom(indexPath: IndexPath) {
        let url =  list[indexPath.row].url
        
         if let urlString = URL(string: url) {
             UIApplication.shared.open(urlString)
         }
    }
    
   
    

}
