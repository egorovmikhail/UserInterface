//
//  APIRequests.swift
//  VK
//
//  Created by Михаил Егоров on 17.05.2020.
//  Copyright © 2020 Михаил Егоров. All rights reserved.
//

import Foundation

class APIReguests { 
    func friendGet(completion: @escaping ([UserItem]) -> Void) {
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
            
            do {
                let users = try JSONDecoder().decode(User.self, from: data!).response.items
                print(users)
            } catch {
                print(error)
            }
            
        })
            task.resume()
    }
    
    func photoGet(completion: @escaping ([PhotoItem]) -> Void) {
        let configuration = URLSessionConfiguration.default
        var urlConstructor = URLComponents()
        let session =  URLSession(configuration: configuration)
        urlConstructor.scheme = "https"
        urlConstructor.host = "api.vk.com"
        urlConstructor.path = "/method/photos.getAll"
        urlConstructor.queryItems = [
            URLQueryItem(name: "user_ids", value: "\(Session.session.userId)"),
            URLQueryItem(name: "access_token", value: "\(Session.session.token)"),
            URLQueryItem(name: "owner_id", value: "33776620"),
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "v", value: "5.103")
        ]
        var request = URLRequest(url: urlConstructor.url!)
        request.httpMethod = "GET"
        let task = session.dataTask(with: request) { (data, response, error) in
            let json = try? JSONDecoder().decode(Photo.self, from: data!).response.items
            print(json as Any)
        }
        task.resume()
    }
    
    func gruopGet(completion: @escaping ([GroupItem]) -> Void) {
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
        let task = session.dataTask(with: request) { (data, response, error) in
            let json = try? JSONDecoder().decode(Group.self, from: data!).response.items
            print(json as Any)
        }
        task.resume()
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
        let task = session.dataTask(with: request) { (data, response, error) in
            let json = try? JSONDecoder().decode(Group.self, from: data!).response.items
            print(json as Any)
        }
        task.resume()
    }
}
