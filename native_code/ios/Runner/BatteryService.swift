//
//  BatteryService.swift
//  Runner
//
//  Created by Bruno Azenha on 09.06.20.
//

import Foundation

class BatteryService {
    func receiveBatteryLevel(result: FlutterResult) {
      let device = UIDevice.current
      device.isBatteryMonitoringEnabled = true
      if device.batteryState == UIDevice.BatteryState.unknown {
        result(FlutterError(code: "UNAVAILABLE",
                            message: "Battery info unavailable",
                            details: nil))
      } else {
          result(Int(device.batteryLevel * 100))
        }
    }
}
