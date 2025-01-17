//
//  PetDocumented.swift
//
//  Generated by bow-openapi
//  Copyright © 2020 Bow Authors. All rights reserved.
//

import Foundation


/// A pet for sale in the pet store
public struct PetDocumented: Codable {

    public enum Status: String, Codable { 
        case available = "available"
        case pending = "pending"
        case sold = "sold"
    }

    public let _id: Int64?
    public let name: String
    /// pet docs for photoUrls
    public let photoUrls: [String]
    /// pet status in the store
    public let status: Status?

    public init(_id: Int64?, name: String, photoUrls: [String], status: Status?) {
        self._id = _id
        self.name = name
        self.photoUrls = photoUrls
        self.status = status
    }

    public enum CodingKeys: String, CodingKey { 
        case _id = "id"
        case name
        case photoUrls
        case status
    }
}
