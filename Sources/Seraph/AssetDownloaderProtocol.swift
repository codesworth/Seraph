//
//  AssetDownloaderProtocol.swift
//  Seraph
//
//  Created by Shadrach Mensah on 03/01/2020.
//  Copyright © 2020 Shadrach Mensah. All rights reserved.
//

import Foundation

public typealias AssetResult = Result<Data,NetworkError>

public typealias AssetDownloadCompletionHandler = (AssetResult) -> ()


public protocol AssetDownloaderTaskProtocol {
    
    func resume()
    
    func cancel()
    
}

public protocol AssetDownloaderProtocol {
    @discardableResult
    func download(from url:URL,completion:@escaping AssetDownloadCompletionHandler)->AssetDownloaderTaskProtocol
    
}
