//
//  DetailedView.swift
//  Views
//
//  Created by Leonid Lyadveykin on 04.05.2023.
//

import SwiftUI

public struct DetailedView: View {
    let str: String

    public init(str: String) {
        self.str = str
    }

    public var body: some View {
        Text(str)
    }
}
