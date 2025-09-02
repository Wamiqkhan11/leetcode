# @param {String} s
# @param {String[]} words
# @return {Integer[]}
def find_substring(s, words)
  return [] if words.empty?
  word_len = words[0].length
  word_count = Hash.new(0)
  words.each { |w| word_count[w] += 1 }
  res = []
  (0...word_len).each do |i|
    left, count = i, 0
    seen = Hash.new(0)
    j = i
    while j + word_len <= s.length
      word = s[j, word_len]
      if word_count.key?(word)
        seen[word] += 1
        count += 1
        while seen[word] > word_count[word]
          left_word = s[left, word_len]
          seen[left_word] -= 1
          left += word_len
          count -= 1
        end
        res << left if count == words.size
      else
        seen.clear
        count = 0
        left = j + word_len
      end
      j += word_len
    end
  end
  res
end