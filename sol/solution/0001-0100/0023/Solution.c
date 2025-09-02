/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */
struct ListNode* mergeKLists(struct ListNode** lists, int listsSize) {
	if (listsSize == 0) return NULL;
	struct ListNode* dummy = (struct ListNode*)malloc(sizeof(struct ListNode));
	dummy->next = NULL;
	struct ListNode* tail = dummy;
	while (1) {
		int minIndex = -1;
		for (int i = 0; i < listsSize; ++i) {
			if (lists[i] != NULL) {
				if (minIndex == -1 || lists[i]->val < lists[minIndex]->val) {
					minIndex = i;
				}
			}
		}
		if (minIndex == -1) break;
		tail->next = lists[minIndex];
		tail = tail->next;
		lists[minIndex] = lists[minIndex]->next;
	}
	struct ListNode* result = dummy->next;
	free(dummy);
	return result;
}