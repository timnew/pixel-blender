require 'oily_png'

module ChunkyPNG
  module BlenderOpations
    def blend!(image1, image2)
      each_pixel do |x, y|
        if (x + y).odd?
          Color.decompose_color(quick_grascale(image1[x, y]), Color::BLACK, Color::WHITE)
        else
          Color.decompose_color(quick_grascale(image2[x, y]), Color::WHITE, Color::BLACK)
        end
      end
    end

    private

    def quick_grascale(pixel)
      if Color.grayscale?(pixel)
        pixel
      else
        Color.to_grayscale(pixel)
      end
    end

    def each_pixel
      (0...height).each do |y|
        (0...width).each do |x|
          new_pixel = yield(x, y, self[x,y])
          self[x,y] = new_pixel unless new_pixel.nil?
        end
      end
    end
  end

  class Canvas
    include BlenderOpations
  end

  class Dimension
    def to_s
      "[#{width} x #{height}]"
    end
  end
end
