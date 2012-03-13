# Minecraft-Avatars

Work-in-progress code to draw a representation of a Minecraft skin using
JavaScript.

[See here for a demo](http://heh.fi/minecraft-avatars/).

Minecraft-Avatars is licensed under the ISC license, see [COPYING](https://github.com/ion1/minecraft-avatars/blob/master/COPYING).

# Usage

Run `make` to generate a minified version of the script using [UglifyJS](https://github.com/mishoo/UglifyJS/).

Load jQuery before minecraft-avatars.

Given `someElement`, run

```javascript
$(someElement).minecraftAvatar({ player: 'PlayerName' });
```

to render the avatar inside `someElement`. The element will be emptied first.

You can alternatively pass the player name as a data attribute:

```html
<span class="m" data-player="PlayerName">☺</span>
<span class="m" data-player="AnotherPlayer">☺</span>
```

```javascript
$('.m').minecraftAvatar();
```

See the [demo stylesheet](https://github.com/ion1/minecraft-avatars/blob/master/demo/style.css) for hints about how to scale the avatars using CSS.

The following callbacks are available:

```javascript
$(someElement).minecraftAvatar({
    onCreate: function (canvas) { },
    onLoad:   function (canvas) { },
    onError:  function () { }
});
```

`onCreate` is called immediately after the canvas element has been added to the page.

`onLoad` is called after the skin has been loaded and rendered successfully.

`onError` is called upon failure to load the skin.

# TODO

* Figure out a way to detect whether a skin has an alpha channel.
  * Head accessories can’t be composited over the face until the detection can be done. Compositing a supposed accessory from a skin without an alpha channel results in a missing face.
  * We can’t read pixel values from the skin images because of [a JavaScript security feature](https://developer.mozilla.org/en/CORS_Enabled_Image#What_is_a_.22tainted.22_canvas.3F).
* Implement a mode that only displays the face.
* Apparently we can’t tell Chromium to use nearest-neighbor filtering, resulting in blurry scaling. The small, non-scaled avatars still look good. [Bug report](http://code.google.com/p/chromium/issues/detail?id=1502).
