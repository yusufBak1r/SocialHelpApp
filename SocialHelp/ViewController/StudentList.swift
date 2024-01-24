//
//  HomeVC.swift
//  SocialHelp
//
//  Created by yusuf bakır on 7.11.2023.
//

import UIKit
import RxSwift
import RxCocoa
class StudentList: UIViewController {
    
   
    var studentData = Student?.self
    var  cellRowatName = ""
    var selectedID = 0
     let viewModel = StudentViewModel()
    var listStdent: [DatumStudent] = []
    var filteredArr : [DatumStudent] = []
    var searching:Bool?
    let disposeBag = DisposeBag()
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableViewCell: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundImage(imageName: "back.jpeg")
      
        tableViewCell.delegate = self
        tableViewCell.dataSource = self
        searchBar.delegate = self
 
       studentList()
                 
    }
    func studentList () {
        viewModel.getStudunetAll()
        viewModel.studentData.observe(on: MainScheduler.asyncInstance).subscribe({ list in
            self.listStdent =  list.event.element?.data ?? []
            self.tableViewCell.reloadData()
            print("tüm öğrneciler getiridi \(self.listStdent.count)")
            
            
            
        }).disposed(by: disposeBag)
        
    }

   

}

extension  StudentList:UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (searching ?? false ){
          return   filteredArr.count
        }else{
            return  listStdent.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewCell.dequeueReusableCell(withIdentifier: "CellSc", for: indexPath) as! SchalorshipGiveCell
        if (!(searching ?? false)){
          
            cell.StudentTextLabel.text = listStdent[indexPath.row].name
            cell.promise.text = listStdent[indexPath.row].email
        }else {
            cell.StudentTextLabel.text = filteredArr[indexPath.row].name
        }
         return cell
        
        
    }
    
    
    //    toStudentDetails
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (!(searching ?? false)) {
            cellRowatName  =   listStdent[indexPath.row].name
            selectedID = listStdent[indexPath.row].id
            
        }else{
            cellRowatName  =   filteredArr[indexPath.row].name
            selectedID = filteredArr[indexPath.row].id
        }
       
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
                    studentDetailsVC.selectedIDStudentDetailsVC = selectedID
                    
                    
                    
                }
                
                
            }
           
             
        }
    }
    
    
}
extension StudentList:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if (searchText.isEmpty) {
            filteredArr = listStdent
        }else {
            filteredArr = listStdent.filter{$0.name.lowercased().contains(searchText.lowercased())}
        }
        
        searching = true
        tableViewCell.reloadData()
        }
        
    }

