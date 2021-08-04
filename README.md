# 🎬 My YouTube List 

* YouTube URl로 영상을 가져와서 리스트에 등록하고 해당 영상을 재생합니다.   
   
<img src="https://user-images.githubusercontent.com/59474775/128149152-22a31a76-9cde-4b18-827a-b1c98601d9e2.png" height=550 >  <img src="https://user-images.githubusercontent.com/59474775/128163822-c7a89149-5ca3-47d9-9d2c-f195c49587d7.png" height=550 >  <img src="https://user-images.githubusercontent.com/59474775/128164207-fd2dc16e-abbc-4bb5-81e8-88047fc10620.png" height=550 >
   
## Description   
   
* 개인 프로젝트
* 기간: 2021.07.31 ~  
* Tech/framework used
  * Language: Swift
  * Framework: UIKit   
  * Library: YoutubePlayer in WKWebView, Kingfisher
* 구현한 내용
  * **MVC Design Pattern**으로 구현하기 위해 model생성 
  * YouTube영상 표시하기      
    처음 계획에는 [youtube-ios-player](https://github.com/youtube/youtube-ios-player-helper) 라이브러리를 사용하려 했으나 오랜 기간동안 업데이트가
    안되어 있고   
    **UIWebView**에 대한 대응도 미흡할것이라 생각하여 **WKWebView**로 개발 된 [YoutubePlayer in WKWebView](https://github.com/hmhv/YoutubePlayer-in-WKWebView) 를 
    사용했습니다.
  * **Kingfisher** 라이브러리를 사용하여 YouTube영상의 썸네일 이미지 불러오기.  
    해당 영상의 URl주소 고유 Key값으로 불러올수 있습니다. 
    

## Implementation  
   
### Feature   
* URl로 영상으로 추가하고 해당 영상으로 재생하는 기능   

<img src="https://user-images.githubusercontent.com/59474775/128144520-c5e3049f-031c-4632-9b11-033a79dfd345.gif" height=550 >  <img src="https://user-images.githubusercontent.com/59474775/128151240-640804d4-a346-478a-ad6d-5c513cb9f641.gif" height=550 >   

* Swipe를 사용하여 cell삭제 및 전체 swipe기능
   
<img src="https://user-images.githubusercontent.com/59474775/128155675-bfb73b0f-19b9-4e70-8260-89207abe8d93.gif" height=550 >  <img src="https://user-images.githubusercontent.com/59474775/128156047-1fb85143-66f2-4408-8d5b-2ecec636605f.gif" height=550 >

