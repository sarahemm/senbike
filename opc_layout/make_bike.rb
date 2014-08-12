#!/opt/local/bin/ruby1.9

puts "["

# left strip on main bar
def draw(num_leds, x_start, y_start, z_start, x_diff, y_diff, z_diff)
  scale = 0.005
  
  x_coord = x_start
  y_coord = y_start
  z_coord = z_start
  x_step  = x_diff / num_leds
  y_step  = y_diff / num_leds
  z_step  = z_diff / num_leds
  (1..num_leds).each do |x|
    x_coord += x_step
    y_coord += y_step
    z_coord += z_step
    printf "  {\"point\": [%0.4f, %0.4f, %0.4f]},\n", x_coord * scale, y_coord * scale, z_coord * scale
  end
end

def draw_circle(num_leds, radius, x_offset, y_offset, z)
  scale = 0.005
  
  # go through all angles from 0 to 2 * PI radians
  (0..2*Math::PI).step(2*Math::PI/num_leds).each do |angle|
    # calculate x, y from a vector with known length and angle
    x = radius * Math.cos(angle)
    y = radius * Math.sin(angle)
    printf "  {\"point\": [%0.4f, %0.4f, %0.4f]},\n", (x_offset+x) * scale, (y_offset+y) * scale, z * scale
  end
end

# |--
# |_/
# X <->
# Y  o
# Z ^
# Z v

#    NBR   X     Y   Z     XD      YD ZD
# top bar
draw(40.0, 0,    0,  0,    800.0,  0, -50.0)
draw(40.0, 0,    30, 0,    800.0,  0, -50.0)
# bottom bar
draw(40.0, -30,  0,  -50,  750.0,  0, -400.0)
draw(40.0, -30,  30, -50,  750.0,  0, -400.0)
# back bar
draw(20.0, 800,  0,  -50,  -100.0, 0, -400.0)
draw(20.0, 800,  30, -50,  -100.0, 0, -400.0)
# front tube
draw(10.0, 0,    0,  0,    -30.0,  0, -100.0)
draw(10.0, 0,    30, 0,    -30.0,  0, -100.0)
# fork
draw(10.0, -30,  50, -100, -30.0,  0, -100.0)
draw(10.0, -30,  -20, -100, -30.0,  0, -100.0)

# solar panel cover
solar_center_x = 1000
solar_center_y = 15
# inner circle
draw_circle(16, 38.1/2, solar_center_x, solar_center_y, 0)
# draw 7 circles between the inner/outer circles
(0..2*Math::PI).step(2*Math::PI/7).each do |angle|
  # calculate x, y from a vector with known length and angle
  x = 50 * Math.cos(angle)
  y = 50 * Math.sin(angle)
  draw_circle(16, 38.1/2, solar_center_x + x, solar_center_y + y, 0)
end
# outer circle
draw_circle(60, 75,     solar_center_x, solar_center_y, 0)

puts "]"
