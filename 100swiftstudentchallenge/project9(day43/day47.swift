//
//  day47.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 31/08/26.
//

//done all the task
import SwiftUI

struct Habit: Identifiable, Codable, Hashable {
    var id = UUID()
    var title: String
    var description: String
    var totalCompleted: Int
}


struct day47: View {
    @State private var isPresented: Bool = false
    
    @State var habit: [Habit]
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(habit) { habit in
                    NavigationLink(value:habit){
                        
                        VStack{
                            /*@START_MENU_TOKEN@*/Text(habit.title)/*@END_MENU_TOKEN@*/
                            Text("Acomplished:" + String(habit.totalCompleted))
                        }
                    }
                    
                }
                .onDelete(perform: deleteHabit)
                
            }
            .navigationDestination(for: Habit.self) { habitx in
                if let index = habit.firstIndex(where: { $0.id == habitx.id }) {
                    HabitDetailView(habit: $habit[index])
                }
            }
            
            Text("hello")
                .navigationTitle("Habit tracking app")
                .toolbar{
                    Button("add"){
                        isPresented.toggle()
                    }
                }
                .sheet(isPresented: $isPresented){
                    AddHabitView(habits: $habit)
                }
        }
        
        
        
    }
    
    func deleteHabit(at offsets: IndexSet) {
            habit.remove(atOffsets: offsets)
        }
    
}


struct AddHabitView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var habits: [Habit]
    
    @State private var title = ""
    @State private var description = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
            }
            .navigationTitle("New Habit")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let newHabit = Habit(title: title, description: description, totalCompleted: 0)
                        habits.append(newHabit)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}


struct HabitDetailView: View {
    @Binding var habit: Habit
    
    var body: some View {
        VStack(spacing: 20) {
            Text(habit.title)
                .font(.largeTitle)
                .bold()
            
            Text(habit.description)
                .font(.body)
                .foregroundStyle(.secondary)
            
            Text("Completed \(habit.totalCompleted) times")
                .font(.title2)
            
            Spacer()
            
            Button {
                habit.totalCompleted += 1
            } label: {
                Text("Mark as Done")
                    .font(.title2)
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.green)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
        }
        .padding()
        .navigationTitle(habit.title)
    }
}

#Preview {
    @Previewable @State var habits = [
        Habit(title: "Minum air 2L", description: "Minum air putih minimal 2 liter per hari", totalCompleted: 12),
        Habit(title: "Baca buku", description: "Baca minimal 10 halaman sebelum tidur", totalCompleted: 5),
        Habit(title: "Olahraga pagi", description: "Jogging atau stretching 15 menit", totalCompleted: 8),
        Habit(title: "Journaling", description: "Tulis 3 hal yang disyukuri hari ini", totalCompleted: 20),
        Habit(title: "No gadget before bed", description: "Matiin HP 30 menit sebelum tidur", totalCompleted: 3)
    ]
    day47(habit: habits)
}
