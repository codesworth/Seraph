//
//  AssetLoaderLogger.swift
//  Seraph
//
//  Created by Shadrach Mensah on 03/01/2020.
//  Copyright © 2020 Shadrach Mensah. All rights reserved.
//

import Foundation


struct AssetLoaderLogger {
    
    static func log(err:Error, in domain:String){
         print("AssetLoader Error in \(domain). Error occurred with signature: \(err.localizedDescription)")
    }
}
