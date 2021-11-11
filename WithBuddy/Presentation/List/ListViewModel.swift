//
//  ListViewModel.swift
//  WithBuddy
//
//  Created by 박정아 on 2021/11/04.
//

import Foundation

final class ListViewModel {
    
    @Published private(set) var gatheringList: [Gathering] = []
    private let buddyUseCase: BuddyUseCase
    private let gatheringUseCase: GatheringUseCase
    
    init(buddyUseCase: BuddyUseCase, gatheringUseCase: GatheringUseCase) {
        self.buddyUseCase = BuddyUseCase(coreDataManager: CoreDataManager.shared)
        self.gatheringUseCase = GatheringUseCase(coreDataManager: CoreDataManager.shared)
        self.configure()
    }
    
    var count: Int {
        return gatheringList.count
    }
    
    subscript(index: Int) -> Gathering {
        return self.gatheringList.reversed()[index]
    }
    
    private func configure() {
//        self.insert()
        self.fetch()
    }
    
    func fetch() {
        self.gatheringList = self.gatheringUseCase.fetchGathering()
    }
    
    let buddy1 = Buddy(id: UUID(), name: "정아", face: "FacePurple1")
    let buddy2 = Buddy(id: UUID(), name: "나정", face: "FacePink5")
    let buddy3 = Buddy(id: UUID(), name: "인우", face: "FaceBlue7")
    let buddy4 = Buddy(id: UUID(), name: "두연", face: "FaceGreen9")
    let buddy5 = Buddy(id: UUID(), name: "나현", face: "FaceRed2")
    let buddy6 = Buddy(id: UUID(), name: "은혜", face: "FaceYellow3")
    let buddy7 = Buddy(id: UUID(), name: "민성", face: "FaceBlue4")
    let buddy8 = Buddy(id: UUID(), name: "정현", face: "FaceGreen8")
    let buddy9 = Buddy(id: UUID(), name: "아현", face: "FacePink6")
    
    let date1 = Calendar.current.date(from: DateComponents(year: 2021, month: 10, day: 1)) ?? Date()
    let date2 = Calendar.current.date(from: DateComponents(year: 2021, month: 10, day: 4)) ?? Date()
    let date3 = Calendar.current.date(from: DateComponents(year: 2021, month: 10, day: 6)) ?? Date()
    let date4 = Calendar.current.date(from: DateComponents(year: 2021, month: 10, day: 8)) ?? Date()
    let date5 = Calendar.current.date(from: DateComponents(year: 2021, month: 10, day: 10)) ?? Date()
    let date6 = Calendar.current.date(from: DateComponents(year: 2021, month: 10, day: 13)) ?? Date()
    let date7 = Calendar.current.date(from: DateComponents(year: 2021, month: 10, day: 15)) ?? Date()
    let date8 = Calendar.current.date(from: DateComponents(year: 2021, month: 10, day: 21)) ?? Date()
    let date9 = Calendar.current.date(from: DateComponents(year: 2021, month: 11, day: 1)) ?? Date()
    let date10 = Calendar.current.date(from: DateComponents(year: 2021, month: 11, day: 13)) ?? Date()
    
    private func insert() {
        self.buddyUseCase.insertBuddy(buddy1)
        self.buddyUseCase.insertBuddy(buddy2)
        self.buddyUseCase.insertBuddy(buddy3)
        self.buddyUseCase.insertBuddy(buddy4)
        self.buddyUseCase.insertBuddy(buddy5)
        self.buddyUseCase.insertBuddy(buddy6)
        self.buddyUseCase.insertBuddy(buddy7)
        self.buddyUseCase.insertBuddy(buddy8)
        self.buddyUseCase.insertBuddy(buddy9)
        
        self.gatheringUseCase.insertGathering(Gathering(startDate: date1, endDate: date1, place: nil, purpose: [], buddyList: [buddy1], memo: nil, picture: nil))
        self.gatheringUseCase.insertGathering(Gathering(startDate: date2, endDate: date2, place: nil, purpose: [], buddyList: [buddy2], memo: nil, picture: nil))
        self.gatheringUseCase.insertGathering(Gathering(startDate: date3, endDate: date3, place: nil, purpose: [], buddyList: [buddy3], memo: nil, picture: nil))
        self.gatheringUseCase.insertGathering(Gathering(startDate: date4, endDate: date4, place: nil, purpose: [], buddyList: [buddy1, buddy2, buddy3], memo: nil, picture: nil))
        self.gatheringUseCase.insertGathering(Gathering(startDate: date5, endDate: date5, place: nil, purpose: [], buddyList: [buddy4], memo: nil, picture: nil))
        self.gatheringUseCase.insertGathering(Gathering(startDate: date6, endDate: date6, place: nil, purpose: [], buddyList: [buddy5], memo: nil, picture: nil))
        self.gatheringUseCase.insertGathering(Gathering(startDate: date7, endDate: date7, place: nil, purpose: [], buddyList: [buddy6, buddy6, buddy6, buddy6, buddy6, buddy6, buddy6, buddy6], memo: nil, picture: nil))
        self.gatheringUseCase.insertGathering(Gathering(startDate: date8, endDate: date8, place: nil, purpose: [], buddyList: [buddy3], memo: nil, picture: nil))
        self.gatheringUseCase.insertGathering(Gathering(startDate: date9, endDate: date9, place: nil, purpose: [], buddyList: [buddy2, buddy3], memo: nil, picture: nil))
        self.gatheringUseCase.insertGathering(Gathering(startDate: date10, endDate: date10, place: nil, purpose: [], buddyList: [buddy1], memo: nil, picture: nil))
    }
    
}
