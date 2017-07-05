class SpiralArray
  def initialize
    p 'Please enter the number of rows required'
    begin
      rows = gets.chomp.to_i
      raise 'Invalid number' if rows <= 0
    rescue
      abort('Please enter a valid number for rows')
    end

    @rows = rows
    @print_no = 0
  end

  def produce
    req_array = Array.new(@rows) { Array.new(@rows) }
    x = y = 0

    # Print first row
    (0..@rows - 1).each do |n|
      req_array[0][n] = n
      @print_no = n
    end
    y = @rows - 1
    x_incr = true

    # Traverse through elements from outside
    i = @rows - 1
    while i > 0
      i.times do
        x = x_incr ? x + 1 : x - 1
        increment_and_set_value(req_array, x, y) if req_array[x][y].nil?
      end

      i.times do
        y = x_incr ? y - 1 : y + 1
        increment_and_set_value(req_array, x, y) if req_array[x][y].nil?
      end
      x_incr = !x_incr
      i -= 1
    end

    req_array.each do |ar|
      ar.each do |ele|
        print "   #{ele.to_s.rjust(3)}"
      end
      puts ''
    end
  end

  def increment_and_set_value(arr, row, col)
    @print_no += 1
    arr[row][col] = @print_no
  end
end

SpiralArray.new.produce
