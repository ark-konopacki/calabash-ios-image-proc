# calabash-ios-image-proc

Image processing (template matching) which can be used in calabash tests 

# Installation

For installing additional software brew tool is required 
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

After brew installed we can install open_cv:  
$ brew tap homebrew/science
$ brew info opencv
$ brew install opencv
Default  installation  folder of OpenCV is: /usr/local/Cellar/opencv/<version>/

(Optional)For ruby I suggest to use rbenv. For installation follow steps described under:
https://github.com/rbenv/rbenv#homebrew-on-mac-os-x

Ruby library for OpenCV can be installed with:
$ gem install ruby-opencv -- --with-opencv-dir=<path_to_opencvdir> (from previous step)
 
