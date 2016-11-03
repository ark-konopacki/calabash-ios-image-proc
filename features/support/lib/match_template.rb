
require 'opencv'
include OpenCV

# @param {String} template_file
# @param {String} screen_file
# @return {Integer} x coordinates
# @return {Integer} y coordinates
def find_template_in_image(template_file, screen_file, show = false)
  template_file_name = File.expand_path(File.dirname(__FILE__) + "/images/#{template_file}")
  template = CvMat.load(template_file_name)
  screen_file_name = File.expand_path(File.dirname(__FILE__) + "/images/#{screen_file}")
  match_image = CvMat.load(screen_file_name)
  result = match_image.match_template(template, :sqdiff_normed)

  find = result.normalize.min_max_loc

  # for :sqdiff_normed lower value mean better match
  if find[0] <= 0.00001

    pt1 = result.min_max_loc[2] # minimum location
    pt2 = CvPoint.new(pt1.x + template.width, pt1.y + template.height)

    if show
      pt3 = CvPoint.new(pt1.x, pt2.y)
      pt4 = CvPoint.new(pt2.x, pt1.y)

      match_image.rectangle!(pt1, pt2, :color => CvColor::Red, :thickness => 1)

      match_image.line!(pt1, pt2, :color => CvColor::Red, :thickness => 1)

      match_image.line!(pt3, pt4, :color => CvColor::Red, :thickness => 1)

      window = GUI::Window.new("Display #{template_file} on image") # Create a window for display.
      window.show(match_image) # Show our image inside it.
      sleep 10
      # GUI::wait_key # Wait for a keystroke in the window.
    end


    if match_image.width == 750 || match_image.width == 640
      ratio = 2
    elsif match_image.width == 1242
      ratio = 3
    else
      ratio = 1
    end

      x = (pt1.x + (pt2.x - pt1.x)/ratio)/ratio
      y = (pt1.y + (pt2.y - pt1.y)/ratio)/ratio

      # puts "x is :#{x}"
      # puts "y is :#{y}"
      return x,y
  end

  return nil,nil

end


# @param {String} template_file
# @param {String} screen_file
# @param {Integer} match_level
# @return {Boolean}
def find_template(template_file, screen_file, match_level)
  template_file_name = File.expand_path(File.dirname(__FILE__) + "/images/#{template_file}")
  template = CvMat.load(template_file_name)

  screen_file_name = File.expand_path(File.dirname(__FILE__) + "/images/#{screen_file}")
  match_image = CvMat.load(screen_file_name)
  result = match_image.match_template(template, :sqdiff_normed)

  find = result.normalize.min_max_loc
  if find[0] <= match_level
    true
  end
end

# @param {String} file_name
def save_screen(file_name = nil)
  res = http({:method => :get, :path => 'screenshot'})
  if file_name.nil? || file_name == ''
    current_screen = 'current_screen.png'
  else
    current_screen = file_name
  end
  File.open(File.expand_path(File.dirname(__FILE__) + "/images/#{current_screen}"), 'wb') { |f| f.write res }
end

# @param {Integer} x
# @param {Integer} y
def touch_by_x_y(x,y)
  device_agent.touch_coordinate({:x => x, :y => y})
end

# @param {String} image
def touch_image(template_file)
  save_screen
  x,y = find_template_in_image(template_file, 'current_screen.png')
  if  x != nil
    touch_by_x_y(x,y)
    true
  else
    false
  end
end

def should_see_image(template_file)
  save_screen
  find_template(template_file, 'current_screen.png', 0.00001)
end
