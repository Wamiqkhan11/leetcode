/**
 * Note: The returned array must be malloced, assume caller calls free().
 */
int* findSubstring(char* s, char** words, int wordsSize, int* returnSize) {
    int nwords = 0, trieLen = 1, wordLen = strlen(words[0]), sLen = strlen(s);
    int counts[wordsSize + 1], countMap[wordLen * wordsSize + 1], trie[wordLen * wordsSize][26];
    memset(counts, 0, sizeof counts);
    memset(countMap, 0, sizeof countMap);
    memset(trie, 0, sizeof trie);
    for (int i = 0; i < wordsSize; i++) {
        int node = 0;
        for (int j = 0; j < wordLen; j++) {
            char next = words[i][j] - 'a';
            if (trie[node][next] == 0) trie[node][next] = trieLen++;
            node = trie[node][next];
        }
        if (countMap[node] == 0) countMap[node] = ++nwords;
        counts[countMap[node]]++;
    }
    int* res = (int*) malloc(sLen * sizeof(int));
    int resLen = 0;
    int matches[sLen / wordLen + 1], windowCounts[nwords + 1];
    for (int i = 0; i < wordLen; i++) {
        if (i + wordLen * wordsSize > sLen) continue;
        memset(windowCounts, 0, sizeof windowCounts);
        int hits = 0, misses = 0;
        for (int j = i, k = 0, l = 0; j + wordLen <= sLen; j += wordLen, k++) {
            int node = 0;
            for (int m = j; m < j + wordLen; m++) {
                node = trie[node][s[m] - 'a'];
                if (node == 0) { misses++; matches[k] = -1; break; }
            }
            if (node != 0) {
                int countIdx = countMap[node];
                matches[k] = countIdx;
                windowCounts[countIdx]++;
                if (windowCounts[countIdx] == counts[countIdx]) hits++;
                else while (windowCounts[countIdx] > counts[countIdx]) {
                    int leftIdx = matches[l++];
                    if (leftIdx == -1) misses--;
                    else {
                        if (windowCounts[leftIdx] == counts[leftIdx]) hits--;
                        windowCounts[leftIdx]--;
                    }
                }
            }
            while (l <= k && matches[l] == -1) { l++; misses--; }
            if (hits == nwords && misses == 0) res[resLen++] = i + l * wordLen;
        }
    }
    *returnSize = resLen;
    return res;
}