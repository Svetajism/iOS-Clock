//
//  ContentView.swift
//  NC1AppleClock
//
//  Created by Svetlana Zakharova on 16/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.black
            
            //TabBar
            TabView {
                WorldClockView()
                    .tabItem {
                        Image(systemName: "globe")
                        Text("World Clock")
                    }
                AlarmView()
                    .tabItem {
                        Image(systemName: "alarm")
                        Text("Alarms")
                    }
                StopwatchView()
                    .tabItem {
                        Image(systemName: "stopwatch")
                        Text("Stopwatch")
                    }
                TimerView()
                    .tabItem {
                        Image(systemName: "timer")
                        Text("Timers")
                    }
            }
            .accentColor(.orange)
        }
    }
}

#Preview {
    ContentView()
}
