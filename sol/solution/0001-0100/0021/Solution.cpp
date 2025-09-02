/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode() : val(0), next(nullptr) {}
 *     ListNode(int x) : val(x), next(nullptr) {}
 *     ListNode(int x, ListNode *next) : val(x), next(next) {}
 * };
 */
class Solution {
public:
    ListNode* mergeTwoLists(ListNode* list1, ListNode* list2) {
        ListNode* merged = nullptr;
        ListNode** lastPtr = &merged;
        while (list1 && list2) {
            ListNode* newNode = new ListNode();
            if (!newNode) {
                return nullptr;
            }
            if (list1->val < list2->val) {
                newNode->val = list1->val;
                list1 = list1->next;
            } else {
                newNode->val = list2->val;
                list2 = list2->next;
            }
            newNode->next = nullptr;
            *lastPtr = newNode;
            lastPtr = &newNode->next;
        }
        *lastPtr = list1 ? list1 : list2;
        return merged;
    }
};