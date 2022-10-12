# SwiftUI-Basic

## 🍎 Resume shortcut
- option + command + p

## 🍎 @main -> main point of entry!
- 처음 SwiftUI 프로젝트를 생성하고 코드를 보았을때 어디서 많이 보았던 코드 발견.
```swift
import SwiftUI

@main
struct SwiftUI_BasicApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```
- [AppDelegate와 UserDefaults를 사용한 데이터 저장 및 전달 방법 정리](https://github.com/KayAhn0126/iOS-Study/tree/main/UI/HowToStoreData)를 공부할 때, AppDelegate.swift내 AppDelegate 클래스에서 보았던 @main 키워드.
- 즉, 여기가 **Main point of Entry!**

## 🍎 modifier를 사용할 때는 타입에 맞게 순서를 조합해서 사용해야 한다.
![](https://i.imgur.com/mFXgf06.png)
- renderingMode, resizable, aspectRatio는 modifier.
- return type을 보며 순서를 지키자.
- 현재는 아무 문제가 없다. 왜냐하면
    - 먼저 Image(systemName: "sun.max.fill")로 image 생성.
    - renderingMode()를 거쳐 Image 타입 반환
    - 반환 받은 Image 타입을 resizable() modifier를 이용해 modify 후 Image 타입 반환
    - 반환 받은 Image 타입을 aspectRatio() modifier를 이용해 modify 후 View 타입 반환.
    - 즉, Image -> Image -> some View로 문제 될 것이 없다.
    - renderingMode(), resizable()은 **Image 관련 modifier**.
    - **Image 관련 modifier 먼저 적용 후 다른것 적용!**
- 그래도 이해가 안되면 코드를 한줄 한줄 보자!
```swift
import SwiftUI

struct ImageView: View {
    var body: some View {
        Image(systemName: "sun.max.fill") // image
            .renderingMode(.original)     // image에 Image modifier 사용 -> Image 타입 반환
            .resizable()                  // 위에서 반환된 image에 Image modifier 사용 -> Image 타입 반환
            .aspectRatio(contentMode: .fit) // 위에서 반환된 image에 View modifier를 사용 -> View 타입 반환
    }
}
```
- 하지만 modifier의 순서를 아래와 같이 바꾸면 에러가 발생한다!

![](https://i.imgur.com/iVe1F98.png)
- 왜 에러가 발생할까?
    - 먼저 Image(systemName: "sun.max.fill")로 image 생성.
    - aspectRatio modifier를 거치고 나서 반환된 값은 View이다.
    - View 타입에는 .renderingMode() modifier가 없다.
    - 즉, "sun.max.fill"로 image 생성 -> 반환 받은 image를 aspectRatio()를 통해 modify 후 View 반환 (여기까지는 가능) -> View 타입은 renderingMode() modifier가 없으므로 에러 발생.
