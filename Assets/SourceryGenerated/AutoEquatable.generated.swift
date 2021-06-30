// Generated using Sourcery 1.4.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable file_length
fileprivate func compareOptionals<T>(lhs: T?, rhs: T?, compare: (_ lhs: T, _ rhs: T) -> Bool) -> Bool {
    switch (lhs, rhs) {
    case let (lValue?, rValue?):
        return compare(lValue, rValue)
    case (nil, nil):
        return true
    default:
        return false
    }
}

fileprivate func compareArrays<T>(lhs: [T], rhs: [T], compare: (_ lhs: T, _ rhs: T) -> Bool) -> Bool {
    guard lhs.count == rhs.count else { return false }
    for (idx, lhsItem) in lhs.enumerated() {
        guard compare(lhsItem, rhs[idx]) else { return false }
    }

    return true
}


// MARK: - AutoEquatable for classes, protocols, structs
// MARK: - Asset AutoEquatable
extension Asset: Equatable {}
internal func == (lhs: Asset, rhs: Asset) -> Bool {
    guard lhs.checkStatus == rhs.checkStatus else { return false }
    guard lhs.tagNumber == rhs.tagNumber else { return false }
    guard lhs.assetName == rhs.assetName else { return false }
    guard lhs.isCheck == rhs.isCheck else { return false }
    guard lhs.assetId == rhs.assetId else { return false }
    guard lhs.checkStatusName == rhs.checkStatusName else { return false }
    return true
}
// MARK: - AssetInventoryListDetail AutoEquatable
extension AssetInventoryListDetail: Equatable {}
internal func == (lhs: AssetInventoryListDetail, rhs: AssetInventoryListDetail) -> Bool {
    guard lhs.isCheck == rhs.isCheck else { return false }
    guard lhs.assetId == rhs.assetId else { return false }
    guard lhs.tagNumber == rhs.tagNumber else { return false }
    guard lhs.assetName == rhs.assetName else { return false }
    guard lhs.checkTime == rhs.checkTime else { return false }
    guard lhs.checkStatus == rhs.checkStatus else { return false }
    guard lhs.checkStatusName == rhs.checkStatusName else { return false }
    guard lhs.realLocationCode == rhs.realLocationCode else { return false }
    guard lhs.realLocationName == rhs.realLocationName else { return false }
    guard lhs.locationCode == rhs.locationCode else { return false }
    guard lhs.locationName == rhs.locationName else { return false }
    guard lhs.checkPerson == rhs.checkPerson else { return false }
    guard lhs.lastCheckPerson == rhs.lastCheckPerson else { return false }
    guard lhs.manufactureName == rhs.manufactureName else { return false }
    guard lhs.modelNumber == rhs.modelNumber else { return false }
    guard lhs.quantity == rhs.quantity else { return false }
    guard lhs.dutyPerson == rhs.dutyPerson else { return false }
    guard lhs.dutyPersonName == rhs.dutyPersonName else { return false }
    guard lhs.usePerson == rhs.usePerson else { return false }
    guard lhs.usePersonName == rhs.usePersonName else { return false }
    guard lhs.typeDescriptionCode == rhs.typeDescriptionCode else { return false }
    guard lhs.typeDescriptionName == rhs.typeDescriptionName else { return false }
    guard lhs.longitude == rhs.longitude else { return false }
    guard lhs.latitude == rhs.latitude else { return false }
    guard lhs.mapLocationDesc == rhs.mapLocationDesc else { return false }
    guard lhs.assetCheckItem == rhs.assetCheckItem else { return false }
    guard lhs.assetCheckItemName == rhs.assetCheckItemName else { return false }
    guard lhs.resourceNumber == rhs.resourceNumber else { return false }
    return true
}
// MARK: - AssetListDetail AutoEquatable
extension AssetListDetail: Equatable {}
internal func == (lhs: AssetListDetail, rhs: AssetListDetail) -> Bool {
    guard lhs.isCheck == rhs.isCheck else { return false }
    guard lhs.assetId == rhs.assetId else { return false }
    guard lhs.assetKindId == rhs.assetKindId else { return false }
    guard lhs.bookTypeCode == rhs.bookTypeCode else { return false }
    guard lhs.assetNumber == rhs.assetNumber else { return false }
    guard lhs.tagNumber == rhs.tagNumber else { return false }
    guard lhs.assetName == rhs.assetName else { return false }
    guard lhs.manufactureName == rhs.manufactureName else { return false }
    guard lhs.modelNumber == rhs.modelNumber else { return false }
    guard lhs.keyId == rhs.keyId else { return false }
    guard lhs.quantity == rhs.quantity else { return false }
    guard lhs.uom == rhs.uom else { return false }
    guard lhs.regionIdCompany == rhs.regionIdCompany else { return false }
    guard lhs.regionIdDept == rhs.regionIdDept else { return false }
    guard lhs.regionIdManage == rhs.regionIdManage else { return false }
    guard lhs.assetLocationId == rhs.assetLocationId else { return false }
    guard lhs.assetLocationCode == rhs.assetLocationCode else { return false }
    guard lhs.assetLocationName == rhs.assetLocationName else { return false }
    guard lhs.dutyPersonId == rhs.dutyPersonId else { return false }
    guard lhs.dutyPersonCode == rhs.dutyPersonCode else { return false }
    guard lhs.dutyPersonName == rhs.dutyPersonName else { return false }
    guard lhs.usedPersonId == rhs.usedPersonId else { return false }
    guard lhs.usedPersonAccount == rhs.usedPersonAccount else { return false }
    guard lhs.usedPersonName == rhs.usedPersonName else { return false }
    guard lhs.assetUsedStatus == rhs.assetUsedStatus else { return false }
    guard lhs.assetStatus == rhs.assetStatus else { return false }
    guard lhs.erpCreationDate == rhs.erpCreationDate else { return false }
    guard lhs.enableDate == rhs.enableDate else { return false }
    guard lhs.assetKindName == rhs.assetKindName else { return false }
    guard lhs.typeDescriptionCode == rhs.typeDescriptionCode else { return false }
    guard lhs.typeDescriptionName == rhs.typeDescriptionName else { return false }
    guard lhs.assetStatusName == rhs.assetStatusName else { return false }
    guard lhs.keyCode == rhs.keyCode else { return false }
    guard lhs.keyName == rhs.keyName else { return false }
    guard lhs.companyName == rhs.companyName else { return false }
    guard lhs.deptName == rhs.deptName else { return false }
    guard lhs.manageDeptName == rhs.manageDeptName else { return false }
    guard lhs.erpType == rhs.erpType else { return false }
    guard lhs.erpTypeName == rhs.erpTypeName else { return false }
    guard lhs.isWlKind == rhs.isWlKind else { return false }
    guard lhs.queryStatus == rhs.queryStatus else { return false }
    return true
}
// MARK: - AssetTask AutoEquatable
extension AssetTask: Equatable {}
internal func == (lhs: AssetTask, rhs: AssetTask) -> Bool {
    guard lhs.isCheck == rhs.isCheck else { return false }
    guard lhs.checkBillCode == rhs.checkBillCode else { return false }
    guard lhs.taskNumber == rhs.taskNumber else { return false }
    guard lhs.taskStatus == rhs.taskStatus else { return false }
    guard lhs.taskStatusName == rhs.taskStatusName else { return false }
    guard lhs.taskName == rhs.taskName else { return false }
    return true
}
// MARK: - AssetTaskDetail AutoEquatable
extension AssetTaskDetail: Equatable {}
internal func == (lhs: AssetTaskDetail, rhs: AssetTaskDetail) -> Bool {
    guard lhs.isCheck == rhs.isCheck else { return false }
    guard lhs.checkBillCode == rhs.checkBillCode else { return false }
    guard lhs.taskNumber == rhs.taskNumber else { return false }
    guard lhs.taskName == rhs.taskName else { return false }
    guard lhs.locationCode == rhs.locationCode else { return false }
    guard lhs.checkPerson == rhs.checkPerson else { return false }
    guard lhs.checkCount == rhs.checkCount else { return false }
    guard lhs.unCheckCount == rhs.unCheckCount else { return false }
    guard lhs.alreadyCheckCount == rhs.alreadyCheckCount else { return false }
    guard lhs.lessCount == rhs.lessCount else { return false }
    guard lhs.moreCount == rhs.moreCount else { return false }
    guard lhs.longitude == rhs.longitude else { return false }
    guard lhs.latitude == rhs.latitude else { return false }
    guard lhs.mapLocationDesc == rhs.mapLocationDesc else { return false }
    guard lhs.taskStatus == rhs.taskStatus else { return false }
    guard lhs.taskStatusName == rhs.taskStatusName else { return false }
    guard lhs.checkTaskStatus == rhs.checkTaskStatus else { return false }
    guard lhs.checkTaskStatusName == rhs.checkTaskStatusName else { return false }
    guard lhs.checkTaskTime == rhs.checkTaskTime else { return false }
    return true
}
// MARK: - AssetTaskInventory AutoEquatable
extension AssetTaskInventory: Equatable {}
internal func == (lhs: AssetTaskInventory, rhs: AssetTaskInventory) -> Bool {
    guard lhs.isCheck == rhs.isCheck else { return false }
    guard lhs.assetId == rhs.assetId else { return false }
    guard lhs.checkBillCode == rhs.checkBillCode else { return false }
    guard lhs.checkStatus == rhs.checkStatus else { return false }
    guard lhs.checkStatusName == rhs.checkStatusName else { return false }
    guard lhs.tagNumber == rhs.tagNumber else { return false }
    guard lhs.assetName == rhs.assetName else { return false }
    guard lhs.imageCount == rhs.imageCount else { return false }
    return true
}
// MARK: - AssetTaskInventoryDetail AutoEquatable
extension AssetTaskInventoryDetail: Equatable {}
internal func == (lhs: AssetTaskInventoryDetail, rhs: AssetTaskInventoryDetail) -> Bool {
    guard lhs.checkStatusName == rhs.checkStatusName else { return false }
    guard lhs.isCheck == rhs.isCheck else { return false }
    guard lhs.usePerson == rhs.usePerson else { return false }
    guard lhs.checkTime == rhs.checkTime else { return false }
    guard lhs.tagNumber == rhs.tagNumber else { return false }
    guard lhs.realLocationName == rhs.realLocationName else { return false }
    guard lhs.mapLocationDesc == rhs.mapLocationDesc else { return false }
    guard lhs.usePersonName == rhs.usePersonName else { return false }
    guard lhs.checkPerson == rhs.checkPerson else { return false }
    guard lhs.latitude == rhs.latitude else { return false }
    guard lhs.dutyPerson == rhs.dutyPerson else { return false }
    guard lhs.assetCheckItemName == rhs.assetCheckItemName else { return false }
    guard lhs.deptId == rhs.deptId else { return false }
    guard lhs.locationCode == rhs.locationCode else { return false }
    guard lhs.modelNumber == rhs.modelNumber else { return false }
    guard lhs.realLocationCode == rhs.realLocationCode else { return false }
    guard lhs.quantity == rhs.quantity else { return false }
    guard lhs.cityId == rhs.cityId else { return false }
    guard lhs.assetCheckItem == rhs.assetCheckItem else { return false }
    guard lhs.longitude == rhs.longitude else { return false }
    guard lhs.deptName == rhs.deptName else { return false }
    guard lhs.assetName == rhs.assetName else { return false }
    guard lhs.manageDeptId == rhs.manageDeptId else { return false }
    guard lhs.manufactureName == rhs.manufactureName else { return false }
    guard lhs.dutyPersonName == rhs.dutyPersonName else { return false }
    guard lhs.checkStatus == rhs.checkStatus else { return false }
    guard lhs.checkBillCode == rhs.checkBillCode else { return false }
    guard lhs.locationName == rhs.locationName else { return false }
    guard lhs.cityName == rhs.cityName else { return false }
    guard lhs.manageDeptName == rhs.manageDeptName else { return false }
    guard lhs.assetId == rhs.assetId else { return false }
    guard lhs.serial == rhs.serial else { return false }
    return true
}
// MARK: - Credential AutoEquatable
extension Credential: Equatable {}
internal func == (lhs: Credential, rhs: Credential) -> Bool {
    guard lhs.pageSize == rhs.pageSize else { return false }
    guard lhs.userOrgId == rhs.userOrgId else { return false }
    guard lhs.userName == rhs.userName else { return false }
    guard lhs.userCityId == rhs.userCityId else { return false }
    guard lhs.userCityName == rhs.userCityName else { return false }
    guard lhs.userToken == rhs.userToken else { return false }
    guard lhs.userAccount == rhs.userAccount else { return false }
    guard lhs.userOrgName == rhs.userOrgName else { return false }
    return true
}
// MARK: - IsLogin AutoEquatable
extension IsLogin: Equatable {}
internal func == (lhs: IsLogin, rhs: IsLogin) -> Bool {
    guard lhs.loginId == rhs.loginId else { return false }
    guard lhs.userToken == rhs.userToken else { return false }
    guard lhs.userAccount == rhs.userAccount else { return false }
    guard lhs.loginDate == rhs.loginDate else { return false }
    guard lhs.logoutDate == rhs.logoutDate else { return false }
    guard lhs.tokenStatus == rhs.tokenStatus else { return false }
    guard lhs.appType == rhs.appType else { return false }
    return true
}
// MARK: - Location AutoEquatable
extension Location: Equatable {}
internal func == (lhs: Location, rhs: Location) -> Bool {
    guard lhs.isCheck == rhs.isCheck else { return false }
    guard lhs.locationCode == rhs.locationCode else { return false }
    guard lhs.locationName == rhs.locationName else { return false }
    guard lhs.assetLocationId == rhs.assetLocationId else { return false }
    guard lhs.stLongitude == rhs.stLongitude else { return false }
    guard lhs.strLatitude == rhs.strLatitude else { return false }
    return true
}
// MARK: - LocationDetail AutoEquatable
extension LocationDetail: Equatable {}
internal func == (lhs: LocationDetail, rhs: LocationDetail) -> Bool {
    guard lhs.assetLocationId == rhs.assetLocationId else { return false }
    guard lhs.strLongitude == rhs.strLongitude else { return false }
    guard lhs.locationClass == rhs.locationClass else { return false }
    guard lhs.regionIdDept == rhs.regionIdDept else { return false }
    guard lhs.locationOwner == rhs.locationOwner else { return false }
    guard lhs.isCheck == rhs.isCheck else { return false }
    guard lhs.regionIdCompany == rhs.regionIdCompany else { return false }
    guard lhs.province == rhs.province else { return false }
    guard lhs.road == rhs.road else { return false }
    guard lhs.regionIdManage == rhs.regionIdManage else { return false }
    guard lhs.enabledFlag == rhs.enabledFlag else { return false }
    guard lhs.locationOwnerName == rhs.locationOwnerName else { return false }
    guard lhs.latitude == rhs.latitude else { return false }
    guard lhs.city == rhs.city else { return false }
    guard lhs.village == rhs.village else { return false }
    guard lhs.locationId == rhs.locationId else { return false }
    guard lhs.town == rhs.town else { return false }
    guard lhs.locationCode == rhs.locationCode else { return false }
    guard lhs.strLatitude == rhs.strLatitude else { return false }
    guard lhs.locationType == rhs.locationType else { return false }
    guard lhs.longitude == rhs.longitude else { return false }
    guard lhs.deptName == rhs.deptName else { return false }
    guard lhs.companyName == rhs.companyName else { return false }
    guard lhs.locationClassName == rhs.locationClassName else { return false }
    guard lhs.county == rhs.county else { return false }
    guard lhs.locationTypeName == rhs.locationTypeName else { return false }
    guard lhs.effectiveDate == rhs.effectiveDate else { return false }
    guard lhs.locationName == rhs.locationName else { return false }
    return true
}
// MARK: - Photo AutoEquatable
extension Photo: Equatable {}
internal func == (lhs: Photo, rhs: Photo) -> Bool {
    guard lhs.imageId == rhs.imageId else { return false }
    guard lhs.imagePath == rhs.imagePath else { return false }
    guard lhs.imageName == rhs.imageName else { return false }
    guard lhs.uploadTime == rhs.uploadTime else { return false }
    guard lhs.uploadType == rhs.uploadType else { return false }
    guard lhs.uploadPerson == rhs.uploadPerson else { return false }
    guard lhs.longitude == rhs.longitude else { return false }
    guard lhs.latitude == rhs.latitude else { return false }
    guard lhs.url == rhs.url else { return false }
    return true
}
// MARK: - Staff AutoEquatable
extension Staff: Equatable {}
internal func == (lhs: Staff, rhs: Staff) -> Bool {
    guard lhs.isCheck == rhs.isCheck else { return false }
    guard lhs.account == rhs.account else { return false }
    guard lhs.userName == rhs.userName else { return false }
    guard lhs.userCode == rhs.userCode else { return false }
    guard lhs.userOrgName == rhs.userOrgName else { return false }
    guard lhs.category == rhs.category else { return false }
    return true
}
// MARK: - Transform AutoEquatable
extension Transform: Equatable {}
internal func == (lhs: Transform, rhs: Transform) -> Bool {
    guard lhs.appTaskId == rhs.appTaskId else { return false }
    guard lhs.appTaskCode == rhs.appTaskCode else { return false }
    guard lhs.appTaskStatus == rhs.appTaskStatus else { return false }
    guard lhs.appTaskStatusName == rhs.appTaskStatusName else { return false }
    guard lhs.locationCode == rhs.locationCode else { return false }
    guard lhs.locationName == rhs.locationName else { return false }
    guard lhs.assetSum == rhs.assetSum else { return false }
    guard lhs.assetFinished == rhs.assetFinished else { return false }
    guard lhs.assetUnfinished == rhs.assetUnfinished else { return false }
    return true
}
// MARK: - Version AutoEquatable
extension Version: Equatable {}
internal func == (lhs: Version, rhs: Version) -> Bool {
    guard lhs.appType == rhs.appType else { return false }
    guard lhs.appVersionCode == rhs.appVersionCode else { return false }
    guard lhs.appVersionName == rhs.appVersionName else { return false }
    guard lhs.appName == rhs.appName else { return false }
    guard lhs.appPath == rhs.appPath else { return false }
    guard lhs.appDownloadUrl == rhs.appDownloadUrl else { return false }
    guard lhs.appDesc == rhs.appDesc else { return false }
    guard lhs.appExt == rhs.appExt else { return false }
    return true
}

// MARK: - AutoEquatable for Enums
