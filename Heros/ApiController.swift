//
//  ApiController.swift
//  Heros
//
//  Created by Marcelo Block Teixeira on 10/06/20.
//  Copyright © 2020 Marcelo Block Teixeira. All rights reserved.
//

import Foundation
import Alamofire
import SwiftHash



class ApiController: UIViewController {
    
    static private let basePath = "http://gateway.marvel.com/v1/public/comics?"
    static private let privateKey = "2941ebac384b5f5005040c1f61ee1978903c6987"
    static private let publicKey = "4b6411507aa8343c65b92f4239ae0d1a"
    static private let limit = 50
    
    class func getData(name: String?, page: Int=0, onComplete: @escaping (MArvelInfo?) -> Void) {
                let offset = page * limit
        let startsWith: String
        if let name = name, !name.isEmpty {
            startsWith = "titleStartsWith=\(name.replacingOccurrences(of: " ",with: ""))&"
        } else {
            startsWith =  ""
        }

        let url = basePath + "offset=\(offset)&limit=\(limit)&" + startsWith + getCredencials()
      
        AF.request(url).responseJSON { response in
            guard let data = response.data else {
                onComplete(nil)
                return
            }
            do {
                let marvelInfo = try JSONDecoder().decode(MArvelInfo.self, from: data)
                onComplete(marvelInfo)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    private class func getCredencials() -> String {
        let ts = String(Int(NSDate().timeIntervalSince1970))
        let hash = MD5(ts+privateKey+publicKey).lowercased()
        return "ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
    }

    

}
