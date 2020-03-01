//
//  InfoView.swift
//  Coco Card
//
//  Created by 沈心逸 on 2020/3/1.
//  Copyright © 2020 Xinyi Shen. All rights reserved.
//

import SwiftUI

struct InfoView: View {
    
    let imageName: String
    let text: String
        
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(height: 50)
            .overlay(
                HStack {
                    Image(systemName: imageName)
                        .foregroundColor(.green)
                    Text(text)
                        .foregroundColor(.black)
            })
            .padding(.all)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(imageName: "phone.fill", text: "Hello")
            .previewLayout(.sizeThatFits)
    }
}
