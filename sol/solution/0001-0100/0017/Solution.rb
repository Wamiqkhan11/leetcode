# @param {String} digits
# @return {String[]}
def letter_combinations(digits)
	return [] if digits.empty?
	phone = {
		'2' => %w[a b c],
		'3' => %w[d e f],
		'4' => %w[g h i],
		'5' => %w[j k l],
		'6' => %w[m n o],
		'7' => %w[p q r s],
		'8' => %w[t u v],
		'9' => %w[w x y z]
	}
	result = ['']
	digits.each_char do |digit|
		result = result.flat_map { |prefix| phone[digit].map { |char| prefix + char } }
	end
	result
end