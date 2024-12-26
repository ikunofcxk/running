/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import ItemData from './SettingItemData';

/**
 * Binds data to components and provides interfaces.
 */
export class MainViewModel {
  /**
   * Get swiper image data.
   *
   * @return {Array<Resource>} swiperImages.
   */


  getSettingListData(): Array<Array<ItemData>> {
    let settingListData: ItemData[][] = [
      [
        new ItemData(0, $r('app.string.setting_list_news'), $r('app.media.news'), $r("app.string.setting_toggle"))
      ],



      [
        new ItemData(0, $r('app.string.clear_cache'), $r('app.media.storage')),

      ],
      [
        new ItemData(0, $r('app.string.setting_list_about'), $r('app.media.about'))
      ]
    ];
    return settingListData;
  }
}

export default new MainViewModel();