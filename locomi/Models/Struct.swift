//
//  Struct.swift
//  locomi
//
//  Created by sogo on 2020/04/27.
//  Copyright © 2020 Sogo Nishihara. All rights reserved.
//

import Foundation


// postRegister
struct ResisterData: Encodable {
    
    var screen_name: String
    var name: String
    var email: String
    var password: String
    var password_confirmation: String
    
}

struct RegisterResponse: Codable {
    
    var status: String
    var messages: ValidateMessages?
    var data: RegisterResponseData?
    
}

struct RegisterResponseData: Codable {
    
    var id: String?
    var screen_name: String?
    var name: String?
    var email: String?
    var updated_at: String?
    var created_at: String?
    
}


// postFollow
struct FollowResponse: Decodable {
    
    var status: String
    var messages: ValidateMessages?
    var auth_message: String?
    var message: String?
    
}


// getFollows,getFollowers
struct FollowsResponse: Decodable {
    
    var status: String
    var messages: ValidateMessages?
    var data: [FollowsResponseData]?
    
}

struct FollowsResponseData: Decodable, Identifiable {
    
    var id: String
    var pivot: Pivot
    
}

struct Pivot: Decodable {
    
    var following_id: String
    var followed_id: String
    
}


// postLogin
struct LoginData: Encodable {
    
    var email: String
    var password: String
    
}

struct AuthResponse: Codable {
    
    var status: String
    var messages: ValidateMessages?
    var auth_message: String?
    var data: AuthResponseData?
    
}

struct AuthResponseData: Codable {
    
    var id: String
    var access_token: String
    var refresh_token: String
    
}


// getUsers
struct User: Codable, Identifiable {
    
    var id: String
    var screen_name: String
    var name: String
    var profile_image: String?
    var email: String
    var updated_at: String?
    var created_at: String?
    
}


// post
struct PostData: Codable {
    
    var lat: String
    var lng: String
    var text: String
    var release: String
    
}

struct PostResponse: Codable {
    
    var status: String
    var messages: ValidateMessages?
    var auth_message: String?
    var data: PostResponseData?
    
}

struct PostResponseData: Codable {
    
    var email: String?
    var password: String?
    var lat: String?
    var lng: String?
    var text: String?
    var release: String?
    var location: locationData?
    
}

struct locationData: Codable {
    
    var latitude: String?
    var longitude: String?
    
}


// getComics
struct Comic: Codable, Identifiable {
    
    var id: String
    var user_id: String
    var lat: Double
    var lng: Double
    var text: String
    var deleted_at: String?
    var created_at: String?
    var updated_at: String?
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case user_id
        case lat = "X(location)"
        case lng = "Y(location)"
        case text
        case deleted_at
        case created_at
        case updated_at
        
    }
    
}


// getComicDetail
struct ComicDetailResponse: Codable {
    
    var status: String
    var messages: ValidateMessages?
    var auth_message: String?
    var data: ComicDetailResponseData?
    
}

struct ComicDetailResponseData: Codable {
    
    var comic: [Comic]
    var comments: [Comment]?
    var favorites: [Favorite]?
    
}


// getComments
struct Comment: Codable, Identifiable {
    
    var id: String
    var user_id: String
    var comic_id: String
    var text: String
    var deleted_at: String?
    var created_at: String
    var updated_at: String
    
}


// getFavorite
struct Favorite: Codable, Identifiable {
    
    var id: String
    var user_id: String
    var comic_id: String
    
}


// postComment
struct CommentData: Codable {
    
    var comic_id: String
    var text: String
    
}

struct CommentResponse: Codable {
        
    var status: String
    var messages: ValidateMessages?
    var auth_message: String?
    var message: String?
    
}


// postFavorite
struct FavoriteData: Codable {
    
    var comic_id: String
    
}

struct FavoriteResponse: Codable {
    
    var status: String
    var messages: ValidateMessages?
    var auth_message: String?
    var message: String?
    var isOK: Bool?
    
}


// Versatility messages template
struct ValidateMessages: Codable {
    
    var screen_name: [String]?
    var name: [String]?
    var email: [String]?
    var password: [String]?
    var password_confirmation: [String]?
    var lat: [String]?
    var lng: [String]?
    var text: [String]?
    var release: [String]?
    
}

struct IdList: Identifiable {
    
    var id: String
    
}
