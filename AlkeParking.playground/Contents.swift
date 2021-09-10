import Foundation

// MARK: AlkeParking

protocol Parkable {
    var plate: String { get }
    var type: VehicleType { get }
    var checkInTime: Date { get set }
    var discountCard: String? { get set }
    var parkedTime: Int { get }
}

struct Parking {
    var vehicles: Set<Vehicle> = []
    let maximumVehicles = 20
    
    mutating func checkInVehicle(_ vehicle: Vehicle, onFinish: (Bool) -> Void) {
        onFinish(vehicles.count < maximumVehicles && vehicles.insert(vehicle).inserted)
    }
    
    mutating func checkOutVehicle(_ plate: String, onSuccess: ((Int)->Void), onError: (()->Void)) {
        
    }
}

struct Vehicle: Parkable, Hashable {
    let plate: String
    let type: VehicleType // constante ya que un tipo de vehiculo no cambia con el tiempo
    var checkInTime: Date
    var discountCard: String?
    var parkedTime: Int {
        get {
            return Calendar.current.dateComponents([.minute], from:
                                                    checkInTime, to: Date()).minute ?? 0
        }
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(plate)
    }
    
    static func ==(lhs: Vehicle, rhs: Vehicle) -> Bool {
        return lhs.plate == rhs.plate
    }
}

enum VehicleType {
    case bus
    case car
    case miniBus
    case motorcycle
    
    var parkingRate: Int {
        switch self {
        case .bus:
            return 30
        case .car:
            return 20
        case .miniBus:
            return 25
        case .motorcycle:
            return 15
        }
    }
}

// MARK: - Prueba

var alkeParking = Parking()

//let car = Vehicle(plate: "AA111AA", type: VehicleType.car, checkInTime: Date(), discountCard: "DISCOUNT_CARD_001")
//let car2 = Vehicle(plate: "AA111AA", type: VehicleType.car, checkInTime: Date(), discountCard: "DISCOUNT_CARD_003")
//let moto = Vehicle(plate: "B222BBB", type: VehicleType.motorcycle, checkInTime: Date(), discountCard: nil)
//let miniBus = Vehicle(plate: "CC333CC", type: VehicleType.miniBus, checkInTime: Date(), discountCard: nil)
//let bus = Vehicle(plate: "DD444DD", type: VehicleType.bus, checkInTime: Date(), discountCard: "DISCOUNT_CARD_002")

//print(alkeParking.vehicles.insert(car).inserted)  // true
//print(alkeParking.vehicles.insert(car2).inserted)  // false

let vehicles = [
    Vehicle(plate: "AA111AA", type: VehicleType.car, checkInTime: Date(), discountCard:
                "DISCOUNT_CARD_001"),
    Vehicle(plate: "B222BBB", type: VehicleType.motorcycle, checkInTime: Date(), discountCard: nil),
    Vehicle(plate: "CC333CC", type: VehicleType.miniBus, checkInTime: Date(), discountCard:
                nil),
    Vehicle(plate: "DD444DD", type: VehicleType.bus, checkInTime: Date(), discountCard:
                "DISCOUNT_CARD_002"),
    Vehicle(plate: "DD444DD", type: VehicleType.bus, checkInTime: Date(), discountCard:
                "DISCOUNT_CARD_002"),
    Vehicle(plate: "AA111BB", type: VehicleType.car, checkInTime: Date(), discountCard:
                "DISCOUNT_CARD_003"),
    Vehicle(plate: "B222CCC", type: VehicleType.motorcycle, checkInTime: Date(), discountCard:
                "DISCOUNT_CARD_004"),
    Vehicle(plate: "CC333DD", type: VehicleType.miniBus, checkInTime: Date(), discountCard: nil),
    Vehicle(plate: "DD444EE", type: VehicleType.bus, checkInTime: Date(), discountCard: "DISCOUNT_CARD_005"),
    Vehicle(plate: "AA111CC", type: VehicleType.car, checkInTime: Date(), discountCard: nil),
    Vehicle(plate: "B222DDD", type: VehicleType.motorcycle, checkInTime: Date(), discountCard: nil),
    Vehicle(plate: "CC333EE", type: VehicleType.miniBus, checkInTime: Date(), discountCard: nil),
    Vehicle(plate: "DD444GG", type: VehicleType.bus, checkInTime: Date(), discountCard: "DISCOUNT_CARD_006"),
    Vehicle(plate: "AA111DD", type: VehicleType.car, checkInTime: Date(), discountCard: "DISCOUNT_CARD_007"),
    Vehicle(plate: "B222EEE", type: VehicleType.motorcycle, checkInTime: Date(), discountCard: nil),
    Vehicle(plate: "CC333FF", type: VehicleType.miniBus, checkInTime: Date(), discountCard:
                nil),
    Vehicle(plate: "XX333EE", type: VehicleType.miniBus, checkInTime: Date(), discountCard: nil),
    Vehicle(plate: "YY444GG", type: VehicleType.bus, checkInTime: Date(), discountCard: "DISCOUNT_CARD_006"),
    Vehicle(plate: "ZZ111DD", type: VehicleType.car, checkInTime: Date(), discountCard: "DISCOUNT_CARD_007"),
    Vehicle(plate: "WW22EEE", type: VehicleType.motorcycle, checkInTime: Date(), discountCard: nil),
    Vehicle(plate: "RR333FF", type: VehicleType.miniBus, checkInTime: Date(), discountCard:
                nil),
    Vehicle(plate: "RR333GG", type: VehicleType.miniBus, checkInTime: Date(), discountCard:
                nil)
]

vehicles.forEach { vehicle in
    alkeParking.checkInVehicle(vehicle) { result in
        print("\(result ? "Welcome to AlkeParking!" : "Sorry, the check-in failed")")
    }
}



