import SwiftUI

struct HomeTabView: View {
    // School theme colors
    private let themePink = Color(red: 0.98, green: 0.55, blue: 0.75) // soft pink
    private let themePinkBold = Color(red: 0.90, green: 0.20, blue: 0.55) // strong accent
    private let themeBlack = Color.black
    private let subtleBackground = LinearGradient(colors: [Color.white, Color(red: 1.0, green: 0.93, blue: 0.97)], startPoint: .topLeading, endPoint: .bottomTrailing)

    var body: some View {
        ZStack {
            subtleBackground
                .ignoresSafeArea()
            TabView {

                // 1 — HOME
                NavigationStack {
                    HomeView()
                        .navigationBarTitleDisplayMode(.inline)
                }
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

                // 2 — CHECKIN
                NavigationStack {
                    CheckinView()
                        .navigationBarTitleDisplayMode(.inline)
                }
                .tabItem {
                    Label("Checkin", systemImage: "waveform.path.ecg")
                }

                // 3 — CHALLENGES
                NavigationStack {
                    ChallengesView()
                        .navigationBarTitleDisplayMode(.inline)
                }
                .tabItem {
                    Label("Challenges", systemImage: "flag.checkered")
                }

                // 4 — TIPS
                NavigationStack {
                    ContentView()
                        .navigationBarTitleDisplayMode(.inline)
                }
                .tabItem {
                    Label("Tips", systemImage: "lightbulb")
                }
            }
            .tint(themePinkBold) // selected item tint
        }
        .onAppear {
            // UITabBar appearance to add background and unselected color
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterialLight)
            appearance.backgroundColor = UIColor(Color.white.opacity(0.6))
            appearance.stackedLayoutAppearance.selected.iconColor = UIColor(themePinkBold)
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor(themePinkBold)]
            appearance.stackedLayoutAppearance.normal.iconColor = UIColor.black.withAlphaComponent(0.6)
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.black.withAlphaComponent(0.6)]
            appearance.stackedLayoutAppearance.normal.badgeBackgroundColor = UIColor(themePinkBold)
            appearance.stackedLayoutAppearance.selected.badgeBackgroundColor = UIColor(themePinkBold)
            appearance.stackedLayoutAppearance.normal.badgeTextAttributes = [.foregroundColor: UIColor.white]
            appearance.stackedLayoutAppearance.selected.badgeTextAttributes = [.foregroundColor: UIColor.white]
            UITabBar.appearance().standardAppearance = appearance
            if #available(iOS 15.0, *) {
                UITabBar.appearance().scrollEdgeAppearance = appearance
            }
            
            let navAppearance = UINavigationBarAppearance()
            navAppearance.configureWithOpaqueBackground()
            navAppearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterialLight)
            navAppearance.backgroundColor = UIColor(Color.white.opacity(0.6))
            navAppearance.titleTextAttributes = [.foregroundColor: UIColor(themeBlack)]
            navAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(themeBlack)]
            UINavigationBar.appearance().standardAppearance = navAppearance
            UINavigationBar.appearance().compactAppearance = navAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navAppearance
            UINavigationBar.appearance().tintColor = UIColor(themePinkBold)
        }
        .toolbarBackground(themePink.opacity(0.12), for: .navigationBar)
        .tint(themePinkBold)
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
