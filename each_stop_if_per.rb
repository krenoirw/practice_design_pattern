module Enumerable
  def each_stop_if_per(per)
   all_size = size
    each_with_index do |i, idx|
      index = idx + 1
      current_per = (index * (100 / all_size))

      if current_per < per
        if size == (index + 1)
          return block_given? ? yield(i, idx) : i
        end

        next
      end

      return block_given? ? yield(i, idx) : i
    end
  end
end