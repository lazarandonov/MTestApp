//
//  DistanceHelper.swift
//  MtestApp
//
//  Created by Lazar Andonov on 7.3.23..
//

import Foundation

class DistanceHelper {
    static func distanceString(for distance: Double) -> String {

        let distanceFormatter = MeasurementFormatter()
        distanceFormatter.unitOptions = .providedUnit
        let measurement = Measurement(value: distance, unit: UnitLength.kilometers)

        return distanceFormatter.string(from: measurement)
    }
}
