//
//  HomeView.swift
//  MAFit
//
//  Created by Sydney Cairo on 09/12/2025.
//
import SwiftUI

struct HomeView: View {
    // School theme colors
    private let themePink = Color(red: 0.98, green: 0.55, blue: 0.75) // soft pink
    private let themePinkBold = Color(red: 0.90, green: 0.20, blue: 0.55) // strong accent
    private let themeBlack = Color.black
    private let subtleBackground = LinearGradient(colors: [Color.white, Color(red: 1.0, green: 0.93, blue: 0.97)], startPoint: .topLeading, endPoint: .bottomTrailing)

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                
                // Header
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Hallo,")
                            .foregroundStyle(themeBlack.opacity(0.7))
                            .font(.title3)
                        Text("Student")
                            .foregroundStyle(themeBlack)
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    Spacer()
                    
                    Circle()
                        .fill(themePink.opacity(0.25))
                        .overlay(
                            Image(systemName: "person.fill")
                                .foregroundStyle(themePinkBold)
                                .font(.subheadline)
                        )
                        .frame(width: 42, height: 42)
                }
                
                // Stats cards
                HStack(spacing: 12) {
                    StatCard(icon: "heart", title: "Mood", value: "7.5", themePinkBold: themePinkBold, themePink: themePink, themeBlack: themeBlack)
                    StatCard(icon: "figure.walk", title: "Stappen", value: "5.2k", themePinkBold: themePinkBold, themePink: themePink, themeBlack: themeBlack)
                    StatCard(icon: "flame", title: "Streak", value: "12d", themePinkBold: themePinkBold, themePink: themePink, themeBlack: themeBlack)
                }
                
                // Quote
                VStack(alignment: .leading, spacing: 8) {
                    Text("Quote van de dag")
                        .foregroundStyle(themeBlack.opacity(0.6))
                        .font(.subheadline)
                    
                    Text("“Je bent sterker dan je denkt”")
                        .foregroundStyle(themePinkBold)
                        .font(.body)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                .fill(Color(.systemBackground).opacity(0.9))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                                        .stroke(themePink.opacity(0.25), lineWidth: 1)
                                )
                        )
                }
                
                // Pillars
                HStack {
                    Text("8 Brain Balance Pijlers")
                        .foregroundStyle(themeBlack)
                        .font(.headline)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundStyle(themePinkBold.opacity(0.7))
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        PillarLink(title: "Slaap", color: themePink)
                        PillarLink(title: "Eten", color: themePink)
                        PillarLink(title: "Bewegen", color: themePink)
                        PillarLink(title: "Ontspanning", color: themePink)
                        PillarLink(title: "Sociaal", color: themePink)
                        PillarLink(title: "Mindfulness", color: themePink)
                        PillarLink(title: "Doelen", color: themePink)
                        PillarLink(title: "Zingeving", color: themePink)
                    }
                }
                
                // Active Challenge
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text("Actieve Challenge")
                            .foregroundStyle(themePinkBold)
                            .font(.subheadline)
                        Spacer()
                        Image(systemName: "medal")
                            .foregroundStyle(themePinkBold)
                    }
                    
                    Text("10.000 stappen per dag")
                        .foregroundStyle(themePinkBold)
                        .font(.headline)
                    
                    ProgressView(value: 6500, total: 10000)
                        .tint(themePinkBold)
                        .padding(.vertical, 4)
                    
                    Text("6.500 / 10.000")
                        .foregroundStyle(themeBlack.opacity(0.6))
                        .font(.caption)
                }
                .padding()
                .background(Color(.systemBackground).opacity(0.9))
                .overlay(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(themePink.opacity(0.25), lineWidth: 1)
                )
                .shadow(color: themePink.opacity(0.12), radius: 10, x: 0, y: 6)
                
                // Fun fact
                VStack(alignment: .leading, spacing: 8) {
                    Text("Weetje van de dag")
                        .foregroundStyle(themePinkBold)
                        .font(.subheadline)
                    
                    Text("15 minuten buiten zijn kan je mentale energie verhogen met 20%")
                        .foregroundStyle(themeBlack)
                        .font(.body)
                }
                .padding()
                .background(Color(.systemBackground).opacity(0.9))
                .overlay(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(themePink.opacity(0.25), lineWidth: 1)
                )
                .shadow(color: themePink.opacity(0.12), radius: 10, x: 0, y: 6)
                
            }
            .padding()
        }
        .background(subtleBackground.ignoresSafeArea())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

// MARK: - Subviews

struct StatCard: View {
    let icon: String
    let title: String
    let value: String
    let themePinkBold: Color
    let themePink: Color
    let themeBlack: Color
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(themePinkBold)
            Text(title)
                .foregroundStyle(themeBlack.opacity(0.6))
                .font(.caption)
            Text(value)
                .foregroundStyle(themePinkBold)
                .font(.headline)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(.systemBackground).opacity(0.9))
        .overlay(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .stroke(themePink.opacity(0.25), lineWidth: 1)
        )
        .shadow(color: themePink.opacity(0.12), radius: 8, x: 0, y: 4)
    }
}

struct PillarLink: View {
    let title: String
    let color: Color
    private let themeBlack = Color.black

    var body: some View {
        NavigationLink {
            VStack(spacing: 16) {
                Text(title)
                    .font(.largeTitle)
                    .bold()
                Text("Binnenkort meer over \(title) ✨")
                    .foregroundStyle(.secondary)
            }
            .padding()
            .navigationTitle(title)
        } label: {
            VStack(spacing: 8) {
                Circle()
                    .fill(color.opacity(0.25))
                    .overlay(
                        Circle().stroke(color.opacity(0.5), lineWidth: 1)
                    )
                    .frame(width: 64, height: 64)
                Text(title)
                    .foregroundStyle(themeBlack)
                    .font(.caption)
            }
            .padding(8)
            .background(Color(.systemBackground).opacity(0.9))
            .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
            .shadow(color: color.opacity(0.15), radius: 6, x: 0, y: 4)
        }
    }
}

