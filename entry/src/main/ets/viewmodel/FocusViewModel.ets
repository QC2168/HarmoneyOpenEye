import { getFocusData } from '../http/apiService';
import { FocusModelItemList } from '../model/FocusModel';
import { BaseViewModel, ResultCallback } from './BaseViewModel';

export class FocusViewModel extends BaseViewModel {
  pageIndex: number = 0

  async getFocusData(resultCallback: ResultCallback<FocusModelItemList[]>) {
    await this.httpRequest()
      .promise(getFocusData(this.pageIndex), this.pageIndex == 0 ? true : false)
      .then((result) => {
        this.pageIndex++
        resultCallback(result.itemList)
      })
  }
}

let focusViewModel = new FocusViewModel()

export default focusViewModel as FocusViewModel