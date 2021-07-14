import Foundation
import SwiftUI

// CaseIterable : make enum like array.
enum GridType: CaseIterable {
    case single
    case double
    case triple
    case adaptive
    
    var columns: [GridItem] {
        switch self {
        case .single:
            return [GridItem(.flexible())]
        case .double:
            return [GridItem(.flexible()),
                    GridItem(.flexible())]
        case .triple:
            return [GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible())]
        case .adaptive:
            return [GridItem(.adaptive(minimum: 60))]
        }
        
    }
    
}


struct  Item: Identifiable {
    let id = UUID()
    let mainTitle: String
    let subTitle: String
    let imageName: String
    
    static var dummydata: [Item] {
        (0...30).map {
            Item(mainTitle: "Main Title Indxex", subTitle: "Sub Title Index\($0)",
                 imageName: "img\($0 % 3 + 1)")
        }
    }

    
}
