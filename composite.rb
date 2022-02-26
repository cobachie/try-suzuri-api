require "mini_magick"

# magick original.png -blur 10x5 -threshold 90% -transparent "#FFFFFF" mask.png
MiniMagick::Tool::Magick.new do |magick|
  magick << "original.png"
  magick << "-blur" << "10x5"
  magick << "-threshold" << "90%"
  magick << "-transparent" << "#FFFFFF"
  magick << "mask.png"
end

# magick composite -compose DstIn mask.png original.png -alpha Set out.png
image = MiniMagick::Image.open("original.png")
mask = MiniMagick::Image.open("mask.png")
output = image.composite(mask) do |c|
  c.compose "DstIn"
  c.alpha "Set"
end
output.write "output.png"


