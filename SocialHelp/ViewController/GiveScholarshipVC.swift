//
//  HomeVC.swift
//  SocialHelp
//
//  Created by yusuf bakır on 7.11.2023.
//

import UIKit
import RxSwift
import RxCocoa
class GiveScholarship: UIViewController {
    
   
    var  cellRowatName = ""
    
 let viewModel = StudentDao()
    var listStdent: [Datum] = []
    @IBOutlet var tableViewCell: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundImage(imageName: "back.jpeg")
        // Do any additional setup after loading the view.
        tableViewCell.delegate = self
        tableViewCell.dataSource = self
//        Delegate Deseni
//        Bir nesnenin başka bir nesne için görevlerini gerçekleştirmesine olanak tanır.
        
        viewModel.getAllStudent()
        studentList()
    }
    func studentList () {
        viewModel.studentData.observe(on: MainScheduler.asyncInstance).subscribe({ list in
            self.listStdent =  list.event.element?.data ?? []
            self.tableViewCell.reloadData()
            print("tüm öğrneciler getiridi \(self.listStdent.count)")
            
            
            
        })
        
    }

   

}

extension  GiveScholarship:UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listStdent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewCell.dequeueReusableCell(withIdentifier: "CellSc", for: indexPath) as! SchalorshipGiveCell
        cell.StudentTextLabel.text = listStdent[indexPath.row].name
        cell.promise.text = listStdent[indexPath.row].phone
        
        return cell
    }
    
    
    //    toStudentDetails
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cellRowatName  =   listStdent[indexPath.row].name
        performSegue(withIdentifier:"toStudentDetails" , sender: nil)
//        Adaptor Deseni
//        Farklı arayüzleri veya sınıfları birbirine uyumlu hale getirmek için kullanılır.
//        Özellikle mevcut bir yapıyı değiştirmeden yeni bir yapıya uyum sağlamak için kullanışlıdır.

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toStudentDetails" {
            if  let navigationController = segue.destination as?  UINavigationController {
                
                if let studentDetailsVC = navigationController.topViewController as? StudentDetailsVC {
                    // Burada studentDetailsVC ile ilgili işlemler yapabilirsiniz
                    studentDetailsVC.selectedName = cellRowatName
                }
                
                
            }
           
             
        }
    }
}
