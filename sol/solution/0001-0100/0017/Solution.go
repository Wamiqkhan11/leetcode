func letterCombinations(digits string) []string {
	if len(digits) == 0 {
		return []string{}
	}
	mapping := map[byte]string{
		'2': "abc",
		'3': "def",
		'4': "ghi",
		'5': "jkl",
		'6': "mno",
		'7': "pqrs",
		'8': "tuv",
		'9': "wxyz",
	}
	var res []string
	var backtrack func(index int, path string)
	backtrack = func(index int, path string) {
		if index == len(digits) {
			res = append(res, path)
			return
		}
		letters := mapping[digits[index]]
		for i := 0; i < len(letters); i++ {
			backtrack(index+1, path+string(letters[i]))
		}
	}
	backtrack(0, "")
	return res
}