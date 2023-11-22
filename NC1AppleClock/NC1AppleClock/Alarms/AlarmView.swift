//
//  AlarmView.swift
//  NC1AppleClock
//
//  Created by Svetlana Zakharova on 16/11/23.
//

import SwiftUI

struct Alarm: Identifiable {
    var id = UUID()
    var time: String
    var isActive: Bool
}

struct AlarmView: View {
    @State private var alarms: [Alarm] = [
        Alarm(time: "08:00", isActive: true),
        Alarm(time: "09:30", isActive: false),
        Alarm(time: "17:45", isActive: true)
    ]
    @State private var isAddingAlarm = false

    var body: some View {
        NavigationView {
            List {
                ForEach(alarms) { alarm in
                    HStack {
                        VStack(alignment: .leading, spacing: 6) {
                            Text(alarm.time)
                                .font(.system(size: 48))
                                .foregroundColor(.white)
                            Text("Alarm")
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Toggle("", isOn: $alarms[getIndex(for: alarm)].isActive)
                            .labelsHidden()
                    }
                }
                .onDelete(perform: deleteAlarm)
            }
            .navigationBarTitle("Alarms")
            .navigationBarItems(
                trailing: Button(action: {
                    isAddingAlarm = true
                }) {
                    Image(systemName: "plus")
                }
            )
            .sheet(isPresented: $isAddingAlarm) {
                AddAlarmView(addAlarm: addAlarm)
            }
            
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
            }
  
        }
    }

    func deleteAlarm(at offsets: IndexSet) {
        alarms.remove(atOffsets: offsets)
    }

    func addAlarm(alarm: Alarm) {
        alarms.append(alarm)
        isAddingAlarm = false
    }

    func getIndex(for alarm: Alarm) -> Int {
        if let index = alarms.firstIndex(where: { $0.id == alarm.id }) {
            return index
        }
        return 0
    }
}

struct AddAlarmView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var alarmTime = Date()
    @State private var isActive = true
    var addAlarm: (Alarm) -> Void

    var body: some View {
        NavigationView {
            VStack {
                DatePicker("Select Time", selection: $alarmTime, displayedComponents: .hourAndMinute)
                    .datePickerStyle(WheelDatePickerStyle())
                Toggle("Active", isOn: $isActive)
                    .padding()
                Button("Save") {
                    let dateFormatter = DateFormatter()
                    dateFormatter.timeStyle = .short
                    let time = dateFormatter.string(from: alarmTime)
                    addAlarm(Alarm(time: time, isActive: isActive))
                    presentationMode.wrappedValue.dismiss()
                }
                .padding()
            }
            .navigationBarTitle("Add Alarm")
            
        }
    }
}

struct AlarmView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmView()
    }
}


//struct AlarmView: View {
//    @State private var items = ["Item 1", "Item 2", "Item 3"]
//    @State private var isEditMode = false
//
//    var body: some View {
//        NavigationView {
//            List {
//                ForEach(items, id: \.self) { item in
//                    Text(item)
//                }
//                .onDelete(perform: deleteItem)
//            }
//            .navigationBarTitle("Alarms")
//            .navigationBarItems(
//                leading: Button(action: {
//                    isEditMode.toggle()
//                }) {
//                    Text(isEditMode ? "Done" : "Edit")
//                },
//                trailing: HStack {
//                    Button(action: {
//                        // Action for adding new item
//                        addItem()
//                    }) {
//                        Image(systemName: "plus")
//                    }
//                }
//            )
//        }
//    }
//
//    func deleteItem(at offsets: IndexSet) {
//        items.remove(atOffsets: offsets)
//    }
//
//    func addItem() {
//        items.append("New Item")
//    }
//}





#Preview {
    AlarmView()
}
