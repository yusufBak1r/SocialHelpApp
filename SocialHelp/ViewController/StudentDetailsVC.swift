//
//  StudentDetailsVC.swift
//  SocialHelp
//
//  Created by yusuf bakır on 19.12.2023.
//

import UIKit
import RxSwift
import RxCocoa

class StudentDetailsVC: UIViewController {
    let boolSubject = BehaviorSubject<Bool>(value: false)
    @IBOutlet var StudentName: UILabel!
    
    @IBOutlet var AboutMe: UILabel!
    @IBOutlet var UniversityName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        setBackgroundImage(imageName: "back.jpeg")
     
    }
    
    @IBAction func buttomBack(_ sender: Any) {
        dismiss(animated: true)
    }
    
   
    @IBAction func ScholarshipButtom(_ sender: Any) {
        
      

        // Abonelik oluşturuyoruz ve bu Bool değerini takip ediyoruz.
        let disposable = boolSubject.subscribe(onNext: { value in
            print("Bool değeri: \(value)")
        })

        // Değerler yayılmaya başlıyor.
        boolSubject.onNext(true) // Bool değeri true olarak değiştirildiğinde
        boolSubject.onNext(false) // Bool değeri tekrar false olarak değiştirildiğinde

        // Abonelikten çıkış yapıyoruz.
        disposable.dispose()
        
        
        
    }
    @IBAction func TranskriptDownload(_ sender: Any) {
    }
    
}
