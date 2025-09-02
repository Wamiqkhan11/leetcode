function generateParenthesis(n: number): string[] {
    const res: string[] = [];
    if (n === 0) return res;
    function generate(openN: number, closeN: number, path: string) {
        if (path.length === n * 2) {
            res.push(path);
            return;
        }
        if (openN < n) {
            generate(openN + 1, closeN, path + "(");
        }
        if (closeN < openN) {
            generate(openN, closeN + 1, path + ")");
        }
    }
    generate(0, 0, "");
    return res;
};