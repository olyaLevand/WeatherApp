//
//  WatherCell.swift
//  WatherApp
//
//  Created by Olya Levandivska on 21.05.2023.
//

import SwiftUI

struct WeatherCell: View {
    var dateStr: String
    var averageTemp: Int
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Spacer()
                Text("\(dateStr)")
                    .font(.largeTitle)
                Spacer()
                VStack(alignment: .leading){
                    Text("\(averageTemp) °С")
                        .font(.title)
                }
                Spacer()
            }
        }.frame(width: UIScreen.main.bounds.width)
    }
}

struct WatherCell_Previews: PreviewProvider {
    static var previews: some View {
        WeatherCell(dateStr: "21-05", averageTemp: 30)
    }
}
