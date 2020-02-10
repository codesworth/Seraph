//
//  AssetCache.swift
//  Seraph
//
//  Created by Shadrach Mensah on 01/01/2020.
//  Copyright © 2020 Shadrach Mensah. All rights reserved.
//

import Foundation

open class AssetCache {
    
    static private(set) var main = AssetCache(name: "mainCache",config: Configuration())
    
    private let secondsInOneDay:TimeInterval = 86_400
    private let cache = NSCache<NSString,AssetCacheObject>()
    let config:Configuration
    let name:String
    
    
    
    init(name:String,config:Configuration){
        self.config = config
        self.name = name
        cache.name = name
        cache.countLimit = config.maxCapacity
    }
    
    
    
    public func set(object:Data, for key:String){
        let assetObject = AssetCacheObject(value: object, expiration: Date().addingTimeInterval(secondsInOneDay))
        set(object: assetObject, for: key)
    }
    
    func set(object:AssetCacheObject, for key:String){
        cache.setObject(object, forKey: key as NSString)
    }
    
    func getObject(for key:String)->AssetCacheObject?{
        let key = key as NSString
        guard let object = cache.object(forKey: key) else{
            return nil
        }
        
        if object.expirationDate < Date(){
            cache.removeObject(forKey: key)
            return nil
        }
        return object
    }
    
}




extension AssetCache{
    
    final class AssetCacheObject: NSObject {
        let value:Data
        let expirationDate:Date
        
        init(value:Data, expiration:Date) {
            self.value = value
            self.expirationDate = expiration
        }
    }
}


extension AssetCache{
    
    struct Configuration {
        let maxCapacity:Int
        
        init(maxCapacity:Int = 20) {
            self.maxCapacity = maxCapacity
        }
    }
}
