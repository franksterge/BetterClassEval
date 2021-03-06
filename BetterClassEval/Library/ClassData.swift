//
// Created by Rico Wang on 2018-12-08.
// Copyright (c) 2018 Group_5. All rights reserved.
//

import Foundation
import FirebaseCore
import FirebaseDatabase

struct ClassData: CustomDebugStringConvertible {
    let key: String
    let className: String
    let lecturer: String
    let quarter: String
    let enrolled: Int
    let surveyed: Int
    let statistics: [String : Any]

    var debugDescription: String

    
    /// Empty object
    init() {
        self.key = ""
        self.className = ""
        self.lecturer = ""
        self.quarter = ""
        self.enrolled = 0
        self.surveyed = 0
        self.statistics = [:]

        self.debugDescription = "key = \(self.key)\n" +
                "class = \(self.className)\n" +
                "lecturer = \(self.lecturer)\n" +
                "quarter = \(self.quarter)\n" +
                "enrolled = \(String(self.enrolled))\n" +
                "surveyed = \(String(self.surveyed))\n" +
                "statistics = \(self.statistics.debugDescription)"
    }
    
    
    /// Make object from raw data.
    /// Deprecated.
    /// Created by Rico
    ///
    /// - Parameter rawData: DataSnapshot from Firebase.
    init(_ rawData: DataSnapshot) {
        self.key = rawData.key

        let data = rawData.value as! NSDictionary
        self.className = data["class"] as! String
        self.lecturer = data["lecturer"] as! String
        self.quarter = data["quarter"] as! String
        self.enrolled = Int(data["enrolled"] as! String)!
        self.surveyed = Int(data["surveyed"] as! String)!
        self.statistics = data["statistics"] as! [String : [String]]

        self.debugDescription = "key = \(self.key)\n" +
                "class = \(self.className)\n" +
                "lecturer = \(self.lecturer)\n" +
                "quarter = \(self.quarter)\n" +
                "enrolled = \(String(self.enrolled))\n" +
                "surveyed = \(String(self.surveyed))\n" +
                "statistics = \(self.statistics.debugDescription)"
    }

    /// Make object from raw data.
    /// Created by Rico
    ///
    /// - Parameter data: [String : Any]
    init(_ data: [String : Any]) {
        self.key = ""

        self.className = data["class"] as! String
        self.lecturer = data["lecturer"] as! String
        self.quarter = data["quarter"] as! String
        self.enrolled = Int(data["enrolled"] as! String)!
        self.surveyed = Int(data["surveyed"] as! String)!
        self.statistics = data["statistics"] as! [String: [String]]

        self.debugDescription = "key = \(self.key)\n" +
                "class = \(self.className)\n" +
                "lecturer = \(self.lecturer)\n" +
                "quarter = \(self.quarter)\n" +
                "enrolled = \(String(self.enrolled))\n" +
                "surveyed = \(String(self.surveyed))\n" +
                "statistics = \(self.statistics.debugDescription)"
    }

    
    /// Make object manually
    ///
    /// - Parameters:
    ///   - objectID
    ///   - className
    ///   - lecturer
    ///   - quarter
    ///   - enrolled
    ///   - surveyed
    ///   - statistics
    init(objectID: String, className: String, lecturer: String, quarter: String, enrolled: Int, surveyed: Int, statistics: [String : Any]) {
        self.key = objectID
        self.className = className
        self.lecturer = lecturer
        self.quarter = quarter
        self.enrolled = enrolled
        self.surveyed = surveyed
        self.statistics = statistics

        self.debugDescription = "key = \(self.key)\n" +
                "class = \(self.className)\n" +
                "lecturer = \(self.lecturer)\n" +
                "quarter = \(self.quarter)\n" +
                "enrolled = \(String(self.enrolled))\n" +
                "surveyed = \(String(self.surveyed))\n" +
                "statistics = \(self.statistics.debugDescription)"
    }

    
    /// Make map from self
    ///
    /// - Returns: [String : Any]
    func getSelf() -> [String : Any] {
        return ["class": self.className,
                "lecturer": self.lecturer,
                "quarter": self.quarter,
                "enrolled": self.enrolled,
                "surveyed": self.surveyed,
                "statistics": self.statistics]
    }

}
