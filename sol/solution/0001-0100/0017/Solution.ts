function letterCombinations(digits: string): string[] {
    if (!digits) return [];
    const map: { [key: string]: string } = {
        "2": "abc",
        "3": "def",
        "4": "ghi",
        "5": "jkl",
        "6": "mno",
        "7": "pqrs",
        "8": "tuv",
        "9": "wxyz"
    };
    const result: string[] = [];
    const backtrack = (comb: string, nextDigits: string) => {
        if (nextDigits.length === 0) {
            result.push(comb);
            return;
        }
        for (const letter of map[nextDigits[0]]) {
            backtrack(comb + letter, nextDigits.slice(1));
        }
    };
    backtrack("", digits);
    return result;
}