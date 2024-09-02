#include <stdio.h>

void swap(int *a, int *b) {
    if (*a == *b) 
        return;
    *a ^= *b;
    *b ^= *a;
    *a ^= *b;
}

void BubbleSort(int *arr, int len) {
    int flag;
    for (int i = 0; i < len; ++i) {
        flag = 0;
        for (int j = 0; j < len - 1 - i; ++j) {
            if (arr[j] > arr[j + 1]) {
                flag = 1;
                swap(arr + j, arr + j + 1);
            }
        }
        if (flag == 0)
            return;
    }
}

int Partition(int *arr, int low, int high) {
    int pivotkey = arr[low], start = low;
    while(low < high) {
        while(low < high && arr[high] >= pivotkey)
            --high;
        while(low < high && arr[low] <= pivotkey)
            ++low;
        swap(arr + low, arr + high);
    }
    swap(arr + low, arr + start);
    return low;
}

void QuickSort(int *arr, int low, int high) {
    if (low >= high)
        return;
    int pivot = Partition(arr, low, high);
    QuickSort(arr, low, pivot - 1);
    QuickSort(arr, pivot + 1, high);
}

int main() {
    int arr[7] = {3, 8, 1, 7, 9, 5, 6};
    /* BubbleSort(arr, 7); */
    QuickSort(arr, 0, 6);
    for (int i = 0; i < 7; ++i)
        printf("%d ", arr[i]);
    /* first add comments remote version*/
    return 0;
}
