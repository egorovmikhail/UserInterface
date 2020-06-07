//
//  APIRequests.swift
//  VK
//
//  Created by Михаил Егоров on 17.05.2020.
//  Copyright © 2020 Михаил Егоров. All rights reserved.
//

import Foundation
import RealmSwift

class APIReguests {
    func friendGet(completion: @escaping () -> Void) {
        let configuration = URLSessionConfiguration.default
        var urlConstructor = URLComponents()
        let session =  URLSession(configuration: configuration)
        urlConstructor.scheme = "https"
        urlConstructor.host = "api.vk.com"
        urlConstructor.path = "/method/friends.get"
        urlConstructor.queryItems = [
            URLQueryItem(name: "user_ids", value: "\(Session.session.userId)"),
            URLQueryItem(name: "access_token", value: "\(Session.session.token)"),
            URLQueryItem(name: "order", value: "name"),
            URLQueryItem(name: "count", value: "5000"),
            URLQueryItem(name: "fields", value: "bdate,city,domain,photo_50"),
            URLQueryItem(name: "name_case", value: "nom"),
            URLQueryItem(name: "v", value: "5.103")
        ]
        var request = URLRequest(url: urlConstructor.url!)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request, completionHandler: { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data else {return}
                
                do {
                    let user = try JSONDecoder().decode(User.self, from: data).response.items
                    self.saveUserData(user)
                    completion()
                } catch {
                    print(error)
                }
            }
        })
        task.resume()
    }
    
    func saveUserData(_ users: [UserItem]) {
        do {
            let realm = try Realm()
            print(realm.configuration.fileURL as Any)
            
            let oldUser = realm.objects(UserItem.self)
            realm.beginWrite()
            realm.delete(oldUser)
            realm.add(users)
            try realm.commitWrite()
        } catch {
            print(error)
        }
    }
    
    
    
    
    func photoGet(idUser: Int, completion: @escaping ([PhotoItem]) -> Void) {
        let configuration = URLSessionConfiguration.default
        var urlConstructor = URLComponents()
        let session =  URLSession(configuration: configuration)
        urlConstructor.scheme = "https"
        urlConstructor.host = "api.vk.com"
        urlConstructor.path = "/method/photos.getAll"
        urlConstructor.queryItems = [
            URLQueryItem(name: "user_ids", value: "\(Session.session.userId)"),
            URLQueryItem(name: "access_token", value: "\(Session.session.token)"),
            URLQueryItem(name: "owner_id", value: "\(idUser)"),
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "v", value: "5.103")
        ]
        var request = URLRequest(url: urlConstructor.url!)
        request.httpMethod = "GET"
        let task = session.dataTask(with: request, completionHandler: { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data else {return}
                
                do {
                    let photo = try JSONDecoder().decode(Photo.self, from: data).response.items
                    completion(photo)
                    print(photo)
                } catch {
                    print(error)
                }
            }
        })
        task.resume()
    }
    
    func gruopGet() {
        let configuration = URLSessionConfiguration.default
        var urlConstructor = URLComponents()
        let session =  URLSession(configuration: configuration)
        urlConstructor.scheme = "https"
        urlConstructor.host = "api.vk.com"
        urlConstructor.path = "/method/groups.get"
        urlConstructor.queryItems = [
            URLQueryItem(name: "user_ids", value: "\(Session.session.userId)"),
            URLQueryItem(name: "access_token", value: "\(Session.session.token)"),
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "fields", value: "photo_50"),
            URLQueryItem(name: "v", value: "5.103")
        ]
        var request = URLRequest(url: urlConstructor.url!)
        request.httpMethod = "GET"
        let task = session.dataTask(with: request, completionHandler: { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data else {return}
                
                do {
                    let group = try JSONDecoder().decode(Group.self, from: data).response.items
                    self.saveGroupData(group)
                } catch {
                    print(error)
                }
            }
        })
        task.resume()
    }
    
    func saveGroupData(_ groups: [GroupItem]) {
        do {
            let realm = try Realm()
            let oldGroup = realm.objects(GroupItem.self)
            realm.beginWrite()
            realm.delete(oldGroup)
            realm.add(groups)
            try realm.commitWrite()
        } catch {
            print(error)
        }
    }
    
    func groupsSearchGet(q: String, completion: @escaping ([GroupItem]) -> Void) {
        let configuration = URLSessionConfiguration.default
        var urlConstructor = URLComponents()
        let session =  URLSession(configuration: configuration)
        urlConstructor.scheme = "https"
        urlConstructor.host = "api.vk.com"
        urlConstructor.path = "/method/groups.search"
        urlConstructor.queryItems = [
            URLQueryItem(name: "access_token", value: "\(Session.session.token)"),
            URLQueryItem(name: "q", value: "\(q)"),
            URLQueryItem(name: "v", value: "5.103")
        ]
        var request = URLRequest(url: urlConstructor.url!)
        request.httpMethod = "GET"
        let task = session.dataTask(with: request, completionHandler: { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data else {return}
                
                do {
                    let group = try JSONDecoder().decode(Group.self, from: data).response.items
                    completion(group)
                    print(group)
                } catch {
                    print(error)
                }
            }
        })
        task.resume()
    }
}





