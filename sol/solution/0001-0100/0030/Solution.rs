use std::collections::HashMap;
impl Solution {
    pub fn find_substring(s: String, words: Vec<String>) -> Vec<i32> {
        let word_len = words[0].len();
        let num_words = words.len();
        let words = words.into_iter().fold(HashMap::new(), |mut map, word| {
            *map.entry(word.into_bytes()).or_insert(0) += 1;
            map
        });
        let s = s.into_bytes();
        let s_len = s.len();
        let mut result: Vec<i32> = Vec::new();
        for i in 0..word_len {
            let mut left = i;
            let mut counts: HashMap<&[u8], usize> = HashMap::new();
            let mut j = i;
            while j + word_len <= s_len {
                let word = &s[j..j+word_len];
                if !words.contains_key(word) {
                    counts.clear();
                    left = j + word_len;
                    j += word_len;
                    continue;
                }
                *counts.entry(word).or_insert(0) += 1;
                while counts[word] > words[word] {
                    let left_word = &s[left..left+word_len];
                    counts.entry(left_word).and_modify(|count| *count -= 1);
                    left += word_len;
                }
                if j - left == (num_words - 1) * word_len {
                    result.push(left as i32);
                    let left_word = &s[left..left+word_len];
                    left += word_len;
                    counts.entry(left_word).and_modify(|count| *count -= 1);
                }
                j += word_len;
            }
        }
        result
    }
}