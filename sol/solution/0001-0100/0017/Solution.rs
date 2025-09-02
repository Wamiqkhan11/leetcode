impl Solution {
    pub fn letter_combinations(digits: String) -> Vec<String> {
        if digits.is_empty() {
            return Vec::new();
        }
        let map = vec![
            "",    // 0
            "",    // 1
            "abc", // 2
            "def", // 3
            "ghi", // 4
            "jkl", // 5
            "mno", // 6
            "pqrs",// 7
            "tuv", // 8
            "wxyz" // 9
        ];
        let mut res = vec![String::new()];
        for d in digits.chars() {
            let idx = d.to_digit(10).unwrap() as usize;
            let letters = map[idx];
            let mut tmp = Vec::new();
            for prefix in &res {
                for ch in letters.chars() {
                    let mut new_str = prefix.clone();
                    new_str.push(ch);
                    tmp.push(new_str);
                }
            }
            res = tmp;
        }
        res
    }
}