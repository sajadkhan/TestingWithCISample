//
//  TestableCode.swift
//  TestingSample
//
//  Created by Sajad on 7/22/18.
//  Copyright © 2018 Sajad. All rights reserved.
//

import Foundation

class TestableCode {
    func addnumbers(numberOne: Int, numberTwo: Int) -> Int {
        return numberOne + numberTwo
    }
    
    func searchRepoOnGithub(forText text: String, completionHanlder: @escaping (Bool, [SearchResultItem]?) -> Void) {
        let request = GithubRequest()
        request.requestSearchAPI(for: .repo, searchText: text, sort: nil, order: nil) { searchResultItems in
            if searchResultItems != nil {
                completionHanlder(true, searchResultItems)
            } else {
                completionHanlder(false, nil)
            }
            
        }
    }
    
    func parseSomeHeavyJson() {
        let fileURL = Bundle.main.url(forResource: "bigJson", withExtension: ".json")
        let jsonData: Data? = nil // = try? Data(contentsOf: fileURL!)
        _ = try? JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableLeaves)
        //print("parsed json = \(jsonParsed)")
    }
}
