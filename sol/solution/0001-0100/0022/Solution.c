/**
 * Note: The returned array must be malloced, assume caller calls free().
 */
void backtrack(char **result, char *current, int open, int close, int n, int *count) {
	if (open == n && close == n) {
		current[open + close] = '\0';
		result[*count] = (char *)malloc((2 * n + 1) * sizeof(char));
		strcpy(result[*count], current);
		(*count)++;
		return;
	}
	if (open < n) {
		current[open + close] = '(';
		backtrack(result, current, open + 1, close, n, count);
	}
	if (close < open) {
		current[open + close] = ')';
		backtrack(result, current, open, close + 1, n, count);
	}
}
char** generateParenthesis(int n, int* returnSize) {
	int maxSize = 1;
	for (int i = 0; i < n; ++i) {
		maxSize = maxSize * 2 * (2 * i + 1) / (i + 2);
	}
	char **result = (char **)malloc(maxSize * sizeof(char *));
	char *current = (char *)malloc((2 * n + 1) * sizeof(char));
	current[2 * n] = '\0';
	int count = 0;
	backtrack(result, current, 0, 0, n, &count);
	free(current);
	*returnSize = count;
	return result;
}