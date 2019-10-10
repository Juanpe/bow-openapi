//  Copyright © 2019 The Bow Authors.

import Foundation


/// Get paths for testing
extension URL {
    private static var tests: URL { URL(fileURLWithPath: String(#file)).deletingLastPathComponent().deletingLastPathComponent() }
    private static var xcproj: URL { URL(fileURLWithPath: String(#file)).deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent() }
    
    static func temp(subfolder: String) -> URL { FileManager.default.temporaryDirectory.appendingPathComponent(subfolder) }
    static func currentFile(_ file: StaticString = #file) -> URL { URL(fileURLWithPath: "\(file)") }
    static let schemas = URL.tests.appendingPathComponent("__Snapshots__").appendingPathComponent("Schemas")
    static let templates = URL.xcproj.appendingPathComponent("Templates")
}

/// Concat to url path
extension URL {
    enum File: String {
        // api-client
        case noDefinedTags = "schema-no-tags.yaml"
        case tags = "schema-tags.yaml"
        case swagger = "schema-swagger.yaml"
        case openapi = "schema-openapi.yaml"
        case json = "schema-json.json"
        case yaml = "schema-yaml.yaml"
        
        // http operations
        case noDefinedOperationId = "schema-no-operationid.yaml"
        case post = "schema-post.yaml"
        case get = "schema-get.yaml"
        case put = "schema-put.yaml"
        case delete = "schema-delete.yaml"
        
        // parameters
        case pathParam = "schema-path-param.yaml"
        case queryParam = "schema-query-param.yaml"
        case headerParam = "schema-header-param.yaml"
        case bodyParam = "schema-body-param.yaml"
        case pathParamOptional = "schema-path-param-optional.yaml"
        case queryParamOptional = "schema-query-param-optional.yaml"
        case headerParamOptional = "schema-header-param-optional.yaml"
        case bodyParamOptional = "schema-body-param-optional.yaml"
        
        // models
        case referenceModel = "schema-request-reference.yaml"
    }
    
    func file(_ file: File) -> URL { appendingPathComponent(file.rawValue) }
}
