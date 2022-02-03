//
//  VC_Assignment.swift
//  16_WebServices
//
//  Created by Dogukan Berk Ozer on 2.02.2022.
//

import UIKit
import SwiftyJSON

class VC_Assignment: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var cvImageList: UICollectionView!
    
    var authorization = ""
    var imageBaseUrl = "http://213.128.70.26:8014/upload/images/category/"
    var imageStringUrlList = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        sendRequestMember()
        
        cvImageList.register(UINib(nibName: "CVC_Image", bundle: nil), forCellWithReuseIdentifier: "CVC_Image")
        let layout = cvImageList.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        let width = (cvImageList.frame.size.width - 80) / 3
        let height = width
        layout.itemSize = CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageStringUrlList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVC_Image", for: indexPath) as! CVC_Image
        let stringUrl = imageStringUrlList[indexPath.row]
        let url = try? Data(contentsOf: URL(string: stringUrl)!)
        cell.ivCategoryPhoto.image = UIImage(data: url!)
        return cell
    }
    
    func sendRequestMember()
    {
        let url = URL(string: "http://213.128.70.26:8013/api/account/login/member")!
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 64)
        
        var header = [String : String]()
        header["Content-Type"] = "application/json"
        request.allHTTPHeaderFields = header
        
        request.httpMethod = "post" // default "get"
        
        let parameters : [String : Any] =
        [
            "Phone":"123456789",
            "Password":"password"
        ]
        request.httpBody = try! JSONSerialization.data(withJSONObject: parameters, options: [])
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if(error != nil)
            {
                print("\(String(describing: error))")
            }
            else
            {
                do
                {
                    let httpUrlResponse = response as! HTTPURLResponse
                    if(httpUrlResponse.statusCode == 200 && data != nil)
                    {
                        let json = try JSON(data: data!)
                        let member = try? JSONDecoder().decode(Member.self, from: data!)
                        print(json)
                        self.authorization += "Bearer \(String(describing: member!.data!.token!))"
                        
                        print(self.authorization)
                        self.sendRequestCategory()
                    }
                }
                catch
                {}
            }
            print("\n======= Member service call is over! =======\n")
        }.resume()
    }
    
    func sendRequestCategory()
    {
        let url = URL(string: "http://213.128.70.26:8013/api/Category/List/Home/1")!
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 64)
        
        var header = [String : String]()
        header["Authorization"] = authorization
        request.allHTTPHeaderFields = header
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if(error != nil)
            {
                print("\(String(describing: error))")
            }
            else
            {
                do
                {
                    let httpUrlResponse = response as! HTTPURLResponse
                    if(httpUrlResponse.statusCode == 200 && data != nil)
                    {
                        let json2 = try JSON(data: data!)
                        let category = try? JSONDecoder().decode(Category.self, from: data!)
                        print(json2)
                        
                        for i in category!.data!
                        {
                            if(i.id != 149 && i.id != 189)
                            {
                                i.imageUrl! = self.imageBaseUrl + i.imageUrl!
                                self.imageStringUrlList.append(i.imageUrl!)
                            }
                        }
                        
                        DispatchQueue.main.async {
                            print(self.imageStringUrlList)
                            self.cvImageList.reloadData()
                        }
                    }
                }
                catch
                {}
            }
            print("\n======= Category service call is over! =======\n")
        }.resume()
    }
}

class Member : Codable
{
    var status : Status?
    var data : MemberData?
}

class Status : Codable
{
    var code : Int?
    var value : String?
}

class MemberData : Codable
{
    var token : String?
    var socialRememberToken : String?
    var phone : String?
    var languageId : Int?
}

class Category : Codable
{
    var status : Status?
    var data : [CategoryData]?
}

class CategoryData : Codable
{
    var id : Int?
    var parentCategoryId : Int?
    var name : String?
    var imageUrl : String?
}
