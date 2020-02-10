//
//  DownloaderTask.swift
//  Seraph
//
//  Created by Shadrach Mensah on 02/01/2020.
//  Copyright © 2020 Shadrach Mensah. All rights reserved.
//

import Foundation


open class AssetDownloadTask:NSObject, AssetDownloaderTaskProtocol{
    

    let task:URLSessionDownloadTask
    
    
    init(task:URLSessionDownloadTask) {
        self.task = task
        
    }
    
    
    public func resume(){
        task.resume()
    }
    
    public func cancel(){
        task.cancel()
    }
}


