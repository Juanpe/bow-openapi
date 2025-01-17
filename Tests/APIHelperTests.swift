//  Copyright © 2019 The Bow Authors.

import XCTest
import SwiftCheck


class APIHelperTests: XCTestCase {
    let allPresentGen: Gen<[String: String?]>  = [String: String].arbitrary.map { dict in dict.mapValues { x in x as String? } }
    let nonePresentGen: Gen<[String: String?]> = [String: String?].arbitrary.map { dict in dict.mapValues { _ -> String? in nil } }
    
    func testQueryItems() {
        property("encodingValues remove nil values") <- forAll(self.allPresentGen, self.nonePresentGen) { (present, absent) in
            let both: [String: Any?] = present.combine(absent).any
            let removed: [String: String]  = both.encodingValues
            let expected: [String: String] = present.any.encodingValues
            
            return removed == expected
        }
        
        property("toQueryItems remove nil values") <- forAll(self.allPresentGen, self.nonePresentGen) { (present, absent) in
            let both: [String: Any?] = present.combine(absent).any
            let removed: Set<URLQueryItem>  = Set(both.toQueryItems ?? [])
            let expected: Set<URLQueryItem> = Set(present.any.toQueryItems ?? [])
            
            return removed == expected
        }
        
        property("Only items with nil values generate an empty URLQueryItem") <- forAll(self.nonePresentGen) { (absent) in
            return absent.any.toQueryItems == nil
        }
    }
}


// MARK: helpers
fileprivate extension Dictionary {
    var any: [Key: Any?] { mapValues { x in x as Any? } }
}
