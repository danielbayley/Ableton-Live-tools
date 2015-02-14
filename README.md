![](https://cloud.githubusercontent.com/assets/7797479/6123630/be64a0da-b0fc-11e4-82e0-bca7d8893587.png)

#Live Tools
Live tools is a collection of useful additions to the excellent [Ableton Live](http://www.ableton.com/en/live) [DAW](http://en.wikipedia.org/wiki/Digital_audio_workstation). Currently, it improves integration of Live with other tools, but useful devices, racks and templates will be added in future for various audio tasks. [Contributions](#Contributing) are welcome.

##Instant Setup
If you just want to get started immediately on a project with version control, you can just run (open) the `SETUP.command` to clean up and use this repository as the basis for a project. Easy.

---

##Mac OS X [Services](http://macosxautomation.com/services)
Live Tools includes a few handy services for Live users wise enough to be running OS X.

They are easy to use, simply open a `.workflow` file and choose the option to install. This just moves that workflow to your `~/Library/Services` folder which makes it available from the `Services` menu, in this case from within Live.

![](https://cloud.githubusercontent.com/assets/7797479/6123647/00608c06-b0fd-11e4-8273-1e8b272069de.png)

Note that due to security measures on OS X, permission must first be granted to Applications before they can be manipulated from scripts and services.

Open System Preferences and navigate to `Accessibility` under `Security & Privacy`. Click on the padlock icon and enter your admin password to access the list. Make sure Live is listed and enabled (you can just drag in `Live.app` from Finder if it isn't on the list). You might also want to grant access to System Events and Automator here. This only needs to be done once.

#<div align="center">
![](https://cloud.githubusercontent.com/assets/7797479/6142880/28871e60-b1b7-11e4-917a-eb7c19f2d7c3.png)
</div>

###Git integration
`Save Live Set as XML.workflow` will automatically uncompress `.als` files in the current project so that they play nice with Git, since a Live set is actually [just gzipped XML](http://crooked-hideout.blogspot.co.uk/2012/01/ableton-live-set-is-gzipped-xml-ruby.html).

If you specify `⌘S` as the keyboard shortcut under `App Shortcuts` rather than `Services` this will actually override the native `Save Live Set` command so that now Live will in effect always save uncompressed `.als` files. Live has no problem opening these, so no need to worry about having to re-compress anything.

Return to System Preferences and under `Keyboard` then `Shortcuts`, add (`+`) a new shortcut and choose Live as the application. Enter `Save Live Set as XML` for the menu title (or whatever you want, providing this exactly matches the name of the `.workflow` file, should you decide to alter it).

#<div align="center">
![](https://cloud.githubusercontent.com/assets/7797479/6123649/03ff3c4a-b0fd-11e4-8153-a72e5b8e65aa.png)
</div>

###Pre-commit [hook](http://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks)
While the above service works by uncompressing sets every time you save from Live, an even better method is to implement this as a `pre-commit` [Git Hook](http://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks).

If you use this repository as the basis for a project as mentioned above, then all you have to do is run (open) the `SETUP.command`. This just adds the `pre-commit` hook and will clean out the repository ready for your Live project.

Alternatively, you could setup a [Git template](http://git-scm.com/docs/git-init) including the hook which would apply it to any future repository using `git init`. Doing this on an existing repo will also work, and without overwriting anything.

```bash
cd ~/path/to/project
mkdir -p ~/path/to/template/hooks &&
cp pre-commit ~/path/to/template/hooks
git config --global init.templatedir ~/path/to/template
```

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
![](https://cloud.githubusercontent.com/assets/7797479/6123652/12002f48-b0fd-11e4-908c-804b7f02d2b4.png)

Also thrown in is an alternative icon for Live, if you prefer. This can be applied by choosing `Get Info` from the contextual menu in Finder with `Live.app` selected, and dragging the `Live.icns` file over the existing icon in the top left corner. [LiteIcon](http://www.freemacsoft.net/liteicon) is free and recommended for managing icons on OS X, if you find yourself doing this kind of thing often.
