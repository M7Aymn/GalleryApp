//
//  GalleryService.swift
//  GalleryApp
//
//  Created by Mohamed Ayman on 18/11/2024.
//

import Foundation
import Moya

enum GalleryService {
    case users
    case user(id: Int)
    case albums(userID: Int)
    case photos(albumID: Int)
}

extension GalleryService: TargetType {
    var baseURL: URL {
        return URL(string: "https://jsonplaceholder.typicode.com")!
    }
    
    var path: String {
        switch self {
        case .users, .user:
            return "/users"
        case .albums:
            return "/albums"
        case .photos:
            return "/photos"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        switch self {
        case .users:
            return .requestPlain
            
        case .user(id: let id):
            return .requestParameters(parameters: ["id": id], encoding: URLEncoding.queryString)
            
        case .albums(userID: let userID):
            return .requestParameters(parameters: ["userID": userID], encoding: URLEncoding.queryString)
            
        case .photos(albumID: let albumID):
            return .requestParameters(parameters: ["albumId": albumID], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
