require 'test/unit'

class Image
  attr_accessor :data

  def initialize(image)
    @data = image
  end

  def output_image
    #read each |array| in @image which is an array
    @data.each do |array|
      puts array.join("")
    end
  end
 # out of bounds error
 # cannot access places where array doesn't exist.
  def transform(number)
    n = number.to_s.to_i

    n.times do
      b = Marshal.load( Marshal.dump(@data) ) # Create a copy of the array so it doesn't get changed below
      @data.each_with_index do |row, y|
        row.each_with_index do |num, x|
          if b[y][x] == 1 # if a 1 is found in the index, begin looping through it.

            if y != @data.length-1 # If this is true, we are at the end of the y axis.
              @data[y + 1][x] = 1  # go down and make it one
            end

            if y != 0 # If this is true, we are at the beginning of the array
              @data[y - 1][x] = 1 # go up and make it one
            end

            if x != @data[y].length-1 # If this is true, we are at least element in x axis.
              @data[y][x + 1] = 1 # go right and change it to one
            end

            if x != 0  # If this is true, we are at the beginning of the x axis.
              @data[y][x - 1] = 1 # go left and make it one
            end

          end
        end
      end
    end


  end
end

class TestImage < Test::Unit::TestCase
  def test_image_transform
    image = Image.new([
                          [0,0,0,0],
                          [0,0,0,0],
                          [0,0,0,0],
                          [0,1,0,0],
                          [0,0,0,0],
                          [0,0,0,0]

                      ])
    assert image.transform(2)
    expected = [
        [0,0,0,0],
        [0,1,0,0],
        [1,1,1,0],
        [1,1,1,1],
        [1,1,1,0],
        [0,1,0,0] ]
    assert_equal expected, image.data
  end
end