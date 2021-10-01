import deleteRecord from './DeleteRecord'
import getRecord from './GetRecord'
import getRecords from './GetRecords'
import patchRecord from './PatchRecord'
import postRecord from './PostRecord'


class FishingLogAPI {
  static getRecords() {
    return getRecords()
  }

  static getRecord(id) {
    return getRecord(id)
  }

  static patchRecord(id, payload){
    return patchRecord(id, payload)
  }

  static deleteRecord(id){
    return deleteRecord(id)
  }

  static postRecord(payload){
    return postRecord(payload)
  }
}

export default FishingLogAPI