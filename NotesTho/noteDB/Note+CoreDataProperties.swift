//
//  Note+CoreDataProperties.swift
//  NotesTho
//
//  Created by Highest on 11.08.2024.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var date: Date?
    @NSManaged public var id: String?
    @NSManaged public var text: String?
    @NSManaged public var title: String?

}

extension Note : Identifiable {

}
