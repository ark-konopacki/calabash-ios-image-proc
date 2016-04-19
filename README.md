# calabash-ios-image-proc

Image processing (template matching) which can be used in calabash tests 

# Installation (OSX only)

If you don't have **brew** tool it can be installed with: 
`$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

After brew installed we can install **Open_CV**:
`$ brew tap homebrew/science`<br />
`$ brew info opencv`<br />
`$ brew install opencv`<br />
Default  installation  folder of **OpenCV** is: /usr/local/Cellar/opencv/**_installed_version_**/

And since we don't have plans to use python we can ignore warning about it

Ruby library for **OpenCV** can be installed with:
`$ gem install ruby-opencv -- --with-opencv-dir=<path_to_opencvdir>` (from previous step)<br />
Like if you have:
`==> Summary
 /usr/local/Cellar/opencv/2.4.12_2: 261 files, 35.6M
 `
 command will be:
 `$ gem install ruby-opencv -- --with-opencv-dir="/usr/local/Cellar/opencv/2.4.12_2"`
 
(Optional)For Ruby I suggest to use **rbenv**. For installation follow steps described under:
https://github.com/rbenv/rbenv#homebrew-on-mac-os-x

# Screenshot and template
  At least *.tiff and *.png are supported. 
  Please be careful with taking screenshot (best option is take it with calabash screenshot method).
  For example: from Xcode for iPhone 6s screenshot resolution is 562 × 1000 but on calabash it is 750 × 1334
  as a result **template taken from Xcode screenshot cannot be find in calabash**   