//
//  HomeVC.swift
//  SocialHelp
//
//  Created by yusuf bakır on 7.11.2023.
//

import UIKit

class GiveScholarship: UIViewController {
 
  
    @IBOutlet var tableViewCell: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundImage(imageName: "back.jpeg")
        // Do any additional setup after loading the view.
        tableViewCell.delegate = self
        tableViewCell.dataSource = self
        
    }
    

   

}

extension  GiveScholarship:UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewCell.dequeueReusableCell(withIdentifier: "CellSc", for: indexPath) as! SchalorshipGiveCell
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedIndexPath = indexPath
        print(selectedIndexPath)
        let destinationViewController = StudentDetailsVC()
       performSegue(withIdentifier: "toStudentDetails", sender: nil)
    }
    
}
