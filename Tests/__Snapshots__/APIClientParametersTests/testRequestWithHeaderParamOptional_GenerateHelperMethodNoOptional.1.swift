//
//  APIs.swift
//
//  Generated by bow-openapi
//  Copyright © 2020 Bow Authors. All rights reserved.
//

import Foundation

public class API {}


/// Helpers for update the headers in `API.Config`
extension API.Config {

    public func appending(headers: [String: String]) -> API.Config {
        self.copy(headers: self.headers.combine(headers))
    }
    
    public func appending(contentType: API.ContentType) -> API.Config {
        self.copy(headers: self.headers.combine(contentType.headers))
    }
    
    public func appendingHeader(value: String, forKey key: String) -> API.Config {
        self.copy(headers: self.headers.combine([key: value]))
    }
}


extension API.Config {

    public func appendingHeader(petIdTesting: Int) -> API.Config {
        self.copy(headers: self.headers.combine(["pet-Id-Testing": petIdTesting]))
    }
}