# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
    return 0 if nums.empty?
    write = 1
    (1...nums.length).each do |i|
        if nums[i] != nums[write - 1]
            nums[write] = nums[i]
            write += 1
        end
    end
    write
end