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
var film_array_suggestion: [Film] = []
class MainVC: UIViewController {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var view2: CustomView!
    @IBOutlet weak var view1: CustomView!
    @IBOutlet weak var imgFlag: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        var actionClickOn:(([Film])->())?
        self.title = "Home"
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "background_main"))
        lblTitle.textColor = .black
        self.navigationController?.isNavigationBarHidden = true
        loadData_Array(startId: 85, endId: 118)
        view1.actionClicked = { film in
            //actionClickOn?(film_array)
            let detailview = DetailVC(nibName: "DetailVC", bundle: nil)
            detailview.film = film
            self.navigationController?.pushViewController(detailview, animated: true)
            debugPrint("Open new VC")
        }
        
        view2.actionClicked = { film in
            //actionClickOn?(film_array)
            let detailview = DetailVC(nibName: "DetailVC", bundle: nil)
            detailview.film = film
            self.navigationController?.pushViewController(detailview, animated: true)
            debugPrint("Open new VC")
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {[weak self] in
            self?.view1.updateData(films: film_array)
            self?.view2.updateData(films: film_array)
        }
        
        // Không bên load data kiểu này. Đây chỉ dùng cho sự kiện truyền biến = clicked
        /*
        view1.actionClickOn = { film_array_closure in
            var flag_array = [Film]()
            for child in film_array {
                flag_array.append(child)
            }
//            for i in 0...film_array.count - 1  {
//                flag_array.append(film_array[i])
//            }
            self.view1.film_array = flag_array
        }
        view2.actionClickOn = { film_array_closure in
            var flag_array = [Film]()
            for child in film_array {
                flag_array.append(child)
            }
//            for i in 0...film_array.count - 1  {
//                flag_array.append(film_array[i])
//            }
            self.view2.film_array = flag_array
        }
 */
    }
    
}



  //85->118
// Hàm này code không phải dùng vòng for để đi từng request, mà em phải kiếm cái api trả về 1 list các bộ phim chứ đây là api trả về chi tiết của 1 bộ phim.
// sau khi load đc list về rồi thì mới đưa sang customview để show data lên theo từng list
// Hàm này load 1 cái chỉ đc gọi khi click vào 1 bộ phim để đến detail của nó.
func loadData_Array(startId: Int, endId: Int) {
        for i in startId...endId {
            let urlString = "https://api.themoviedb.org/3/movie/" + String(i) + "?api_key=1d3a0c0e76db301e3aeccba715e259ce"
                    let url = URL(string: urlString)
                    //debugPrint(url)
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
                                flag.titleOriginal = namefilm
                                flag.overview = overviewfilm
                                flag.name = namefilm
                                debugPrint(namefilm)
                                AF.request(flag.poster_path).responseImage { response in //download image
                                    if case .success(let image) = response.result {
                                      flag.logo = image
                                    }
                                }

                                if ( namefilm is String ) {
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
