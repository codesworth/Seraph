//
//  AssetDownloader.swift
//  Seraph
//
//  Created by Shadrach Mensah on 01/01/2020.
//  Copyright © 2020 Shadrach Mensah. All rights reserved.
//

import Foundation



class AssetDownloader:AssetDownloaderProtocol{
    
    
    let session:URLSession
    
    init(session:URLSession) {
        self.session = session
    }
    
    @discardableResult
    func download(from url:URL,completion:@escaping AssetDownloadCompletionHandler)->AssetDownloaderTaskProtocol{
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        let dataTask = session.downloadTask(with: request) { (url, _, err) in
            guard let url = url else {
                AssetLoaderLogger.log(err: NetworkError(err), in: #function)
                completion(.failure(NetworkError(err)))
                return
            }
            do{
                let data = try Data(contentsOf: url)
                completion(.success(data))
            }catch let err{
                AssetLoaderLogger.log(err: err, in: #function)
                completion(.failure(NetworkError(err)))
            }
        }
        let task = AssetDownloadTask(task: dataTask)
        task.resume()
        return task
    }
    
}




