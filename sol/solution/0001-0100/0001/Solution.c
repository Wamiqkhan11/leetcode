/**
 * Note: The returned array must be malloced, assume caller calls free().
 */
typedef struct {
    int key;
    int value;
    int used;
} HashItem;
int hash(int key) {
    return abs(key) % 20000;
}
int* twoSum(int* nums, int numsSize, int target, int* returnSize) {
    HashItem* hashTable = (HashItem*)calloc(20000, sizeof(HashItem));
    int* result = (int*)malloc(2 * sizeof(int));
    *returnSize = 2;
    for (int i = 0; i < numsSize; i++) {
        int complement = target - nums[i];
        int index = hash(complement);
        while (hashTable[index].used && hashTable[index].key != complement) {
            index = (index + 1) % 20000;
        }
        if (hashTable[index].used) {
            result[0] = hashTable[index].value;
            result[1] = i;
            free(hashTable);
            return result;
        }
        index = hash(nums[i]);
        while (hashTable[index].used) {
            index = (index + 1) % 20000;
        }
        hashTable[index].key = nums[i];
        hashTable[index].value = i;
        hashTable[index].used = 1;
    }
    free(hashTable);
    return result;
}