# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return nil if self.empty?
        if self.length >= 1
            return self.max - self.min
        end
    end

    def average
        return nil if self.empty?
        avg = self.sum / self.length.to_f
        avg
    end

    def median
        return nil if self.empty?
        sorted = self.sort
        len = sorted.length
        ( sorted[(len - 1) / 2 ] + sorted[len/2] ) / 2.0
    end

    def counts
        hash = Hash.new(0)
        self.each { |ele| hash[ele] += 1 }
        hash
    end

    def my_count(value)
        count = 0
        self.each do |ele|
            if ele == value
                count += 1
            end
        end
        count
    end

    def my_index(value)
        self.each_with_index do |ele, i|
            if ele == value
                return i
            end
        end
        nil
    end

    def my_uniq
        new_arr = []
        self.each do |ele|
            if !new_arr.include?(ele)
                new_arr << ele
            end
        end
        new_arr
    end

    def my_transpose
        arr = self.first
        hight = self.length
        width = arr.length

        new_arr = Array.new(width) { Array.new(hight) }

        self.each_with_index do |arr, w|
            arr.each_with_index do |el, h|
                new_arr[h][w] = el 
            end
        end
        new_arr
    end
end
