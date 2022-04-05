//
//  NSPopoverAppTestApp.swift
//  NSPopoverAppTest
//
//  Created by Tudosie, Bogdan on 1.4.2022.
//

import SwiftUI
import AppKit

@main
struct NSPopoverAppTestApp: App {
    
    @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    
    var statusItem: NSStatusItem?
    var popover = NSPopover()

    func applicationDidFinishLaunching(_ notification: Notification) {
        print("Application finished launching")
        let menuView = MenuPopoverView()
        
        popover.behavior = .transient
        popover.animates = true
        
        popover.contentViewController = NSViewController()
        let nsHostingView = NSHostingView(rootView: menuView)
        popover.contentViewController?.view = nsHostingView
        
        popover.contentViewController?.view.window?.makeKey()

        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        if let menuButton = statusItem?.button {
            menuButton.image = NSImage(systemSymbolName: "book", accessibilityDescription: "NSPopover Button")
            menuButton.action = #selector(toggleButton)
            menuButton.setAccessibilityIdentifier("statusButton")
            menuButton.setAccessibilityValue("statusButton")
            menuButton.setAccessibilityLabel("Status Button thing")
        }
    }
    
    @objc func toggleButton(){
        if let menuBtn = statusItem?.button {
            setAccessibilityForPopover()
            self.popover.becomeFirstResponder()
            self.popover.show(relativeTo: menuBtn.frame, of: menuBtn, preferredEdge: NSRectEdge.minY)
            print("Popover Window: \(self.popover.contentViewController?.view.window)")
        }
    }
    
    func setAccessibilityForPopover() {
        self.popover.contentViewController?.view.window?.setAccessibilityIdentifier("popoverWindow")
        self.popover.contentViewController?.view.window?.setAccessibilityValue("popoverWindow")
    }
}
