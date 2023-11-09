import Foundation
import UIKit

struct Movie {
    let title: String
    let synopsis: String
    let posterURL: URL
}

struct Result: Codable {
    let adult: Bool
    let backdrop_path: String
    let genre_ids: [Int]
    let id: Int
    let original_language: String
    let original_title: String
    let overview: String
    let popularity: Double
    let poster_path: String
    let release_date: String
    let title: String
    let video: Bool
    let vote_average: Double
    let vote_count: Int
}

struct NowPlayingResponse: Codable {
    let dates: DatesResponse
    let page: Int
    let results: [Result]
    let total_pages: Int
    let total_results: Int
}

struct DatesResponse: Codable {
    let maximum: String
    let minimum: String
}
