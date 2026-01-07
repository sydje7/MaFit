//
//  ChallengesView.swift
//  MAFit
//
//  Created by Sydney Cairo on 09/12/2025.
//


import SwiftUI

struct Challenge: Identifiable {
    let id = UUID()
    let title: String
    let icon: String
    let duration: String
    let goal: String
    let tasks: [String]
}

struct ChallengesView: View {
    
    private let challenges: [Challenge] = [
        Challenge(
            title: "Daily Self-Check",
            icon: "heart.text.square",
            duration: "7 dagen",
            goal: "Bewust worden van je emoties en behoeften",
            tasks: [
                "Geef je stemming een cijfer van 1–10",
                "Schrijf één emotie op die je vandaag voelde",
                "Noteer wat je energie gaf",
                "Noteer wat je energie kostte",
                "Oefen 2 minuten ademhaling",
                "Schrijf iets op waar je dankbaar voor bent",
                "Bekijk je week en benoem een patroon dat je opvalt"
            ]
        ),
        Challenge(
            title: "Fresh Mind",
            icon: "wind",
            duration: "14 dagen",
            goal: "Meer rust en helderheid creëren",
            tasks: [
                "5 minuten opruimen",
                "24 uur social media pauze",
                "Wandeling van 10–20 minuten",
                "Koud douchen (1 minuut)",
                "3× iets doen zonder multitasking",
                "15 minuten een hobby",
                "1 keer 'nee' zeggen om jezelf te beschermen"
            ]
        ),
        Challenge(
            title: "Positivity Boost",
            icon: "sparkles",
            duration: "7 dagen",
            goal: "Meer focus op wat goed gaat",
            tasks: [
                "Schrijf elke dag 3 positieve dingen op",
                "Geef iemand een compliment",
                "Zoek een oude foto die je blij maakt",
                "Doe iets aardigs voor jezelf",
                "Lach 30 seconden (ook als het nep voelt)"
            ]
        ),
        Challenge(
            title: "Connection",
            icon: "person.2.fill",
            duration: "7 dagen",
            goal: "Je meer verbonden voelen met anderen",
            tasks: [
                "Stuur een bericht naar iemand die je mist",
                "Plan een koffiemoment of bel-afspraak",
                "Geef iemand oprecht aandacht (zonder telefoon)",
                "Vraag aan iemand: 'Hoe gaat het écht?'",
                "Bel iemand spontaan",
                "Deel iets persoonlijk over jezelf",
                "Bedank iemand bewust voor iets kleins"
            ]
        ),
        Challenge(
            title: "Calm Reset",
            icon: "pause.circle.fill",
            duration: "5 minuten per dag",
            goal: "Stress verlagen in korte momenten",
            tasks: [
                "5 minuten mindful ademen",
                "5 minuten stretchen",
                "5 minuten schrijven wat je bezighoudt",
                "5 minuten naar rustige muziek luisteren",
                "5 minuten helemaal niets doen"
            ]
        ),
        Challenge(
            title: "Self-Growth",
            icon: "leaf.fill",
            duration: "30 dagen",
            goal: "Zelfinzicht, discipline en emotionele groei",
            tasks: [
                "Schrijf je grootste stressbron op",
                "Maak een mini-vision board",
                "Leer 10 minuten iets nieuws",
                "Oefen zelfcompassie: spreek vriendelijk tegen jezelf",
                "Plan een dagdeel zonder verplichtingen",
                "Reflecteer op wat je deze maand hebt geleerd"
            ]
        )
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    // Header
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Mental Health Challenges")
                            .font(.largeTitle.bold())
                        Text("Kleine dagelijkse opdrachten om je mentale gezondheid te ondersteunen.")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    
                    // Cards
                    ForEach(challenges) { challenge in
                        NavigationLink {
                            ChallengeDetailView(challenge: challenge)
                        } label: {
                            ChallengeCardView(challenge: challenge)
                        }
                        .buttonStyle(.plain)
                        .padding(.horizontal)
                    }
                    
                    Spacer(minLength: 24)
                }
            }
            .navigationTitle("Challenges")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ChallengeCardView: View {
    let challenge: Challenge
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .top, spacing: 12) {
                Image(systemName: challenge.icon)
                    .font(.title2)
                    .padding(10)
                    .background(
                        Circle()
                            .fill(Color(.systemGray6))
                    )
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(challenge.title)
                        .font(.headline)
                    Text(challenge.duration)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text(challenge.goal)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                }
                Spacer()
            }
            
            Divider()
            
            // Toon een paar voorbeelden van taken
            VStack(alignment: .leading, spacing: 4) {
                ForEach(challenge.tasks.prefix(2), id: \.self) { task in
                    HStack(alignment: .top, spacing: 6) {
                        Image(systemName: "checkmark.circle")
                            .font(.caption)
                        Text(task)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                if challenge.tasks.count > 2 {
                    Text("Bekijk alle opdrachten →")
                        .font(.caption)
                        .foregroundColor(.blue)
                        .padding(.top, 2)
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.06), radius: 8, x: 0, y: 4)
        )
    }
}

struct ChallengeDetailView: View {
    let challenge: Challenge
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                HStack(alignment: .center, spacing: 12) {
                    Image(systemName: challenge.icon)
                        .font(.largeTitle)
                        .padding(14)
                        .background(
                            Circle()
                                .fill(Color(.systemGray6))
                        )
                    VStack(alignment: .leading, spacing: 4) {
                        Text(challenge.title)
                            .font(.title2.bold())
                        Text(challenge.duration)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Doel")
                        .font(.headline)
                    Text(challenge.goal)
                        .font(.body)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Opdrachten")
                        .font(.headline)
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(Array(challenge.tasks.enumerated()), id: \.offset) { index, task in
                            HStack(alignment: .top, spacing: 8) {
                                Text("\(index + 1).")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                    .frame(width: 24, alignment: .topTrailing)
                                Text(task)
                                    .font(.body)
                            }
                        }
                    }
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle(challenge.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

// Voor preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

