//
//  BodyMeasurementsWidget.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 12/12/20.
//

import SwiftUI

struct BodyMeasurementsWidget: View {
    var body: some View {
        HStack {
            Text("Body Measurement Widget")
        }.modifier(CardModifier())
    }
}

struct BodyMeasurementsWidget_Previews: PreviewProvider {
    static var previews: some View {
        BodyMeasurementsWidget()
    }
}
