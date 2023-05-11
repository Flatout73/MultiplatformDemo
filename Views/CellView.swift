//
//  CellView.swift
//  Views
//
//  Created by Leonid Lyadveykin on 11.05.2023.
//

import SwiftUI

public struct CellView: View {
    let date: Date

    public init(date: Date) {
        self.date = date
    }
    
    public var body: some View {
        Text(date, style: .time)
        #if !os(iOS)
            .focusable(true)
        #endif
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(date: Date())
    }
}
