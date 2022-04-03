# AutoLayout-SwiftUI-Like-API

## Code for the extension
Can be found at: https://github.com/avesta-b/AutoLayout-SwiftUI-Like-API/blob/main/AutoLayoutExtensions/Extensions/AutoLayoutViewExtensions.swift

The extensions are meant to match SwiftUI's style where you call a function on a View and mutate it functionally

# Example
Example can be found at: https://github.com/avesta-b/AutoLayout-SwiftUI-Like-API/blob/main/AutoLayoutExtensions/ViewController.swift

The v1 function uses the UIKit APIs, the v2 function uses the new SwiftUI like API

## Examples

1. Make all of the edges of a childView align to the edges of it's parent with an offset of 16.0 (16 points padding from all edges)

        childView.alignToEdges(of: parentView, with: 16.0)

2. Make a childView have a leading offset of 16 to a siblingView

        childView.alignLeading(to: siblingView, withOffset: 16.0)

3. Make a childView have a trailing offset of -16 to a siblingView

        childView.alignTrailing(to: siblingView, withOffset: -16.0)
        
4. Align a childView to the top of it's parentView with an offset of 16

        childView.alignTop(to: parentView, withOffset: 16.0)

6. Align a childView to the bottom of it's parentView with an offset of -16

        childView.alignBottom(to: parentView, withOffset: -16.0)

8. Center a childView in it's parentView

        childView.makeCenter(in: parentView)

9. Horizontally center a childView in it's parentView, with an offset of 12

        childView.horizontallyCenter(in: parentView, withOffset: 12.0)

10. Vertically center a childView in it's parent view with no offset

        childView.verticallyCenter(in: parentView)

11. Center a childView in it's parentView, make it have a width of 200, and make it have a height of 240

        childView
                .makeCenter(in: parentView)
                .makeWidth(equalTo: 200)
                .makeHeight(equalTo: 240)


