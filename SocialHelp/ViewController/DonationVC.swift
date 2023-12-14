//
//  DonationVC.swift
//  SocialHelp
//
//  Created by yusuf bakır on 7.11.2023.
//

import UIKit

class DonationVC: UIViewController,UITableViewDelegate,UITableViewDataSource{
    var list :[Donation] = Donation.listFoundation
   
  
    @IBOutlet weak var tableview: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.dataSource = self
        
        tableview.delegate = self
        
        // Do any additional setup after loading the view.
       
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableview.dequeueReusableCell(withIdentifier: "Cell",for: indexPath) as! DonationCell
        cell.Fname.text = list[indexPath.row].foundationName
        cell.Fcontex.text = list[indexPath.row].Statement
        cell.Fımage.image = UIImage(named: list[indexPath.row].ImageName)
        cell.urlString = list[indexPath.row].url
        cell.buttom.tag = indexPath.row
        cell.buttom.addTarget(self, action: #selector(ButtomAction(_:)), for: .touchUpInside)

        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _  = list[indexPath.row].url
        
       
    }
    
    @objc func ButtomAction(_ sender: UIButton) {
        // Butona tıklandığında yapılacak işlemleri burada yazın
        print("Button tapped")
    }

    

}
