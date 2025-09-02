# @param {String} haystack
# @param {String} needle
# @return {Integer}
def str_str(haystack, needle)
  n, m = haystack.length, needle.length
  return 0 if m == 0
  lps = Array.new(m, 0)
  len = 0; i = 1
  while i < m
    if needle[i] == needle[len]
      len += 1
      lps[i] = len
      i += 1
    elsif len > 0
      len = lps[len - 1]
    else
      lps[i] = 0
      i += 1
    end
  end
  i = j = 0
  while i < n
    if haystack[i] == needle[j]
      i += 1; j += 1
      return i - m if j == m
    elsif j > 0
      j = lps[j - 1]
    else
      i += 1
    end
  end
  -1
end