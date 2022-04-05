//
//  MenuPopoverView.swift
//  NSPopoverAppTest
//
//  Created by Tudosie, Bogdan on 1.4.2022.
//
import SwiftUI

struct MenuPopoverView: View {
    var body: some View {
        VStack {
            Text("Hello Menu").padding()
            Button("Press me", action: pressMe).padding()
        }
    }
    
    func pressMe() {
        print("Button Press")
    }
}

struct MenuPopoverView_Preview: PreviewProvider {
    static var previews: some View {
        MenuPopoverView()
    }
}
