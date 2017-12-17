//
//  RealmConfig.swift
//  Treads-iOS
//
//  Created by Michael Alexander on 12/16/17.
//  Copyright © 2017 Michael Alexander. All rights reserved.
//

import Foundation
import RealmSwift

class RealmConfig {
    
    static var runDataConfig: Realm.Configuration {
        
        let realmPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(REALM_RUN_CONFIG)
        
        let config = Realm.Configuration(
            fileURL: realmPath,
            schemaVersion: 0,
            migrationBlock: { migration, oldSchemaVersion in
                if oldSchemaVersion < 0 {
                    // Nothing to do realm will automatically detect and remove properties
                }
        })
        
        return config
    }
}
