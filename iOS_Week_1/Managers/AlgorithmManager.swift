//
//  AlgorithmManager.swift
//  iOS_Week_1
//
//  Created by Erkut Bas on 19.09.2021.
//

import Foundation

class AlgorithmManager: AlgorithmProtocol {
    
    // MARK: - Two Sum
    /*
     Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
     You may assume that each input would have exactly one solution, and you may not use the same element twice.
     You can return the answer in any order.
     
     Input: nums = [2,7,11,15], target = 9
     Output: [0,1]
     Output: Because nums[0] + nums[1] == 9, we return [0, 1].
     */
    func twoSumTest() {
        let nums = [2,7,11,15]
        let target = 9
        let result = twoSum(nums, target)
        print("result : \(result)")
    }
    
    private func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        // I needed to initialize an empty results array to return the result of the function.
        var resultArray = [Int]()
        
        //checking each consecutive number and adding them together to reach the target specified.
        
        for i in 0..<nums.count {
            if i < nums.capacity - 1 {
                
                if nums[i] + nums[i + 1] == target {
                    //appending the positions of the numbers in the original nums: [Int] array. I have to add both i and i+1.
                    resultArray.append(i)
                    resultArray.append(i + 1)
                }
            }
        }
        
        //returning the result from the checking loop
        return resultArray
    }
    
    // MARK: - IsPalindrome
    /*
     Given a string s, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.
     Input: s = "A man, a plan, a canal: Panama"
     Output: true
     Explanation: "amanaplanacanalpanama" is a palindrome.
     */
    func isPalindromTest() {
        let s: String = "A man, a plan, a canal: Panama"
        let empty: String = ""
        let s2: String = "Eva, can I see bees in a cave?"
        let s3: String = "Kazak"
        let s4: String = "Siz de çekoslavyalılaştıramadıklarımızdanmısınız"
        print("is ' \(empty)' a palindrome?: \(isPalindrome(empty))")
        print("is '\(s)' a palindrome?: \(isPalindrome(s))")
        print("is '\(s2)' a palindrome?: \(isPalindrome(s2))")
        print("is '\(s3)' a palindrome?: \(isPalindrome(s3))")
        print("is '\(s4)' a palindrome?: \(isPalindrome(s4))")
    }
    
    func isPalindrome(_ s: String) -> Bool {
        
        //first of all we need to take the s: and make it one continuous character string without exclamation or punctuation marks
        
        let pattern = "[^A-Za-z0-9]+"
        let unoptimizedString = s.replacingOccurrences(of: pattern, with: "", options: [.regularExpression])
        let string = unoptimizedString.lowercased()
        
        // 1-if a string a palindrome we only need to check if the first half of the string is mirrored with other half
        // 2-we can compare and drop first and last character of the string
        // 3-if they are not same we stop and return false
        // 4-if they are same we continue until we reach the middle we stop
        
        
        var itIs = true // when true the string is a palindrome
        
        
        
        let length = string.count / 2 //1
        
        for i in 0..<length { //2-3-4 goes here
            
            let start = string.index(string.startIndex, offsetBy: i) //2
            // we use offset as minus i because we are looking for a mirrored character. if we use plus i we go out of bound of the string when we get to the first index. when i is 0 it will be -1 but if we put minus before the i it will be plus one.
            let end = string.index(string.endIndex, offsetBy: -i - 1) //2 ( to find the endIndex we need to decrease the i by 1 or our constant goes out of bounds...)
            
            if string[start] != string[end] {
                //Code review reflection
                return  false //3
            }
        }
        
        itIs = true
        return itIs
    }
    
    // MARK: - Valid Anagram
    /*
     Given two strings s and t, return true if t is an anagram of s, and false otherwise.
     Input: s = "anagram", t = "nagaram"
     Output: true
     */
    func isAnagramTest() {
        let s = "anagram"
        let t = "gramana"
        print("'\(s)' an anagram of '\(t)': \(isAnagram(s, t))")
        
    }
    
    func isAnagram(_ s: String, _ t: String) -> Bool {
        
        //sorting every character in the given strings before doing anything with them
        
        let sortedS = Array(s).sorted()
        let sortedT = Array(t).sorted()
        
        
        // Code review reflection
//        var itIsAnagram: Bool
//
//        // they should be the same after they get sorted if they are anagrams
//        if sortedS == sortedT {
//            itIsAnagram = true
//            return itIsAnagram
//        }
//        // else not lol
//        itIsAnagram = false
//        return itIsAnagram
        return sortedS == sortedT
    }
    
    // MARK: - Contains Duplicate
    /*
     Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.
     Input: nums = [1,2,3,1]
     Output: true
     Input: nums = [1,2,3,4]
     Output: false
     */
    func duplicateTest() {
        let nums1 = [1,2,3,1]
        let nums2 = [1,2,3,4]
        print("\(nums1) array contain duplicates: \(containsDuplicate(nums1))")
        print("\(nums2) array contain duplicates: \(containsDuplicate(nums2))")
    }
    
    func containsDuplicate(_ nums: [Int]) -> Bool {
        // Sets dont contain duplicates. If we turn this array into a set and compare the elements we determine if that array contains duplicates...
        return Set(nums).count < nums.count
    }
    
    // MARK: - Merge Sorted Array
    /*
    
     You are given two integer arrays nums1 and nums2, sorted in non-decreasing order, and two integers m and n, representing the number of elements in nums1 and nums2 respectively.
     Merge nums1 and nums2 into a single array sorted in non-decreasing order.
     The final sorted array should not be returned by the function, but instead be stored inside the array nums1. To accommodate this, nums1 has a length of m + n, where the first m elements denote the elements that should be merged, and the last n elements are set to 0 and should be ignored. nums2 has a length of n.
     
     Input: nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
     Output: [1,2,2,3,5,6]
     Explanation: The arrays we are merging are [1,2,3] and [2,5,6].
     The result of the merge is [1,2,2,3,5,6] with the underlined elements coming from nums1.
     */
    func mergeArraysTest() {
        
        var nums1 = [1,2,3,0,0,0]
        let m = 3
        let nums2 = [2,5,6]
        let n = 3
        
        print("if '\(nums1)' array and '\(nums2)' array merge, they create ",  merge(&nums1, m, nums2, n), "\(nums1)") //MARK: - Inout parameter. they get in and get out with the value they got inside the function.
        
    }
    
    private func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) { // inout makes the input variable. They get in the function and come out with the last value they assigned to.
        
        var count = 0 // how many times we are gonna loop inside the for-loop
        
        for i in m..<m+n { // 3..<6
            
            nums1[i] = nums2[count] // nums1[2] = nums2[0] -> nums1[3] = nums2[1] -> nums1[4] = nums2[2] -> nums1[5] = nums2[3]
            count += 1              // above line means, we leave the first m count of elements alone in the nums1 array and one by one replace other elements
        }
        nums1 = nums1.sorted() // we sort the nums1 in the ascending order. since "&" keyword makes the input variable, it takes the last result as its value
        
    }

    
    // MARK: - Intersection of Two Arrays
    /*
     Given two integer arrays nums1 and nums2, return an array of their intersection. Each element in the result must appear as many times as it shows in both arrays and you may return the result in any order.
     
     Input: nums1 = [1,2,2,1], nums2 = [2,2]
     Output: [2,2]
     */
    func arrayIntersectionTest() {
        let nums1 = [1,2,2,1]
        let nums2 = [2,2]
        print("intersection between '\(nums1)' and '\(nums2)' is  '\(intersect(nums1, nums2))'")
    }
    
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        // we first filter if the first array contains the second array. and return the result as output
         
        //Code review reflection
        return nums1.filter(nums2.contains)
        
    }
    
    // MARK: - Missing Number
    /*
     Given an array nums containing n distinct numbers in the range [0, n], return the only number in the range that is missing from the array.

     Input: nums = [3,0,1]
     Output: 2
     Explanation: n = 3 since there are 3 numbers, so all numbers are in the range [0,3]. 2 is the missing number in the range since it does not appear in nums.

     */
    func missingNumberTest() {
        let nums = [3,0,1,5,4,8,9,7,6]
        
        print("\(missingNumber(nums))")
    }
    
    private func missingNumber(_ nums: [Int]) -> Int {
        
        let numArraySorted = Set(nums.sorted())
        
        for i in 0...nums.count where !numArraySorted.contains(i) { // we try to reach the number with i. when i value gets to the point where the set does not contain value "i" it will return "i" as a missing number.
            return i
        }
        //code should never return this
        return 0123456789
    }
    
    /*
     ALTERNATIVELY I COULD USE EXTENSION I FOUND ONLINE
     ----------
     let names1 = ["John", "Paul", "Ringo"]
     let names2 = ["Ringo", "Paul", "George"]
     let difference = names1.difference(from: names2)
     ----------
     
     extension Array where Element: Hashable {
     func difference(from other: [Element]) -> [Element] {
     let thisSet = Set(self)
     let otherSet = Set(other)
     return Array(thisSet.symmetricDifference(otherSet))
     }
     }
     
     */
    
}
