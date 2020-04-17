//
//  DropDelegate.swift
//  iIcon
//
//  Created by 游宗諭 on 2020/4/17.
//  Copyright © 2020 游宗諭. All rights reserved.
//

import Foundation
import SwiftUI

struct MyDropDelegate: DropDelegate {
  @Binding var imageUrls: [Int: URL]
  @Binding var active: Int
  
  func validateDrop(info: DropInfo) -> Bool {
    return info.hasItemsConforming(to: ["public.file-url"])
  }
  
  func dropEntered(info: DropInfo) {
    NSSound(named: "Morse")?.play()
  }
  
  func performDrop(info: DropInfo) -> Bool {
    NSSound(named: "Submarine")?.play()
    
    let gridPosition = 0//getGridPosition(location: info.location)
    self.active = gridPosition
    
    if let item = info.itemProviders(for: ["public.file-url"]).first {
      item.loadItem(forTypeIdentifier: "public.file-url", options: nil) { (urlData, error) in
        DispatchQueue.main.async {
          if let urlData = urlData as? Data {
            self.imageUrls[gridPosition] = NSURL(absoluteURLWithDataRepresentation: urlData, relativeTo: nil) as URL
          }
        }
      }
      
      return true
      
    } else {
      return false
    }
    
  }
  
  func dropUpdated(info: DropInfo) -> DropProposal? {
    self.active = getGridPosition(location: info.location)
    
    return nil
  }
  
  func dropExited(info: DropInfo) {
    self.active = 0
  }
  
  func getGridPosition(location: CGPoint) -> Int {
    if location.x > 150 && location.y > 150 {
      return 4
    } else if location.x > 150 && location.y < 150 {
      return 3
    } else if location.x < 150 && location.y > 150 {
      return 2
    } else if location.x < 150 && location.y < 150 {
      return 1
    } else {
      return 0
    }
  }
}
