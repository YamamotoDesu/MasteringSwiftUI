
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

