//
//  OrderStatus.swift
//  Yandmi
//
//  Created by Nikita Yashchenko on 15.08.2022.
//

import Foundation
import SwiftUI

enum OrderStatus: String, CaseIterable {
    case new = "Новый"
    case cooking = "Готовится"
    case delivery =  "Доставляется"
    case completed = "Выполнен"
    case cancelled = "Отменён"
}
