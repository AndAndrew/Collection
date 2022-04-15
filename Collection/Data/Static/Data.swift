//
//  Data.swift
//  Collection
//
//  Created by Andrey Krivokhizhin on 15.04.2022.
//

import UIKit

extension String {
    static func from(_ file: String) -> String {
        guard let path = Bundle.main.path(forResource: file, ofType: "txt") else {
            fatalError("something wrong with file .txt")
        }
        return try! String(contentsOfFile: path)
    }
}

extension Array where Element == UIImage {
    init(base: String, count: Int) {
        self.init((1...count).map { "\(base)-\($0)" }.map { UIImage($0) } )
    }
}

extension UIImage {
    convenience init(_ name: String) {
        self.init(named: name)!
    }
}

enum ContentType {
    case story(Story)
    case gallery(Gallery)
}

struct Data {
    static let data: [ContentType] = [
        .story(Story(coverImage: .init("story-1"), title: .from("s1-title"), text: .from("s1-text"))),
        .story(Story(coverImage: .init("story-2"), title: .from("s2-title"), text: .from("s2-text"))),
        .gallery(Gallery(coverImage: .init("samara-0"), title: "Samara", images: .init(base: "samara", count: 5))),
        .story(Story(coverImage: .init("story-4"), title: .from("s4-title"), text: .from("s4-text"))),
        .story(Story(coverImage: .init("story-3"), title: .from("s3-title"), text: .from("s3-text")))
    ]
}

struct Story {
    let coverImage: UIImage
    let title: String
    let text: String
    let type: String = String(describing: Story.self)
}

struct Gallery {
    let coverImage: UIImage
    let title: String
    let images: [UIImage]
    let type: String = String(describing: Gallery.self)
}
