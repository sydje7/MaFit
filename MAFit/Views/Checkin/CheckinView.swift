//
//  CheckinView.swift
//  MAFit
//
//  Created by Sydney Cairo on 11/12/2025.
//

import SwiftUI

struct CheckinView: View {
    
    // School theme colors
    private let themePink = Color(red: 0.98, green: 0.55, blue: 0.75) // soft pink
    private let themePinkBold = Color(red: 0.90, green: 0.20, blue: 0.55) // stronger pink for accents
    private let themeBlack = Color.black
    private let cardBackground = Color(.systemBackground).opacity(0.85)
    private let subtleBackground = LinearGradient(colors: [Color.white, Color(red: 1.0, green: 0.93, blue: 0.97)], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    @State private var sleepQuality: Double = 5
    @State private var energyLevel: Double = 5
    @State private var mood: String = "😊 Goed"
    @State private var notes: String = ""
    @State private var submitted = false
    
    let moods = ["😴 Moe", "😐 Neutraal", "😊 Goed", "😁 Geweldig"]
    
    var body: some View {
        NavigationView {
            ZStack {
                subtleBackground
                    .ignoresSafeArea()
                ScrollView {
                    VStack(spacing: 16) {
                        // Sleep quality card
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Hoe heb je geslapen?")
                                .font(.headline)
                                .foregroundStyle(themeBlack)
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Kwaliteit: \(Int(sleepQuality))/10")
                                    .font(.subheadline)
                                    .foregroundStyle(themeBlack.opacity(0.8))
                                Slider(value: $sleepQuality, in: 0...10, step: 1)
                                    .tint(themePinkBold)
                            }
                        }
                        .padding(16)
                        .background(cardBackground)
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .shadow(color: themePink.opacity(0.15), radius: 8, x: 0, y: 4)

                        // Energy level card
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Energie niveau")
                                .font(.headline)
                                .foregroundStyle(themeBlack)
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Energie: \(Int(energyLevel))/10")
                                    .font(.subheadline)
                                    .foregroundStyle(themeBlack.opacity(0.8))
                                Slider(value: $energyLevel, in: 0...10, step: 1)
                                    .tint(themePinkBold)
                            }
                        }
                        .padding(16)
                        .background(cardBackground)
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .shadow(color: themePink.opacity(0.15), radius: 8, x: 0, y: 4)

                        // Mood picker card
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Hoe voel je je?")
                                .font(.headline)
                                .foregroundStyle(themeBlack)
                            Picker("Stemming", selection: $mood) {
                                ForEach(moods, id: \.self) { mood in
                                    Text(mood)
                                }
                            }
                            .pickerStyle(.segmented)
                            .tint(themePinkBold)
                        }
                        .padding(16)
                        .background(cardBackground)
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .shadow(color: themePink.opacity(0.15), radius: 8, x: 0, y: 4)

                        // Notes card
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Notities (optioneel)")
                                .font(.headline)
                                .foregroundStyle(themeBlack)
                            TextEditor(text: $notes)
                                .frame(height: 120)
                                .padding(8)
                                .background(Color(.secondarySystemBackground))
                                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                        }
                        .padding(16)
                        .background(cardBackground)
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .shadow(color: themePink.opacity(0.15), radius: 8, x: 0, y: 4)

                        // Save button
                        Button(action: {
                            submitted = true
                        }) {
                            Text("Check-in opslaan")
                                .font(.headline)
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(themePinkBold)
                                .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                                .shadow(color: themePink.opacity(0.35), radius: 10, x: 0, y: 6)
                        }
                        .padding(.top, 8)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                }
            }
            .alert("Check-in opgeslagen!", isPresented: $submitted) {
                Button("OK", role: .cancel) { }
            }
            .navigationTitle("Dagelijkse Check-in")
            .toolbarBackground(themePink.opacity(0.15), for: .navigationBar)
            .tint(themePinkBold)
        }
    }
}

struct SleepCheckinView_Previews: PreviewProvider {
    static var previews: some View {
        CheckinView()
    }
}
