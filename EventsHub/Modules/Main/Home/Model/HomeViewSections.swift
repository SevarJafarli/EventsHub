//
//  HomeViewSections.swift
//  EventsHub
//
//  Created by Sevar Jafarli on 17.06.24.
//

import Foundation


enum HomeViewSections: Int, CaseIterable {
    case welcomeHeader
    case search
    case featuredEvents
    case categories
    case upcomingEvents
    case suggestions
    
    
    var sectionTitle: String? {
        switch self {
        case .featuredEvents:
            "Featured events"
        case .categories:
            "Categories"
        case .upcomingEvents:
            "Upcoming events"
        case .suggestions:
            "For you"
        default:
            nil
        }
    }
}
