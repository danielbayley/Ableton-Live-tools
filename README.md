![](banner.png?raw=true)

#Live Tools
Live tools is a collection of useful additions to the excellent [Ableton Live](http://www.ableton.com/en/live) [DAW](http://en.wikipedia.org/wiki/Digital_audio_workstation). Currently, it improves integration of Live with other tools, but useful devices, racks and templates will be added in future for various audio tasks. [Contributions](#Contributing) are welcome.

---

##Mac OS X [Services](http://macosxautomation.com/services)
Live Tools includes a few handy services for Live users wise enough to be running OS X.

They are easy to use, simply open a `.workflow` file and choose the option to install. This just moves that workflow to your `~/Library/Services` folder which makes it available from the `Services` menu, in this case from within Live.

![](services.png?raw=true)

Each of these services is just a wrapper for an internal `.sh`ell script  which can be accessed by choosing `Show Package Contents` from the contextual menu in Finder, so they can be easily modified.

###Git integration
`Save Live Set as XML.workflow` will automatically uncompress `.als` files in the current project so that they play nice with Git, since a Live set is actually [just gzipped XML](http://crooked-hideout.blogspot.co.uk/2012/01/ableton-live-set-is-gzipped-xml-ruby.html).

If you specify `⌘S` as the keyboard shortcut under `App Shortcuts` rather than `Services` this will actually override the native `Save Live Set` command so that now Live will in effect always save uncompressed `.als` files. Live has no problem opening these, so no need to worry about having to re-compress anything.

Open System Preferences and under `Keyboard` then `Shortcuts`, add (`+`) a new shortcut and choose Live as the application. Enter `Save Live Set as XML` for the menu title (or whatever you want, providing this exactly matches the name of the `.workflow` file, should you decide to alter it).

#<div align="center">
![](shortcuts.png?raw=true)
</div>

###Commit
`Commit Live Project.workflow` will first ensure any `.als` files are uncompressed as above, but then also either open the current project in [GitHub for Mac](http://mac.github.com) or [Tower](http://www.git-tower.com) depending on which is installed, or otherwise prompt for a commit summary.

###Export ALAC (`.m4a`) audio
`Export ALAC audio.workflow` essentially adds the option of exporting [Apple Lossless Audio Codec](http://en.wikipedia.org/wiki/Apple_Lossless) files straight from Live. These have the advantage of lossless compression and metadata support including artwork.

It works by automatically converting the latest `.wav` or `.aif` output from Live (providing you save to the current project folder). It will also rename any accompanying `.*.asd` [analysis file](https://www.ableton.com/en/manual/managing-files-and-sets/#analysis-files-asd) to `.m4a.asd` as appropriate.

---

##[Makefile](http://www.gnu.org/software/make/manual/make.html#Introduction)
There's also a simple `makefile` included if you're into those.
`make watch` will watch for changes in the project folder and automatically emulate the above workflows.

---

#Collaboration
In the spirit of collaboration, which hopefully this project will aid, there are a few nice online tools for sharing Live sets which are appropriately listed here.

- [Blend](http://blend.io)
- [Splice](http://splice.com)

---

##Alternate Live icon
![](icon.png?raw=true)

Also thrown in is an alternative icon for Live, if you prefer. This can be applied by choosing `Get Info` from the contextual menu in Finder with `Live.app` selected, and dragging the `Live.icns` file over the existing icon in the top left corner. [LiteIcon](http://www.freemacsoft.net/liteicon) is free and recommended for managing icons on OS X, if you find yourself doing this kind of thing often.
