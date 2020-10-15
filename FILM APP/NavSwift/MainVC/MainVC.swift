//
//  MainVC.swift
//  NavSwift
//
//  Created by Nguyen Huu An Nhien on 10/6/20.
//  Copyright © 2020 Nguyen Huu An Nhien. All rights reserved.
//

import UIKit
import Alamofire

class MainVC: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "background_main"))
        lblTitle.textColor = .brown
        self.navigationController?.isNavigationBarHidden = true
        loadData()
        // Do any additional setup after loading the view.
    }

    func loadData() {


        let urlString = "https://api.themoviedb.org/3/movie/550?api_key=1d3a0c0e76db301e3aeccba715e259ce"

        let url = URL(string: urlString)
        URLSession.shared.dataTask(with:url!) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                do {

                    let parsedData = try JSONSerialization.jsonObject(with: data!) as! [String : Any]
                    
//                    let parsedData = try JSONSerialization.jsonObject(with: data!) as! [[String : Any]]
                    let film = Film()
                    film.parserData(data: parsedData)
                    
                    debugPrint(parsedData)
                    debugPrint("stop here")
                    
//                    for item in parsedData
//                    {
//                        let id = item["id"] as! String
//                        print(id)
//                    }

                } catch let error as NSError {
                    print(error.localizedDescription)
                }
            }

            }.resume()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
