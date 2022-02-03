//
//  ViewController.swift
//  16_WebServices
//
//  Created by Dogukan Berk Ozer on 31.01.2022.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var ivImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        jsonParseJsonSerialization()
//        jsonParseSwiftyJson()
//        jsonParseJsonSerializationTwo()
//        jsonParseSwiftyJsonTwo()
//        jsonParseCodable()
        
//        jsonParseSwiftyJsonThree()
//        jsonParseCodableThree()
        
        var stringUrl = "https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dmlld3xlbnwwfHwwfHw%3D&w=1000&q=80"
        let url = try? Data(contentsOf: URL(string: stringUrl)!)
        ivImage.image = UIImage(data: url!)
        
//        sendRequest()
//        sendRequestTwo()
//        sendRequestX()
//        sendRequestPP()
    }
    
    func jsonParseJsonSerialization()
    {
        var jsonStr = "{\"name\" : \"dogukan\", \"age\" : 24}"
        var jsonData = jsonStr.data(using: .utf8)!

        var jsonDic = try? JSONSerialization.jsonObject(with: jsonData, options: []) as! [String : Any]

        var name = jsonDic!["name"] as! String
        var age = jsonDic!["age"] as! Int

        print("")
    }

    func jsonParseSwiftyJson()
    {
        var jsonStr = "{\"name\" : \"dogukan\", \"age\" : 24}"
        var jsonData = jsonStr.data(using: .utf8)!

        let json = try? JSON(data: jsonData)

        var name = json!["name"].stringValue
        var age = json!["age"].intValue

        print("")
    }
    
    func jsonParseJsonSerializationTwo()
    {
        var jsonStr = "{\"stream\":{\"status\":\"0\",\"bitrate\":\"128\",\"type\":\"audio/mpeg\",\"title\":\"b l u e s\",\"songTitle\":\"popa chubby - people's blues(big, bad and beautiful -live)\",\"listenerCount\":\"1\",\"url\":\"http://sourberry.org/;stream.mp3\"},\"lastup\":\"1643619619\",\"track\":{\"id\":0,\"title\":\"people's blues(big, bad and beautiful\",\"artist\":{\"id\":0,\"name\":\"popa chubby\"}}}"
        var jsonData = jsonStr.data(using: .utf8)!
        var jsonDic = try? (JSONSerialization.jsonObject(with: jsonData, options: []) as! [String : Any])

        var track = jsonDic!["track"] as! [String : Any]
            var trackTitle = track["title"] as! String
            var trackId = track["id"] as! Int
            var trackArtist = track["artist"] as! [String : Any]
                var artistName = trackArtist["name"] as! String
                var artistId = trackArtist["id"] as! Int

        var lastup = jsonDic!["lastup"] as! String

        var stream = jsonDic!["stream"] as! [String : Any]
            var streamTitle = stream["title"] as! String
            var streamType = stream["type"] as! String
            var streamListenerCount = stream["listenerCount"] as! String
            var streamSongTitle = stream["songTitle"] as! String
            var streamUrl = stream["url"] as! String
            var streamBitrate = stream["bitrate"] as! String
            var streamStatus = stream["status"] as! String

        print("")
    }
    
    func jsonParseSwiftyJsonTwo()
    {
        let jsonStr = "{\"stream\":{\"status\":\"0\",\"bitrate\":\"128\",\"type\":\"audio/mpeg\",\"title\":\"b l u e s\",\"songTitle\":\"popa chubby - people's blues(big, bad and beautiful -live)\",\"listenerCount\":\"1\",\"url\":\"http://sourberry.org/;stream.mp3\"},\"lastup\":\"1643619619\",\"track\":{\"id\":0,\"title\":\"people's blues(big, bad and beautiful\",\"artist\":{\"id\":0,\"name\":\"popa chubby\"}}}"
        var jsonData = jsonStr.data(using: .utf8)!

        let json = try? JSON(data: jsonData)

        var track = json!["track"]
            var trackTitle = track["title"].stringValue
            var trackId = track["id"].intValue
            var trackArtist = track["artist"]
                var artistName = trackArtist["name"].stringValue
                var artistId = trackArtist["id"].stringValue
        

        var lastup = json!["lastup"].stringValue

        var stream = json!["stream"]
            var streamTitle = stream["title"].stringValue
            var streamType = stream["type"].stringValue
            var streamListenerCount = stream["listenerCount"].stringValue
            var streamSongTitle = stream["songTitle"].stringValue
            var streamUrl = stream["url"].stringValue
            var streamBitrate = stream["bitrate"].stringValue
            var streamStatus = stream["status"].stringValue

        print("")
    }
    
    func objectParseSwifty()
    {
        var jsonStr = "{\"name\" : \"dogukan\", \"age\" : 24}"
        var jsonData = jsonStr.data(using: .utf8)!

        let json = try? JSON(data: jsonData)

        var person = Person()
//        p.name = json!["name"].stringValue
//        p.age = json!["age"].intValue
//        person.fromJson(json: json!)

        print("")
    }
    
    func jsonParseCodable()
    {
        var jsonStr = "{\"name\" : \"dogukan\", \"age\" : 24}"
        var jsonData = jsonStr.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        let person = try? decoder.decode(Person.self, from: jsonData)
        
//        object to json
        let jsonData2 = try? JSONEncoder().encode(person)
        let jsonStr2 = String(data: jsonData2!, encoding: .utf8)
        
        print("")
    }
    
    func jsonParseSwiftyJsonThree()
    {
        let jsonStr = "{\"stream\":{\"status\":\"0\",\"bitrate\":\"128\",\"type\":\"audio/mpeg\",\"title\":\"b l u e s\",\"songTitle\":\"popa chubby - people's blues(big, bad and beautiful -live)\",\"listenerCount\":\"1\",\"url\":\"http://sourberry.org/;stream.mp3\"},\"lastup\":\"1643619619\",\"track\":{\"id\":7,\"title\":\"people's blues(big, bad and beautiful\",\"artist\":{\"id\":0,\"name\":\"popa chubby\"}}}"

        let jsonData = jsonStr.data(using: .utf8)!
        let json = try? JSON(data: jsonData)

        let myArtist = Artist()
        let myTruck = Track()
        let myStream = Stream()
        let myObject = Song()

        let track = json!["track"]
            myTruck.title = track["title"].stringValue
            myTruck.id = track["id"].intValue
            let trackArtist = track["artist"]
                myArtist.name = trackArtist["name"].stringValue
                myArtist.id = trackArtist["id"].intValue

        let stream = json!["stream"]
            myStream.title = stream["title"].stringValue
            myStream.type = stream["type"].stringValue
            myStream.listenerCount = stream["listenerCount"].stringValue
            myStream.songTitle = stream["songTitle"].stringValue
            myStream.url = stream["url"].stringValue
            myStream.bitrate = stream["bitrate"].stringValue
            myStream.status = stream["status"].stringValue

        myObject.lastup = json!["lastup"].stringValue
        
        myTruck.artist = myArtist
        myObject.track = myTruck
        myObject.stream = myStream

        print("")
    }
    
    func jsonParseCodableThree()
    {
        let jsonStr = "{\"stream\":{\"status\":\"0\",\"bitrate\":\"128\",\"type\":\"audio/mpeg\",\"title\":\"b l u e s\",\"songTitle\":\"popa chubby - people's blues(big, bad and beautiful -live)\",\"listenerCount\":\"1\",\"url\":\"http://sourberry.org/;stream.mp3\"},\"lastup\":\"1643619619\",\"track\":{\"id\":7,\"title\":\"people's blues(big, bad and beautiful\",\"artist\":{\"id\":0,\"name\":\"popa chubby\"}}}"
        var jsonData = jsonStr.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        
        let myObject = try? decoder.decode(Song.self, from: jsonData)
        
//        object to json
//        let jsonData2 = try? JSONEncoder().encode(myObject)
//        let jsonStr2 = String(data: jsonData2!, encoding: .utf8)
        
        print("")
    }
    
    func sendRequest()
    {
        let url = URL(string: "https://api.sourberry.org/status?format=json")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            
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
                        let myObject = try? JSONDecoder().decode(Song.self, from: data!)
                        print(json)
                        
                        DispatchQueue.main.async {
                            self.textView.text = String(data: data!, encoding: .utf8)
                        }
                        
                    }
                }
                catch
                {
                    
                }
            }
        }.resume()
    }
    
    func sendRequestTwo()
    {
        let url = URL(string: "https://api.sourberry.org/status?format=json")!
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        
        var header = [String : String]()
        header["Content-Type"] = "application/json"
        request.allHTTPHeaderFields = header
        
        request.httpMethod = "post" // default "get"
        
        let parameters : [String : Any] =
        [
            "username" : "nick",
            "password" : "passwd"
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
                        let myObject = try? JSONDecoder().decode(Song.self, from: data!)
                        print(json)
                        
                        DispatchQueue.main.async {
                            self.textView.text = String(data: data!, encoding: .utf8)
                        }
                        
                    }
                }
                catch
                {
                    
                }
            }
            print("service call is over")
        }
    }
    
    func sendRequestX()
    {
        let url = URL(string: "http://213.128.70.26:8013/api/Version/CheckState")!
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 32)
        
        var header = [String : String]()
        header["Content-Type"] = "application/json"
        request.allHTTPHeaderFields = header
        
        request.httpMethod = "post" // default "get"
        
        let parameters : [String : Any] =
        [
            "version" : "1.0.1",
            "platform" : "I"
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
                        let myX = try? JSONDecoder().decode(xObject.self, from: data!)
                        print(json)
                        
                        DispatchQueue.main.async {
                            self.textView.text = "\(String(describing: myX?.status?.code))"
                        }
                    }
                }
                catch
                {
                    
                }
            }
            print("service call is over")
        }.resume()
    }
    
    func sendRequestPP()
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
                        let mysd = try? JSONDecoder().decode(mySD.self, from: data!)
                        print(json)
                        
                        DispatchQueue.main.async {
                            self.textView.text = "\(String(describing: mysd?.data?.token!))"
                        }
                    }
                }
                catch
                {
                    
                }
            }
            print("service call is over")
        }.resume()
        
        /*
         {
            "status":
             {
                 "code":200,
                 "value":""
             },
            "data":
             {
                 "token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJZCI6IjE5NyIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL2VtYWlsYWRkcmVzcyI6IjEyMzQ1Njc4OSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6Ik1lbWJlciIsIkJyYW5jaElkIjoiMCIsIlJvbGVJZCI6IjAiLCJMYW5ndWFnZUlkIjoiMyIsImp0aSI6IjUxZGFjN2U3LTZkYjUtNDFiMS1iMWVkLTNiYTNlMGZmODIzYSIsImV4cCI6MTY0MzgxMDEwNiwiaXNzIjoid3d3LkJ1eXVyLmNvbSIsImF1ZCI6Ind3dy5CdXl1ci5jb20ifQ.KMqDC6VePipY5JwC5ZU49YjucJa7DSfyiAFIxFlRqc0",
                 "socialRememberToken":null,
                 "phone":"123456789",
                 "languageId":3
             }
         }
         */

    }
}

class mySD : Codable
{
    var status : SDstatus?
    var data : SDdata?
}

class SDstatus : Codable
{
    var code : Int?
    var value : String?
}

class SDdata : Codable
{
    var token : String?
    var srt : String?
    var phone : String?
    var languageId : Int?
}

class xObject : Codable
{
    var status : MyStatus?
    var data : MyData?
}

class MyStatus : Codable
{
    var code : Int?
    var value : String?
}

class MyData : Codable
{
    var isProd : Bool?
    var hasUpdate : Bool?
    var isRequired : Bool?
}

class Person : Codable
{
    var name : String?
    var age : Int?
    
    private enum CodingKeys : String, CodingKey
    {
        case name = "name", age = "age"
    }
    
    func fromJson(json : JSON)
    {
        name = json["name"].stringValue
        age = json["age"].intValue
    }
}

class Song : Codable
{
    var track : Track!
    var lastup : String!
    var stream : Stream!
    
    private enum CodingKeys : String, CodingKey
    {
        case track = "track", lastup = "lastup", stream = "stream"
    }
    
    func fromJson(json : JSON)
    {
        track = Track()
        track.fromJson(json: json["track"])
        lastup = json["lastup"].stringValue
        stream = Stream()
        stream.fromJson(json: json["stream"])
    }
}

class Track : Codable
{
    var artist : Artist!
    var title : String!
    var id : Int!
    
    private enum CodingKeys : String, CodingKey
    {
        case artist = "artist", title = "title", id = "id"
    }
    
    func fromJson(json : JSON)
    {
        artist = Artist()
        artist.fromJson(json: json["artist"])
        title = json["title"].stringValue
        id = json["id"].intValue
    }
}

class Stream : Codable
{
    var title : String!
    var type : String!
    var listenerCount : String!
    var songTitle : String!
    var url : String!
    var bitrate : String!
    var status : String!
    
    private enum CodingKeys : String, CodingKey
    {
        case title = "title", type = "type", listenerCount = "listenerCount", songTitle = "songTitle", url = "url", bitrate = "bitrate", status = "status"
    }
    
    func fromJson(json : JSON)
    {
        title = json["title"].stringValue
        type = json["type"].stringValue
        listenerCount = json["listenerCount"].stringValue
        songTitle = json["songTitle"].stringValue
        url = json["url"].stringValue
        bitrate = json["bitrate"].stringValue
        status = json["status"].stringValue
    }
}

class Artist : Codable
{
    var name : String!
    var id : Int!
    
    private enum CodingKeys : String, CodingKey
    {
        case name = "name", id = "id"
    }
    
    func fromJson(json : JSON)
    {
        name = json["name"].stringValue
        id = json["id"].intValue
    }
}


