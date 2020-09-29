//
//  ViewController.swift
//  UITableView
//
//  Created by Nguyen Huu An Nhien on 9/26/20.
//  Copyright © 2020 Nguyen Huu An Nhien. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   // Nên viết những hàm cho tableview ra 1 extension
    // Em viêt thêm custom cell... nghĩa là tạo ra 1 class kế thừa từ uitableview cell rồi dùng nó trong hàm cellForRow
    // Từ khoá là "custom cell UITableview swift"
    @IBOutlet weak var tableVIew: UITableView! // tên table phải có tiền tố là tbl...
    
    @IBOutlet weak var tableView_2: UITableView! // Tại sao phải có 2 table ?? 1 table có nhiều section là đủ
    
    var arrayName:[String] = ["Eden Hazard", "Andreas Inesta", "Kevin De Bruyne", "James Rodigues", "Thomas Muller", "Harry Kane"]
    var arrayIndex:[String] = ["Class A", "Class B", "Class A", "Class B", "Class D", "Class C"  ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView_2.dataSource = self
                
        // Do any additional setup after loading the view.
    }
//    //set so hang
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return arrayName.count
//    }
//    //set noi dung
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL")
//        cell?.textLabel?.text = arrayName[indexPath.row]
//        cell?.detailTextLabel?.text = String(arrayIndex[indexPath.row])
//        return cell!
//    }
//    //set so lan lap section
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 10
//    }
}
extension ViewController : UITableViewDelegate, UITableViewDataSource {
    //set so hang
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayName.count
    }
    //set noi dung
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL") // Nên dùng customcell
        cell?.textLabel?.text = arrayName[indexPath.row]
        cell?.detailTextLabel?.text = String(arrayIndex[indexPath.row])
        return cell!
    }
    //set so lan lap section
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
}

