//
//  MainVC.swift
//  NavSwift
//
//  Created by Nguyen Huu An Nhien on 10/6/20.
//  Copyright © 2020 Nguyen Huu An Nhien. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage


var film_array: [Film] = []
class MainVC: UIViewController {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var view2: CustomView!
    @IBOutlet weak var view1: CustomView!
    @IBOutlet weak var imgFlag: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData_Array()
        var actionClickOn:(([Film])->())?
        self.title = "Home"
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "background_main"))
        lblTitle.textColor = .black
        self.navigationController?.isNavigationBarHidden = true
        //loadData()
        view1.actionClicked = { film in
            actionClickOn?(film_array)
            let detailview = DetailVC(nibName: "DetailVC", bundle: nil)
            detailview.film = film
            self.navigationController?.pushViewController(detailview, animated: true)
            debugPrint("Open new VC")
        }
        view2.actionClicked = { film in
            actionClickOn?(film_array)
            let detailview = DetailVC(nibName: "DetailVC", bundle: nil)
            detailview.film = film
            self.navigationController?.pushViewController(detailview, animated: true)
            debugPrint("Open new VC")
        }
        
            view1.actionClickOn = { film_array_closure in
                var flag_array = [Film]()
                for i in 0...film_array.count - 1 {
                    flag_array.append(film_array[i])
                }
                self.view1.film_array = flag_array
        }
        view2.actionClickOn = { film_array_closure in
                var flag_array = [Film]()
                for i in 0...film_array.count - 1 {
                    flag_array.append(film_array[i])
                }
                
                self.view2.film_array = flag_array
                //debugPrint(customview.film_array[0].titleOriginal)
        }
        
        
      
    }
    
   
    
}
  
  //85->118
    func loadData_Array() {
    for i in 85...118 {
        let urlString = "https://api.themoviedb.org/3/movie/" + String(i) + "?api_key=73f38b911fe1a87bfcaf2601f8bc7b66"
       // debugPrint(urlString)
                let url = URL(string: urlString)
                URLSession.shared.dataTask(with:url!) { (data, response, error) in
                    if error != nil {
                        print(error!.localizedDescription)
                    } else {
                        do {
                            let parsedData = try JSONSerialization.jsonObject(with: data!) as! [String : Any]
                            debugPrint("id: " + String(i) + " success")
                            let flag = Film()
                            let namefilm = (parsedData["original_title"] as? String )!
                            let overviewfilm = (parsedData["overview"] as? String )!
                            //let img_path = (parsedData["poster_path"] as? String)!
                            //flag.poster_path = (parsedData["poster_path"] as? String)!
                            flag.poster_path = "http://image.tmdb.org/t/p/w185" + (parsedData["poster_path"] as? String? ?? "/kPzcvxBwt7kEISB9O4jJEuBn72t.jpg")!
                           // debugPrint(flag.poster_path)
                            //self.imgFlag.downloaded(from: flag.poster_path)
                            flag.titleOriginal = namefilm
                            flag.overview = overviewfilm
                            flag.name = namefilm
                            debugPrint(namefilm)
                            AF.request(flag.poster_path).responseImage { response in
                                if case .success(let image) = response.result {
                                  flag.logo = image
                                }
                            }

                            if ( namefilm is String ) {
                                //name_test.append(namefilm)
                                film_array.append(flag)
                            
                            }
                            else{
                                debugPrint("error")
                            }
                            
                              
                        } catch let error as NSError {
                            print(error.localizedDescription)
                        }
                    }

                    }.resume()
    }
    
        

}




extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
