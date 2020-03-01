//
//  DetailView.swift
//  H4X0R News
//
//  Created by 沈心逸 on 2020/3/1.
//  Copyright © 2020 Xinyi Shen. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}
