//
//  ViewController.swift
//  16_WebServices
//
//  Created by Dogukan Berk Ozer on 31.01.2022.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        jsonParseJsonSerialization()
//        jsonParseSwiftyJson()
//        jsonParseJsonSerializationTwo()
//        jsonParseSwiftyJsonTwo()
//        jsonParseCodable()
        
        jsonParseSwiftyJsonThree()
        jsonParseCodableThree()
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
        let myObject = MyObject()

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
        
        let myObject = try? decoder.decode(MyObject.self, from: jsonData)
        
//        object to json
//        let jsonData2 = try? JSONEncoder().encode(myObject)
//        let jsonStr2 = String(data: jsonData2!, encoding: .utf8)
        
        print("")
    }
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

class MyObject : Codable
{
    var track : Track!
//    var lastup : Lastup!
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


