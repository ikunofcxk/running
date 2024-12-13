// MessageData.ets
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

/**
 * List item data entity.
 */
export default class MessageData  {
  /**
   * ID of list item.
   */
  id: number;
  /**
   * Text of list item.
   */
  title: string;    // 消息标题
  /**
   * Image of list item.
   */
  img: Resource;
  /**
   * Other resource of list item.
   */

  content: string;  // 消息内容摘要
  time: string;     // 消息时间
  unread: boolean;  // 是否未读


  constructor(id: number, title: string, img: Resource,content : string,time : string, unread: boolean) {
    this.id = id;
    this.title = title;
    this.img = img;

    this.content = content;
    this.time = time;
    this.unread = unread;
  }
}