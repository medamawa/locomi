//
//  APIRequest.swift
//  locomi
//
//  Created by sogo on 2020/04/27.
//  Copyright © 2020 Sogo Nishihara. All rights reserved.
//

import Foundation

struct  APIRequest {
    
    func postRegister (_ dataToRegist: ResisterData) {
        
        do {
            
            guard let url = URL(string: "https://locomi.herokuapp.com/api/register") else { return }
            
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = try JSONEncoder().encode(dataToRegist)
            
            URLSession.shared.dataTask(with: urlRequest) { (jsonData, _, _) in
                
                let data = try! JSONDecoder().decode(RegisterResponse.self, from: (jsonData)!)
                
                print(data)
                print(type(of: data))
                
            }.resume()
            
        } catch {
            return
        }
        
    }
    
    func postLogin (_ dataToRegist: LoginData) {
        
        do {
            
            guard let url = URL(string: "https://locomi.herokuapp.com/api/login") else { return }
            
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = try JSONEncoder().encode(dataToRegist)
            
            URLSession.shared.dataTask(with: urlRequest) { (jsonData, _, _) in
                
                let data = try! JSONDecoder().decode(LoginResponse.self, from: (jsonData)!)
                
                print(data)
                print(data.data?.access_token ?? "")
                print(data.data?.id ?? "")
                
                AccessToken().saveToken(token: data.data?.access_token ?? "")
                UserID().saveID(id: data.data?.id ?? "")
                
            }.resume()
            
        } catch {
            
            return
            
        }
        
    }
    
    func postFollow (_ id: String) {
        
        guard let url = URL(string: "https://locomi.herokuapp.com/api/follow?id=\(id)") else { return }
        
        let token = AccessToken().getToken()
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: urlRequest) { (jsonData, _, error) in
            
            let data = try! JSONDecoder().decode(FollowResponse.self, from: jsonData!)
            
            print(data)
            
        }.resume()
        
    }
    
    func getFollows (completion: @escaping ([FollowsResponseData]) -> ()) {
        
        guard let url = URL(string: "https://locomi.herokuapp.com/api/follows") else { return }
        let token = AccessToken().getToken()

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("bearer \(token)", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: urlRequest) { (jsonData, _, _) in
            
            let follows = try! JSONDecoder().decode(FollowsResponse.self, from: jsonData!)
            let follow_ids = follows.data ?? []
            
            DispatchQueue.main.async {
                completion(follow_ids)
            }
            
        }.resume()
        
    }
    
    func getFollowers (completion: @escaping ([FollowsResponseData]) -> ()) {
        
        guard let url = URL(string: "https://locomi.herokuapp.com/api/followers") else { return }
        let token = AccessToken().getToken()

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("bearer \(token)", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: urlRequest) { (jsonData, _, _) in
            
            let followers = try! JSONDecoder().decode(FollowsResponse.self, from: jsonData!)
            let follower_ids = followers.data ?? []
            
            DispatchQueue.main.async {
                completion(follower_ids)
            }
            
        }.resume()
        
    }
    
    func getUsers (completion: @escaping ([User]) -> ()) {
        
        guard let url = URL(string: "https://locomi.herokuapp.com/api/users") else { return }
        
        URLSession.shared.dataTask(with: url) { (jsonData, _, _) in
            
            let users = try! JSONDecoder().decode([User].self, from: jsonData!)
            
            DispatchQueue.main.async {
                completion(users)
            }
            
        }.resume()
        
    }
    
    func getSpecifiedUser (_ id: String, completion: @escaping ([User]) -> ()) {
        
        guard let url = URL(string: "https://locomi.herokuapp.com/api/users/\(id)") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
            let user = try! JSONDecoder().decode([User].self, from: data!)
            
            print("### getSpecifiedUserデバッグ")
            print(id)
            print(user)
            print("###")
            
            DispatchQueue.main.async {
                completion(user)
            }
            
        }.resume()
        
    }
    
    func getUser (completion: @escaping (User) -> ()) {

        do {

            guard let url = URL(string: "https://locomi.herokuapp.com/api/user") else { return }
            let token = AccessToken().getToken()
            print(token)

            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "GET"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.addValue("bearer \(token)", forHTTPHeaderField: "Authorization")

            URLSession.shared.dataTask(with: urlRequest) { (jsonData, _, _) in

                let data = try! JSONDecoder().decode(User.self, from: jsonData!)

                print(data)
                print(type(of: data))

                DispatchQueue.main.async {
                    completion(data)
                }

            }.resume()

        }

    }
    
    func post (_ dataToPost: PostData) {
        
        do {
            
            guard let url = URL(string: "https://locomi.herokuapp.com/api/post") else { return }
            
            let token = AccessToken().getToken()
            
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.addValue("bearer \(token)", forHTTPHeaderField: "Authorization")
            urlRequest.httpBody = try JSONEncoder().encode(dataToPost)
            
            URLSession.shared.dataTask(with: urlRequest) { (jsonData, _, error) in
                
                let data = try! JSONDecoder().decode(PostResponse.self, from: jsonData!)

                print(data)
                print(type(of: data))
                
            }.resume()
            
        } catch {
            return
        }
        
    }
    
    func getComics(completion: @escaping ([Comic]) -> ()) {
        
        guard let url = URL(string: "https://locomi.herokuapp.com/api/comics") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
            let comics = try! JSONDecoder().decode([Comic].self, from: data!)
            
            print(comics)
            
            DispatchQueue.main.async {
                completion(comics)
            }
            
        }.resume()
        
    }
    
    func getComicDetail (_ id: String, completion: @escaping (ComicDetailResponseData) -> ()) {
        
        guard let url = URL(string: "https://locomi.herokuapp.com/api/comics/\(id)") else { return }
        
        URLSession.shared.dataTask(with: url) { (jsonData, _, _) in
            
            let comic = try! JSONDecoder().decode(ComicDetailResponse.self, from: jsonData!)
            let comic_data = comic.data
            
            print("### getComicDetailデバッグ")
            print(comic_data)
            print("###")
            
            DispatchQueue.main.async {
                completion(comic_data!)
            }
            
        }.resume()
        
    }
    
    func postFavorite (_ dataToFavorite: FavoriteData) {
        
        do {
         
            guard let url = URL(string: "https://locomi.herokuapp.com/api/favorite") else { return }
            
            let token = AccessToken().getToken()
            
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.addValue("bearer \(token)", forHTTPHeaderField: "Authorization")
            urlRequest.httpBody = try JSONEncoder().encode(dataToFavorite)
            
            URLSession.shared.dataTask(with: urlRequest) { (jsonData, _, error) in
                
                let data = try! JSONDecoder().decode(FavoriteResponse.self, from: jsonData!)
                
                print(data)
                
            }.resume()
            
        } catch {
            
            return
            
        }
        
    }
    
}
