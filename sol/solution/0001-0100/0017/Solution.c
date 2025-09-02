/**
 * Note: The returned array must be malloced, assume caller calls free().
 */
const char* mapping[] = {
	"",     // 0
	"",     // 1
	"abc",  // 2
	"def",  // 3
	"ghi",  // 4
	"jkl",  // 5
	"mno",  // 6
	"pqrs", // 7
	"tuv",  // 8
	"wxyz"  // 9
};
void backtrack(char* digits, int index, char* current, char** result, int* count) {
	if (digits[index] == '\0') {
		result[*count] = strdup(current);
		(*count)++;
		return;
	}
	int digit = digits[index] - '0';
	if (digit < 2 || digit > 9) {
		backtrack(digits, index + 1, current, result, count);
		return;
	}
	const char* letters = mapping[digit];
	for (int i = 0; letters[i] != '\0'; i++) {
		current[index] = letters[i];
		backtrack(digits, index + 1, current, result, count);
	}
}
char** letterCombinations(char* digits, int* returnSize) {
	if (!digits || digits[0] == '\0') {
		*returnSize = 0;
		return NULL;
	}
	int len = strlen(digits);
	int maxSize = 1;
	for (int i = 0; i < len; i++) {
		int digit = digits[i] - '0';
		if (digit < 2 || digit > 9) {
			*returnSize = 0;
			return NULL;
		}
		int lettersCount = strlen(mapping[digit]);
		maxSize *= lettersCount;
	}
	char** result = (char**)malloc(maxSize * sizeof(char*));
	char* current = (char*)malloc((len + 1) * sizeof(char));
	current[len] = '\0';
	int count = 0;
	backtrack(digits, 0, current, result, &count);
	free(current);
	*returnSize = count;
	return result;
}