# CollectionViewer

The package wraps the UICollectionView, providing a convenient interaction with SwiftUI.   

## Key features:   
- Reactive connection with incoming data. You don't have to worry about updating the cells, just change the incoming array.
- Automatic calculation of the size of displayed views.
- Data buffering - to improve performance
- Ability to update content with a native gesture

Designed to display static content (lists, tiles, etc.) that will not change size after display.   

## Package Goals
- The need for an analogue of the LazyVGrid with better performance and correct memory release on iOS 15 and below.
- Update gesture support on iOS 14

## Warning
<b>The package is in beta stage. It may and most likely contains errors. Use with caution.</b>

## Examples of using

### Fully automatic use

```swift
struct ExampleView: View {
    @State var data: [Int] = (0...5000).map{$0}
    
    var body: some View {
        CollectionView(self.data) { index, element in
            VStack{
                Text("Index: \(index)")
                Text("Element: \(element)")
            }
            .background(Color.red)
        }
    }
}
``` 

<img src="https://github.com/cbepxbeo/resorces/blob/21c9cd212a6c7db2f353b3067e819091c654cd39/resources/collection-viewer/media/using_preview_1.jpg" alt="CollectionViewer (Using)">   

### Define columns

```swift
struct ExampleView: View {
    @State var data: [Int] = (0...5000).map{$0}
    
    var body: some View {
        CollectionView(self.data) { index, element in
            VStack{
                Text("Index: \(index)")
                Text("Element: \(element)")
            }
            .background(Color.red)
        }
        .gridColumns(1)
    }
}
``` 
<img src="https://github.com/cbepxbeo/resorces/blob/21c9cd212a6c7db2f353b3067e819091c654cd39/resources/collection-viewer/media/using_preview_2.jpg" alt="CollectionViewer (Using)">   


```swift
struct ExampleView: View {
    @State var data: [Int] = (0...5000).map{$0}
    
    var body: some View {
        CollectionView(self.data) { index, element in
            VStack{
                Text("Index: \(index)")
                Text("Element: \(element)")
            }
            .background(Color.red)
        }
        .gridColumns(2)
    }
}
``` 
<img src="https://github.com/cbepxbeo/resorces/blob/21c9cd212a6c7db2f353b3067e819091c654cd39/resources/collection-viewer/media/using_preview_3.jpg" alt="CollectionViewer (Using)">   

### Fill empty space with a modifier

```swift
struct ExampleView: View {
    @State var data: [Int] = (0...5000).map{$0}
    
    var body: some View {
        CollectionView(self.data) { index, element in
            VStack{
                Text("Index: \(index)")
                Text("Element: \(element)")
            }
            .fillSpace(.horizontal)
            .background(Color.red)
        }
        .gridColumns(1)
    }
}
``` 
<img src="https://github.com/cbepxbeo/resorces/blob/21c9cd212a6c7db2f353b3067e819091c654cd39/resources/collection-viewer/media/using_preview_4.jpg" alt="CollectionViewer (Using)">   

```swift
struct ExampleView: View {
    @State var data: [Int] = (0...5000).map{$0}
    
    var body: some View {
        CollectionView(self.data) { index, element in
            VStack{
                Text("Index: \(index)")
                Text("Element: \(element)")
            }
            .fillSpace(.horizontal)
            .background(Color.red)
        }
        .gridColumns(2)
    }
}
``` 
<img src="https://github.com/cbepxbeo/resorces/blob/21c9cd212a6c7db2f353b3067e819091c654cd39/resources/collection-viewer/media/using_preview_5.jpg" alt="CollectionViewer (Using)">   


### Manage sizes

```swift
struct ExampleView: View {
    @State var data: [Int] = (0...5000).map{$0}
    
    var body: some View {
        CollectionView(self.data) { index, element in
            VStack{
                Text("Index: \(index)")
                Text("Element: \(element)")
            }
            .fillSpace(.horizontal)
            .background(Color.red)
        }
        .itemSize(.init(width: 70, height: 70))
    }
}
``` 
<img src="https://github.com/cbepxbeo/resorces/blob/21c9cd212a6c7db2f353b3067e819091c654cd39/resources/collection-viewer/media/using_preview_6.jpg" alt="CollectionViewer (Using)">   

### Update your incoming data

```swift
struct ExampleView: View {
    @State var data: [Int] = (0...10).map{$0}
    var body: some View {
        CollectionView(self.data) { index, element in
            VStack{
                Text("Index: \(index)")
                Text("Element: \(element)")
            }
            .fillSpace(.horizontal)
            .background(Color.red)
            .onAppear{
                if index == 5 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                        data.append(
                            contentsOf: (11...20).map{$0}
                        )
                    }
                }
            }
        }
        .itemSize(.init(width: 70, height: 70))
    }
}
``` 


<img src="https://github.com/cbepxbeo/resorces/blob/21c9cd212a6c7db2f353b3067e819091c654cd39/resources/collection-viewer/media/using_preview_video_1.gif" alt="CollectionViewer (Using)">  


### Don't worry about the height

```swift
struct ExampleView: View {
    @State var data: [Int] = (0...10).map{$0}
    var body: some View {
        CollectionView(self.data) { index, element in
            
            let height: CGFloat? = {
                if index % 2 == 0 {
                    return 150
                } else if index % 3 == 0 {
                    return 200
                } else {
                    return nil
                }
            }()
            
            VStack{
                Text("Index: \(index)")
                Text("Element: \(element)")
            }
            .fillSpace(.horizontal)
            .frame(height: height)
            .background(Color.red)
            
        }
        .gridColumns(1)
    }
}
``` 
<img src="https://github.com/cbepxbeo/resorces/blob/21c9cd212a6c7db2f353b3067e819091c654cd39/resources/collection-viewer/media/using_preview_7.jpg" alt="CollectionViewer (Using)">  


```swift
struct ExampleView: View {
    @State var data: [Int] = (0...10).map{$0}
    var body: some View {
        CollectionView(self.data) { index, element in
            
            let padding: CGFloat = {
                if index % 2 == 0 {
                    return 20
                } else if index % 3 == 0 {
                    return 40
                } else {
                    return 60
                }
            }()
            
            VStack{
                Text("Index: \(index)")
                    .padding(.bottom, padding)
                Text("Element: \(element)")
            }
            .fillSpace(.horizontal)
            .padding(.vertical, 5)
            .background(Color.red)
            
        }
        .gridColumns(1)
    }
}
``` 
<img src="https://github.com/cbepxbeo/resorces/blob/21c9cd212a6c7db2f353b3067e819091c654cd39/resources/collection-viewer/media/using_preview_8.jpg" alt="CollectionViewer (Using)">  


### Update your data

```swift
struct ExampleView: View {
    @State var data: [Int] = (0...10).map{$0}
    var body: some View {
        CollectionView(self.data) { index, element in
            VStack{
                Text("Index: \(index)")
                Text("Element: \(element)")
            }
            .fillSpace(.horizontal)
            .background(Color.red)
            
        }
        .gridColumns(1)
        .refreshAction { completed in
            self.data = []
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                self.data = (20...33).map{$0}
                completed()
            }
        }
        .ignoresSafeArea()
    }
}
``` 


<img src="https://github.com/cbepxbeo/resorces/blob/21c9cd212a6c7db2f353b3067e819091c654cd39/resources/collection-viewer/media/using_preview_video_2.gif" alt="CollectionViewer (Using)">

## Features of use

To achieve better performance, the package does not use constraints and the size is calculated based on the contents of the view. The data passes through the buffer and after calculations, the dimensions are saved for later reuse. Disable size caching if your content may change size after updating (then you can turn it back on)

<img src="https://github.com/cbepxbeo/resorces/blob/21c9cd212a6c7db2f353b3067e819091c654cd39/resources/collection-viewer/media/using_preview_video_3.gif" alt="CollectionViewer (Using)"> 

In addition to sizes, representations are also not recalculated and are saved for further reuse. Do not update the data source at once, otherwise you will end up with old views. Use asynchronous operations for updates.

<img src="https://github.com/cbepxbeo/resorces/blob/21c9cd212a6c7db2f353b3067e819091c654cd39/resources/collection-viewer/media/using_preview_video_4.gif" alt="CollectionViewer (Using)"> 

