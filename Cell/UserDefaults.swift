//
//  UserDefaults.swift
//  iMusic
//
//  Created by Александр Прайд on 17.09.2020.
//  Copyright © 2020 Alexander Pride. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    static let favouriteTrackKey = "favouriteTrackKey"
    
    func saveTracks() -> [SearchViewModel.Cell] {
        let defaults = UserDefaults.standard
        
        guard let saveTracks = defaults.object(forKey: UserDefaults.favouriteTrackKey) as? Data else { return [] }
        guard let decodedTracks = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(saveTracks) as? [SearchViewModel.Cell] else { return [] }
        
        return decodedTracks
    }
}
