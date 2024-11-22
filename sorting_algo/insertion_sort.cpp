#include <iostream>
#include <vector>

// Function to print array (for verification)
void printArray(const std::vector<int>& arr) {
    for (int num : arr) {
        std::cout << num << " ";
    }
    std::cout << std::endl;
}

// Insertion sort implementation that mirrors the assembly code structure
void insertionSort(std::vector<int>& arr) {
    int t0 = 1;                  // i = 1 (start from second element)
    int a1 = arr.size();         // array length
    
    // outer_loop
    while (t0 < a1) {
        int t2 = arr[t0];        // key = arr[i]
        int t3 = t0 - 1;         // j = i - 1
        
        // inner_loop
        while (true) {
            // Check if we've reached the start
            if (t3 < 0) break;
            
            int t5 = arr[t3];    // t5 = arr[j]
            
            // Compare arr[j] with key
            if (t5 <= t2) break;
            
            // Move element right
            arr[t3 + 1] = t5;    // arr[j + 1] = arr[j]
            
            t3--;                // j--
        }
        
        // insert_element
        t3++;                    // j++
        arr[t3] = t2;           // arr[j] = key
        
        t0++;                    // i++
    }
}

int main() {
    // Initialize array with the same values as in assembly
    std::vector<int> arr = {6, 5, 2, 1};
    
    std::cout << "Original array: ";
    printArray(arr);
    
    insertionSort(arr);
    
    std::cout << "Sorted array: ";
    printArray(arr);
    
    return 0;
}