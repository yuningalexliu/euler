triangle_array =  [[75], [95, 64], [17, 47, 82], [18, 35, 87, 10], [20, 4, 82, 47, 65], [19, 1, 23, 75, 3, 34], [88, 2, 77, 73, 7, 63, 67], [99, 65, 4, 28, 6, 16, 70, 92], [41, 41, 26, 56, 83, 40, 80, 70, 33], [41, 48, 72, 33, 47, 32, 37, 16, 94, 29], [53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14], [70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57], [91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48], [63, 66, 4, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31], [4, 62, 98, 27, 23, 9, 70, 98, 73, 93, 38, 53, 60, 4, 23]]

#Triangle has 15 rows

max_value_array = [[75]]

for i in 1..14
    previous_row_array = max_value_array[i-1]
    row_array = triangle_array[i]
    row_length = row_array.length
    row_max_value_array = Array.new
    for j in 0..row_length-1
        if j == 0
            node_max_value = row_array[j] + previous_row_array[j]
        elsif j == row_length-1
            node_max_value = row_array[j] + previous_row_array[j-1]
        else
            left_parent_max_value = row_array[j] + previous_row_array[j-1]
            right_parent_max_value = node_max_value = row_array[j] + previous_row_array[j]
            node_max_value = left_parent_max_value >= right_parent_max_value ? left_parent_max_value : right_parent_max_value
        end
        row_max_value_array << node_max_value
    end
    max_value_array << row_max_value_array
end

puts max_value_array.inspect
