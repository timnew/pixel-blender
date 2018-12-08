# pixel-blender

I saw a magical image from a IM group chat:

![OriginalImage][original]

It looks normal at by default, but when you open it to fullscreen, you got something different:

![Original Image in full screen][original-black]

At beginning, I thought it was probably made with gif, which has 2 frames, and make the 2nd frame loop infinitely.
So in thumbnail you can only see the first frame as the animation is not running, and when you put it stucked into the 2nd frame.

But very soon, I realised that I'm wrong, as actually the animation is running even on thumbnail.

Then I downloaded the image, and I got shocked again, as it actually works in photos app on my iPhone.

After play with it a little bit, I realised how it actually works.

Then I created this repo to reproduce what they made.

## How to use it

It is a ruby script that blends two image together

```
# ./blend -timage1.png -fimage2.png
 Thumbnail Image: image1.png
Fullscreen Image: image2.png
    Output Image: output.png
Loading image1.png....
Loaded: [752 x 1000]
Loading image2.png....
Loaded: [752 x 1000]
Preparing canvas...
Canvase: [752 x 1000]
Blending pixels...
Saving file output.png...
```

## Limitation

The script will turn the image into black & white, as it is to guaranteed the blended image on black and white background.

## How it works

Alpha blending is to paint one opaque color with a certain transparency onto another opaque background color, and calculate the final opaque color.

So `FGColor * Alpha + BGColor = ActualColor`

So you actually can find out the `Alpha` by given `FGColor` `BGColor` and `ActualColor`.

And normally, the IM chat app render the thumbnail with white background but the fullscreen with black background. And if the image is B&W.

Now you can turn your image into one with partially white color, so it renders on black background but is invisible on white background. 

Or you can turn your image into one with partial black color, so it renders on white background but is invisible on black background.

The interleave the 2 images into one by picking the pixel from one or another

[original]: https://github.com/timnew/pixel-blender/raw/master/original.PNG
[original-black]: https://github.com/timnew/pixel-blender/raw/master/original-blackbg.png
