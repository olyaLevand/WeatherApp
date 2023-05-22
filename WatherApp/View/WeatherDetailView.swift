//
//  WeatherDetailView.swift
//  WatherApp
//
//  Created by Olya Levandivska on 22.05.2023.
//

import SwiftUI

struct WeatherDetailView: View {
    var weather: WeatherGeneralData
    var location: String
    
    var body: some View {
        VStack{
            Text("Weather details on \(weather.dateStr)")
                .font(.title3)
            Text(location)
                .font(.subheadline)
            List{
                ForEach(weather.items, id: \.self){ hoursData in
                    WeatherDetailCell(data: hoursData)
                }
            }
        }
    }
}

//struct WeatherDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        WeatherDetailView()
//    }
//}
