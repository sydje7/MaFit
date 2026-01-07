//
//  TipsView.swift
//  MAFit
//
//  Created by Sydney Cairo on 09/12/2025.
//

import SwiftUI

struct TipsView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {

                Text("Tips")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top)

                Text("Dagelijkse tips, motivatie en weetjes om je beter te voelen.")
                    .foregroundColor(.white.opacity(0.7))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                // Placeholder tip kaart
                VStack(alignment: .leading, spacing: 10) {
                    Text("Weetje van de dag")
                        .font(.headline)
                        .foregroundColor(.white)

                    Text("15 minuten daglicht verhoogt je energielevel zichtbaar.")
                        .foregroundColor(.white.opacity(0.8))

                }
                .padding()
                .background(Color.white.opacity(0.1))
                .cornerRadius(16)

            }
            .padding()
        }
        .background(Color(red: 15/255, green: 18/255, blue: 28/255).ignoresSafeArea())
    }
}

struct TipsView_Previews: PreviewProvider {
    static var previews: some View {
        TipsView()
    }
}
