import SwiftUI
import SwiftData

struct CalculateDetailScreen: View {
    
    @Environment(\.modelContext) var modelContext
    @Query(filter: #Predicate<DietData> { data in
            data.isLogInApproved == true
        }) var calCountDatabase: [DietData]
    
    @State private var foodName: String = ""
    @State private var foodTotalCalories: String = ""
    @State private var consumedQuantity: String = ""
    @State private var protienInput: String = ""
    @State private var carbsInput: String = ""
    @State private var fatsInput: String = ""
        
    var dismissSheetHandler: (() -> Void)?
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section("Add your meal info") {
                        TextField("Enter name of your food item", text: $foodName)
                    }
                    Section("Calories") {
                        TextField("Enter Calories per 100 gm", text: $foodTotalCalories).keyboardType(.numberPad)
                        TextField("Enter your Quantity Intake in gm", text: $consumedQuantity).keyboardType(.numberPad)
                    } 
                    Section("Macros") {
                        TextField("Protien per 100 gm", text: $protienInput).keyboardType(.numberPad)
                        TextField("Carbs per 100 gm", text: $carbsInput).keyboardType(.numberPad)
                        TextField("Fats per 100 gm", text: $fatsInput).keyboardType(.numberPad)
                    }
                }
                .listStyle(DefaultListStyle())
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Add your calorie intake")
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        if (foodName.count > 0) || (foodTotalCalories.count > 0) || (consumedQuantity.count > 0) || (protienInput.count > 0) || (carbsInput.count > 0) || (fatsInput.count > 0){
                            addData()
                        }
                        dismissSheetHandler?()
                    }) {
                        Image(systemName: "calendar.badge.checkmark.rtl")
                            .foregroundColor(.accentColor) // Adjust color as needed
                    }
                }
            }
        }
    }
    
    func addData() {
        if let intCal = Int(foodTotalCalories), let intQuantity = Int(consumedQuantity), let intProtien = Int(protienInput), let intCarbs = Int(carbsInput), let intFats = Int(carbsInput)  {
            
            let calorieCount = (intCal * intQuantity) / 100
            let protienCount = (intProtien * intQuantity) / 100
            let carbsCount = (intCarbs * intQuantity) / 100
            let fatsCount = (intFats * intQuantity) / 100
            
            let calData = calCountDatabase[0]
            withAnimation {

                calData.name         = foodName
                calData.calories     = intCal
                calData.quantity     = intQuantity
                calData.protien      = intProtien
                calData.carbs        = intCarbs
                calData.fats         = intFats
                calData.calCount     = calorieCount
                calData.protienCount = protienCount
                calData.carbsCount   = carbsCount
                calData.fatsCount    = fatsCount
            }
        } else { print("Error: Unable to convert one or both values to Int.")  }
    }
}
