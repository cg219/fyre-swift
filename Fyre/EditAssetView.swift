//
//  EditAsset.swift
//  Fyre
//
//  Created by Clemente Gomez on 7/13/20.
//

import SwiftUI

struct EditAssetView: View {
    @State var name = "Asset Name"
    var asset: Asset?
    
    var body: some View {
        VStack {
            TextField("Name", text: $name)
        }
    }
}

struct EditAssetView_Previews: PreviewProvider {
    static var previews: some View {
        EditAssetView()
    }
}
