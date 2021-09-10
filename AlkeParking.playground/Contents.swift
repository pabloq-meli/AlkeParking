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

let car = Vehicle(plate: "AA111AA", type: VehicleType.car, checkInTime: Date(), discountCard: "DISCOUNT_CARD_001")
let car2 = Vehicle(plate: "AA111AA", type: VehicleType.car, checkInTime: Date(), discountCard: "DISCOUNT_CARD_003")
let moto = Vehicle(plate: "B222BBB", type: VehicleType.motorcycle, checkInTime: Date(), discountCard: nil)
let miniBus = Vehicle(plate: "CC333CC", type: VehicleType.miniBus, checkInTime: Date(), discountCard: nil)
let bus = Vehicle(plate: "DD444DD", type: VehicleType.bus, checkInTime: Date(), discountCard: "DISCOUNT_CARD_002")


let vehicle1 = Vehicle(plate: "AA111AA", type: VehicleType.car, checkInTime: Date(), discountCard:
                            "DISCOUNT_CARD_001")
let vehicle2 = Vehicle(plate: "B222BBB", type: VehicleType.motorcycle, checkInTime: Date(), discountCard: nil)
let vehicle3 = Vehicle(plate: "CC333CC", type: VehicleType.miniBus, checkInTime: Date(), discountCard:
                            nil)
let vehicle4 = Vehicle(plate: "DD444DD", type: VehicleType.bus, checkInTime: Date(), discountCard:
                            "DISCOUNT_CARD_002")
let vehicle5 = Vehicle(plate: "AA111BB", type: VehicleType.car, checkInTime: Date(), discountCard:
                            "DISCOUNT_CARD_003")
let vehicle6 = Vehicle(plate: "B222CCC", type: VehicleType.motorcycle, checkInTime: Date(), discountCard:
                            "DISCOUNT_CARD_004")
let vehicle7 = Vehicle(plate: "CC333DD", type: VehicleType.miniBus, checkInTime: Date(), discountCard: nil)
let vehicle8 = Vehicle(plate: "DD444EE", type: VehicleType.bus, checkInTime: Date(), discountCard: "DISCOUNT_CARD_005")
let vehicle9 = Vehicle(plate: "AA111CC", type: VehicleType.car, checkInTime: Date(), discountCard: nil)
let vehicle10 = Vehicle(plate: "B222DDD", type: VehicleType.motorcycle, checkInTime: Date(), discountCard: nil)
let vehicle11 = Vehicle(plate: "CC333EE", type: VehicleType.miniBus, checkInTime: Date(), discountCard: nil)
let vehicle12 = Vehicle(plate: "DD444GG", type: VehicleType.bus, checkInTime: Date(), discountCard: "DISCOUNT_CARD_006")
let vehicle13 = Vehicle(plate: "AA111DD", type: VehicleType.car, checkInTime: Date(), discountCard: "DISCOUNT_CARD_007")
let vehicle14 = Vehicle(plate: "B222EEE", type: VehicleType.motorcycle, checkInTime: Date(), discountCard: nil)
let vehicle15 = Vehicle(plate: "CC333FF", type: VehicleType.miniBus, checkInTime: Date(), discountCard:
                                nil)

alkeParking.vehicles.insert(car)
alkeParking.vehicles.insert(moto)
alkeParking.vehicles.insert(miniBus)
alkeParking.vehicles.insert(bus)

alkeParking.checkInVehicle(vehicle1, onFinish: <#T##(Bool) -> Void#>)

alkeParking.vehicles.insert(vehicle1)
alkeParking.vehicles.insert(vehicle2)
alkeParking.vehicles.insert(vehicle3)
alkeParking.vehicles.insert(vehicle4)
alkeParking.vehicles.insert(vehicle5)
alkeParking.vehicles.insert(vehicle6)
alkeParking.vehicles.insert(vehicle7)
alkeParking.vehicles.insert(vehicle8)
alkeParking.vehicles.insert(vehicle9)
alkeParking.vehicles.insert(vehicle10)
alkeParking.vehicles.insert(vehicle11)
alkeParking.vehicles.insert(vehicle12)
alkeParking.vehicles.insert(vehicle13)
alkeParking.vehicles.insert(vehicle14)
alkeParking.vehicles.insert(vehicle15)


//print(alkeParking.vehicles.insert(car).inserted)  // true
//print(alkeParking.vehicles.insert(car2).inserted)  // false




