//
//  Grid.swift
//  Memorize
//
//  Created by Simon Zhang on 9/13/22.
//

import SwiftUI

struct Grid<Item,ItemView>: View {

    var items: Array<Item>
    var viewForItem: (Item) -> ItemView
    
    var body : some View{
        Text("sup")
    }

}

