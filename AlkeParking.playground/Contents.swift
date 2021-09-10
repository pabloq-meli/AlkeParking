import Foundation

// MARK: AlkeParking

protocol Parkable {
    var plate: String { get }
    var carType: VehicleType { get }
    var checkInTime: Date { get set }
    var discountCard: String? { get set }
    var parkedTime: Int { get }
}

struct Parking {
    var vehicles: Set<Vehicle> = []
}

struct Vehicle: Parkable, Hashable {
    let plate: String
    let carType: VehicleType // constante ya que un tipo de vehiculo no cambia con el tiempo
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
    case minibus
    case motorcycle
    
    var parkingRate: Int {
        switch self {
        case .bus:
            return 30
        case .car:
            return 20
        case .minibus:
            return 25
        case .motorcycle:
            return 15
        }
    }
}


