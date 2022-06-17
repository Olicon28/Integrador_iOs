//
//  Participants.swift
//  NotBoredV1
//
//  Created by Cristian Bahamondes on 13-06-22.
//

import Foundation

struct Participants:ParticipantsProtocol {

    //MARK: Singleton
    static var shared = Participants()
    //MARK: Propiedades
    var cantParticipants: Int
    var actividadSeleccionada : String
    //MARK: Metodos
    init(cantParticipants:Int = 0, actividadSeleccionada:String = String()) {
        self.cantParticipants = cantParticipants
        self.actividadSeleccionada = actividadSeleccionada
    }
}
