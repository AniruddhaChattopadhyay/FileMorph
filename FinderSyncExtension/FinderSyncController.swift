//
//  FinderSync.swift
//  FinderSyncExtension
//
//  Created by Aniruddha on 18/03/25.
//

import Cocoa
import FinderSync

class FinderSync: FIFinderSync {
    
    override init() {
        super.init()
        print("FinderSync Extension Loaded")
        
        // Monitor the Desktop folder (Change this as needed)
        FIFinderSyncController.default().directoryURLs = [URL(fileURLWithPath: "/Users/yourusername/Desktop")]
    }
    
    override func menu(for menuKind: FIMenuKind) -> NSMenu {
        let menu = NSMenu(title: "")
        
        let convertItem = NSMenuItem(title: "Convert Image", action: #selector(convertImage(_:)), keyEquivalent: "")
        convertItem.target = self
        menu.addItem(convertItem)
        
        return menu
    }
    
    @objc func convertImage(_ sender: AnyObject?) {
        guard let targetURL = FIFinderSyncController.default().selectedItemURLs()?.first else { return }
        print("Convert action triggered for: \(targetURL.path)")
        
        // Call the image conversion function (to be implemented)
    }
}
