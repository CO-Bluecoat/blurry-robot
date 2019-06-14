class Image
  attr_accessor :data
  def initialize(arr)
    @data = arr
  end
  
  def output_image

    @data.each do |el|
      el.each do |inner_el|
        print inner_el
      end
      print "\n"
    end
    
  end
end

test_arr = [
    [0, 0, 1, 0],
    [0, 0, 0, 0],
    [0, 1, 0, 1]
]
image = Image.new(test_arr)
image.output_image