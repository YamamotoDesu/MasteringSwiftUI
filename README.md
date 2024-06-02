https://medium.com/@vladislavshkodich/mastering-swiftui-are-you-really-as-good-as-you-think-40a4953f7e88

## Performance
### Rule number 1: Keep your View body simple!
Avoid doing any complicated work inside your view body. For example, pass in the ForEach not a ready-to-go sequence, with filtering, mapping, etc.

```swift
// Avoid such things ...
var body: some View {
  List {
      ForEach(model.values.filter { $0 > 0 }, id: \.self) {
          Text(String($0))
              .padding()
              .debugBackground()
      }
  }
}
```

The reason this is so important is that the system can actually call your body multiple times in the single layout phase. 
For example some combinations of modifiers and GeometryReader.

### Rule number 2: Preferring no effect modifiers over conditional views.
Example:

```swift
// Avoid if possible ...
var body: some View {
  VStack {
    if isHighlighted {
      CustomView()
        .opacity(0.8)
    } else {
      CustomView()
    }
    // ...
  }
}
```

```swift
// Prefer ...
var body: some View {
  VStack {
      CustomView()
        .opacity(isHighlighted ? 0.8 : 1.0)
    // ...
  }
}
```

### Rule number 3: Split “states” parts into custom view types.

![image](https://github.com/YamamotoDesu/MasteringSwiftUI/assets/47273077/d8bb8d36-789b-4b23-8e22-e14b4ae6915c)

And if you think that the next setup will save you, well sorry for ruining your dreams 😔, not going to help.

![image](https://github.com/YamamotoDesu/MasteringSwiftUI/assets/47273077/61b683ba-3aba-4f58-b1b8-96035dd97371)

The solution here is to move them into their own subviews.

![image](https://github.com/YamamotoDesu/MasteringSwiftUI/assets/47273077/9ac8afa2-ed98-472f-814f-a905056d7c66)

