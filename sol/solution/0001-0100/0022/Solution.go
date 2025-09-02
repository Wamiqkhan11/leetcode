func generateParenthesis(n int) []string {
	var res []string
	var backtrack func(s string, left, right int)
	backtrack = func(s string, left, right int) {
		if len(s) == 2*n {
			res = append(res, s)
			return
		}
		if left < n {
			backtrack(s+"(", left+1, right)
		}
		if right < left {
			backtrack(s+")", left, right+1)
		}
	}
	backtrack("", 0, 0)
	return res
}