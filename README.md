# ๐ฌ My YouTube List 

* YouTube URl๋ก ์์์ ๊ฐ์ ธ์์ ๋ฆฌ์คํธ์ ๋ฑ๋กํ๊ณ  ํด๋น ์์์ ์ฌ์ํฉ๋๋ค.   
   
<img src="https://user-images.githubusercontent.com/59474775/128483712-6937a6f0-af59-4e09-9edd-2e68e82aef94.png" height=500 >  <img src="https://user-images.githubusercontent.com/59474775/128163822-c7a89149-5ca3-47d9-9d2c-f195c49587d7.png" height=500 >  <img src="https://user-images.githubusercontent.com/59474775/128483877-f25c7b9e-1d06-441b-bb55-a44c30274897.png" height=500 >  <img src="https://user-images.githubusercontent.com/59474775/128483940-4a33287f-2e50-4526-bf90-5b4e100fae37.png" height=500 >
   
## Description   
   
* ๊ฐ์ธ ํ๋ก์ ํธ
* ๊ธฐ๊ฐ: 2021.07.31 ~ 2021.08.08 
* Tech/framework used
  * Language: Swift
  * Framework: UIKit   
  * Library: YoutubePlayer in WKWebView, Kingfisher
* ๊ตฌํํ ๋ด์ฉ
  * **MVC Design Pattern**์ผ๋ก ๊ตฌํํ๊ธฐ ์ํด model์์ฑ 
  * YouTube์์ ํ์ํ๊ธฐ      
    ์ฒ์ ๊ณํ์๋ [youtube-ios-player](https://github.com/youtube/youtube-ios-player-helper) ๋ผ์ด๋ธ๋ฌ๋ฆฌ๋ฅผ ์ฌ์ฉํ๋ ค ํ์ผ๋ ์ค๋ ๊ธฐ๊ฐ๋์ ์๋ฐ์ดํธ๊ฐ
    ์๋์ด ์๊ณ    
    `UIWebView`์ ๋ํ ๋์๋ ๋ฏธํกํ ๊ฒ์ด๋ผ ์๊ฐํ์ฌ `WKWebView`๋ก ๊ฐ๋ฐ ๋ [YoutubePlayer in WKWebView](https://github.com/hmhv/YoutubePlayer-in-WKWebView) ๋ฅผ 
    ์ฌ์ฉํ์ต๋๋ค.   
    ์์์ ํ์ํ  `WKYTPlayerView`๋ ๋๋ถ๋ถ์ ์์์ด 16:9๋น์จ๋ก ์ ์๋๊ธฐ ๋๋ฌธ์ 16:9๋น์จ๋ก ์ ์ฝ์ ์ถ๊ฐํ์์ต๋๋ค.    
  * YouTube ์ธ๋ค์ผImage ๋ถ๋ฌ์ค๊ธฐ         
    `Kingfisher` ๋ผ์ด๋ธ๋ฌ๋ฆฌ๋ฅผ ์ฌ์ฉํ์ฌ YouTube์์์ ์ธ๋ค์ผ ์ด๋ฏธ์ง๋ฅผ ๋ถ๋ฌ์์ต๋๋ค.   
    ํด๋น ์์์ URl์ฃผ์ ๊ณ ์  Key๊ฐ์ผ๋ก ๋ถ๋ฌ์ฌ์ ์์ต๋๋ค.
  * **Alert** ์ TextField์ถ๊ฐํ๊ธฐ  
    ๋ณธ ํ๋ก์ ํธ์์๋ NavigatoinBar์ ๋ฒํผ์ ์ถ๊ฐํ์ฌ Alert์ ๋์ฐ๊ณ  `TextField`๋ฅผ ํตํด URl๋ฐ์ดํฐ๋ฅผ ๋ฐ์์ค๋ ๋ฐฉ์์ผ๋ก ๊ตฌํํ์์ต๋๋ค.   
    "ok" ๋ฒํผ์ ๋๋ฅด๋ฉด `TextField`์ ์์ฑํ URl์์ ์ ๊ท์์ ์ด์ฉํ์ฌ key๊ฐ์ ๋ฐ๋ก ๋ถ๋ฆฌ ํ ์ฌ์ฌ์ฉ์ฑ์ ์ํ์ฌ list๋ฐฐ์ด์ ์ ์ฅ ํ์์ต๋๋ค.   
    ํด๋น key๊ฐ์ ์์ ๋ถ๋ฌ์ค๊ธฐ, ์ธ๋ค์ผ ์ด๋ฏธ์ง ๋ถ๋ฌ์ค๊ธฐ, ์์์ ๋ชฉ ํ์ ๋ฑ์ ์ฌ์ฉ๋ฉ๋๋ค.   
  * Swipe๋ก ์ญ์ ํ๋ ๊ธฐ๋ฅ ๊ตฌํ   
    TableView์ ์ถ๊ฐํ ์์์ ์ญ์ ํ ๋ Swipe๊ฐ๋ฅ์ ์ฌ์ฉํ์์ต๋๋ค.    
    `trailingSwipeActionsConfigurationForRowAt`๋ฉ์๋๋ฅผ ํธ์ถํ์ฌ delete๋ฉ์๋์ ์ ํ๋ indexPath๋ฅผ ์ ๋ฌํ์๊ณ    
    delete๋ฉ์๋์์ ํ๋ผ๋ฏธํฐ๋ก ๋ฐ์ indexPath๋ก remove๋ฉ์๋์ deleteRows๋ฅผ ํธ์ถํ์์ต๋๋ค.   
    `performsFirstActionWithFullSwipe` ๋ฉ์๋๋ก ์ฒซ๋ฒ์งธ swipe Action์ด ์คํ๋์ด ์ ๊ฑฐ๋๊ฒ ํ์์ต๋๋ค.   
    <img src="https://user-images.githubusercontent.com/59474775/128484455-240f6da5-3670-4361-88f6-0f9c5c92332b.gif" height=500 >   
  * ์์ ์ถ๊ฐ์๊ฐ ํ์   
    ์์์ ์ถ๊ฐํ์๋ ์ถ๊ฐํ ์๊ฐ์ cell์ ๋ํ๋ด๊ธฐ ์ํด์ `DateFormatter`๋ฅผ ์ฌ์ฉํ์ต๋๋ค.   
    Alert์์ URl์ ์ถ๊ฐํ ๋ cell์ `textLabel`๋ก ๊ฐ์ ๋๊ฒจ์ค๋๋ค.   
  * ์ฆ๊ฒจ์ฐพ๊ธฐ ์ถ๊ฐ   
    TableViewCell์์ `callBack๋ฉ์๋`๋ฅผ ์์ฑํ๊ณ  TableView์์ ํธ์ถํ์ฌ ์ฆ๊ฒจ์ฐพ๊ธฐ ๋ฒํผ์ ์ํ๋ฅผ ๊ฐ์ง   
    `NotificationCenter`๋ฅผ ์ฌ์ฉํ์ฌ ํด๋น indexPath์ ๋ํ ์์๋ชฉ๋ก๊ฐ์ ์ฆ๊ฒจ์ฐพ๊ธฐ controller์ ์๋ ค์ค๋๋ค.   
    ์ฆ๊ฒจ์ฐพ๊ธฐ ์ถ๊ฐ, ํด์  >   
    <img src="https://user-images.githubusercontent.com/59474775/128484560-5925816a-c699-4c96-8b08-a8955162b6a2.gif" height=500 > 
    <img src="https://user-images.githubusercontent.com/59474775/128484634-db3c8460-ee1b-4f64-9ea0-9e29d831dde5.gif" height=500 >   
  * ๊ฒ์๊ธฐ๋ฅ ์ถ๊ฐ

* ๊ฐ์ ์ฌํญ   
  * ์๋ชป๋ URl์ ์๋ ฅ์ ์์๊ณผ ์ธ๋ค์ผ์ ๋ฐ์์ค์ง ๋ชปํ๋ ๊ฒ์ ํ์ธ ํ์์ต๋๋ค.    
    key๊ฐ์ ๊ตฌํ์ง ๋ชปํ ๊ฒฝ์ฐ ์๋ฆผ์ ๋์ฐ๊ฒ ํ์์ง๋ง ์ด๋ ๊ทผ๋ณธ์ ์ธ ํด๊ฒฐ๋ฐฉ์์ด ์๋๊ฒ ๊ฐ์ต๋๋ค.
  * ~search bar๋ฅผ ํ์ฑํ ํ์๋ ๊ฒ์๊ฒฐ๊ณผ์์ cell์ด ์ ํ๋์ง ์์ ๋์์์ฌ์view๋ก ๋์ด๊ฐ์ง ์๋
    ๋ฌธ์  ํ์ธ~   
    `dimsBackgroundDuringPresentation` ์์ฑ์ false๋ก ์ ์ธํ์ฌ ํด๊ฒฐ
   
* ํฅํ ๊ณํ   
  (ํฅํ ๊ณํ์ ๋ด์ฉ์ค ๊ตฌํํ ๊ธฐ๋ฅ์ ์ญ์ ์ผ๋ก ํ์ํ ๊ตฌํํ ๋ด์ฉ ๋ชฉ๋ก์ผ๋ก ์ด๋ํฉ๋๋ค.)
  * ์์์ ์ถ๊ฐํ ๋ ์์์ ๋ชฉ์ URl์ key๊ฐ์ผ๋ก ์ค์ ๋๊ฒ ํ์์ต๋๋ค. ์๋ณธ ์์์ ์ ๋ชฉ์ผ๋ก ์ค์ ๋๊ฒ ํฉ๋๋ค.
  * ~์์๋ชฉ๋ก์ค ์์ฃผ๋ณด๋ ์์์ ์ฆ๊ฒจ์ฐพ๊ธฐ ํ์๋ฅผ ํ์ฌ ์ฝ๊ฒ ์ฐพ์์ ์๋๋ก ์ฆ๊ฒจ์ฐพ๊ธฐ ๊ธฐ๋ฅ์ ์ถ๊ฐํฉ๋๋ค.~
  * TableView์ Reordering๊ธฐ๋ฅ์ ์ถ๊ฐํฉ๋๋ค.
  * ~์์์ ์๊ฐ ๋ง์์ง๊ฒฝ์ฐ๋ฅผ ๋๋นํ์ฌ ๊ฒ์ ๊ธฐ๋ฅ์ ์ถ๊ฐํฉ๋๋ค.~   
  
## Implementation  
   
### Feature   
* URl๋ก ์์์ผ๋ก ์ถ๊ฐํ๊ณ  ํด๋น ์์์ผ๋ก ์ฌ์ํ๋ ๊ธฐ๋ฅ   

<img src="https://user-images.githubusercontent.com/59474775/128484388-b765a0db-1b04-4dee-9c15-708f59eb455b.gif" height=500 >  <img src="https://user-images.githubusercontent.com/59474775/128151240-640804d4-a346-478a-ad6d-5c513cb9f641.gif" height=500 >   


