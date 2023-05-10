//
//  CellView.swift
//  Views
//
//  Created by Leonid Lyadveykin on 11.05.2023.
//

import SwiftUI

public struct CellView: View {
    let text: String

    public var body: some View {
        Text(text)
            .focusable(true)
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(text: "Test")
    }
}
