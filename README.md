# 🎬 My YouTube List 

* YouTube URl로 영상을 가져와서 리스트에 등록하고 해당 영상을 재생합니다.   
   
<img src="https://user-images.githubusercontent.com/59474775/128483712-6937a6f0-af59-4e09-9edd-2e68e82aef94.png" height=500 >  <img src="https://user-images.githubusercontent.com/59474775/128163822-c7a89149-5ca3-47d9-9d2c-f195c49587d7.png" height=500 >  <img src="https://user-images.githubusercontent.com/59474775/128483877-f25c7b9e-1d06-441b-bb55-a44c30274897.png" height=500 >  <img src="https://user-images.githubusercontent.com/59474775/128483940-4a33287f-2e50-4526-bf90-5b4e100fae37.png" height=500 >
   
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
    `UIWebView`에 대한 대응도 미흡할것이라 생각하여 `WKWebView`로 개발 된 [YoutubePlayer in WKWebView](https://github.com/hmhv/YoutubePlayer-in-WKWebView) 를 
    사용했습니다.   
    영상을 표시할 `WKYTPlayerView`는 대부분의 영상이 16:9비율로 제작되기 때문에 16:9비율로 제약을 추가하였습니다.    
  * YouTube 썸네일Image 불러오기         
    **Kingfisher** 라이브러리를 사용하여 YouTube영상의 썸네일 이미지를 불러왔습니다.   
    해당 영상의 URl주소 고유 Key값으로 불러올수 있습니다.
  * **Alert** 에 TextField추가하기  
    본 프로젝트에서는 NavigatoinBar에 버튼을 추가하여 Alert을 띄우고 `TextField`를 통해 URl데이터를 받아오는 방식으로 구현하였습니다.   
    "ok" 버튼을 누르면 `TextField`에 작성한 URl에서 정규식을 이용하여 key값을 따로 분리 후 재사용성을 위하여 model에 저장 하였습니다.   
    해당 key값은 영상 불러오기, 썸네일 이미지 불러오기, 영상제목 표시 등에 사용됩니다.   
  * Swipe로 삭제하는 기능 구현   
    TableView에 추가한 영상을 삭제할때 Swipe가능을 사용하였습니다.    
    `trailingSwipeActionsConfigurationForRowAt`메소드를 호출하여 delete메소드에 선택된 indexPath를 전달하였고   
    delete메소드에서 파라미터로 받은 indexPath로 remove메소드와 deleteRows를 호출하였습니다.   
    `performsFirstActionWithFullSwipe` 메소드로 첫번째 swipe Action이 실행되어 제거되게 하였습니다.   
    <img src="https://user-images.githubusercontent.com/59474775/128484455-240f6da5-3670-4361-88f6-0f9c5c92332b.gif" height=500 >   
  * 영상 추가시간 표시   
    영상을 추가했을때 추가한 시간을 cell에 나타내기 위해서 `DateFormatter`를 사용했습니다.   
    Alert에서 URl을 추가할때 cell의 `textLabel`로 값을 넘겨줍니다.   
  * 즐겨찾기 추가

* 개선사항   
  * 잘못된 URl을 입력시 영상과 썸네일을 받아오지 못하는 것을 확인 하였습니다.    
    key값을 구하지 못할경우 알림을 띄우게 하였지만 이는 근본적인 해결방안이 아닌것 같습니다.
   
* 향후 계획   
  (향후 계획의 내용중 구현한 기능은 삭선으로 표시후 구현한 내용 목록으로 이동합니다.)
  * 영상을 추가할때 영상제목을 URl의 key값으로 설정되게 하였습니다. 원본 영상의 제목으로 설정되게 합니다.
  * ~영상목록중 자주보는 영상은 즐겨찾기 표시를 하여 쉽게 찾을수 있도록 즐겨찾기 기능을 추가합니다.~
  * TableView의 Reordering기능을 추가합니다.
  * 영상의 수가 많아질경우를 대비하여 검색 기능을 추가합니다.   
  
## Implementation  
   
### Feature   
* URl로 영상으로 추가하고 해당 영상으로 재생하는 기능   

<img src="https://user-images.githubusercontent.com/59474775/128484388-b765a0db-1b04-4dee-9c15-708f59eb455b.gif" height=500 >  <img src="https://user-images.githubusercontent.com/59474775/128151240-640804d4-a346-478a-ad6d-5c513cb9f641.gif" height=500 >   


