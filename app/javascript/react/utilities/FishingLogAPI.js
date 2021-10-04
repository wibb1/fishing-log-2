import getSpecies from './Old_For_Delete/GetSpecies'
import getData from './GetData'
import deleteData from './DeleteData'
import postData from './PostData'
import patchData from './PatchData'

class FishingLogAPI {

  static patchData(dataType, id, payload){
    return patchData(dataType, id, payload)
  }

  static postData(dataType, payload){
    return postData(dataType, payload)
  }

  static getSpecies(){
    return getSpecies()
  }

  static getData(dataType, id){
    return getData(dataType, id)
  }

  static deleteData(dataType, id){
    return deleteData(dataType, id)
  }

}

export default FishingLogAPI