export interface MomentDataItem {
  headSrc: Resource;
  nickName: Resource;
  content: string;
  time: string;
  imageList: string[];
}

export interface RouterParamsData {
  content: string;
  imageList: string[];
}

export interface RouterParams {
  data: RouterParamsData;
}
