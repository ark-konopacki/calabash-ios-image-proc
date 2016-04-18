# calabash-ios-image-proc

Image processing (template matching) which can be used in calabash tests 

# Installation (OSX only)

If you don't have **brew** tool it can be installed with: 
`$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

After brew installed we can install **Open_CV**:
`$ brew tap homebrew/science`
`$ brew info opencv`
`$ brew install opencv`
Default  installation  folder of **OpenCV** is: /usr/local/Cellar/opencv/**_installed_version_**/

Ruby library for **OpenCV** can be installed with:
`$ gem install ruby-opencv -- --with-opencv-dir=<path_to_opencvdir>` (from previous step)
 
(Optional)For Ruby I suggest to use **rbenv**. For installation follow steps described under:
https://github.com/rbenv/rbenv#homebrew-on-mac-os-x