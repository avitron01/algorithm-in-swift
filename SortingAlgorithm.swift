/* MIT License

Copyright (c) 2018 avitron01

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE. */

import Foundation

enum SortingAlgorithm {
	case bubbleSort
	case selectionSort
	case insertionSort
	case heapSort
	case mergeSort
	case quickSort
}

class Sorter {
	
	func sort(_ elements: [Int], using algorithm: SortingAlgorithm) -> [Int] {
		switch algorithm {
			case .bubbleSort:
				return bubbleSort(for: elements)
			case .selectionSort:
				return selectionSort(for: elements)
			case .insertionSort:
				return insertionSort(for: elements)
			case .heapSort:				
				return heapSort(for: elements)
			case .mergeSort:
			//TODO: Yet to be implemented
				return elements
			case .quickSort:
			//TODO: Yet to be implemented
				return elements
		}
	}

	func bubbleSort(for elements: [Int]) -> [Int] {		
		var sortedElements = elements
		var lastIndex = sortedElements.count
		repeat {
			var newIndex = 0
			for i in 1...(lastIndex - 1) {
				if sortedElements[i - 1] > sortedElements[i] {
					sortedElements.swapAt(i - 1, i)
					newIndex = i
				}
			}
			lastIndex = newIndex
		} while (lastIndex != 0)

		return sortedElements
	}

	func selectionSort(for elements: [Int]) -> [Int] {
		var minimum = 0
		var sortedElements = elements
		let elementsCount = sortedElements.count
		for i in 0...elementsCount - 1 {
			minimum = i
			for j in (i+1)..<elementsCount {
				if sortedElements[j] < sortedElements[minimum] {
					minimum = j
				}
			}
			sortedElements.swapAt(minimum, i)
		}

		return sortedElements
	}

	func insertionSort(for elements: [Int]) -> [Int] {
		var sortedElements = elements
		let elementsCount = sortedElements.count

		for i in 1..<elementsCount {
			let key = sortedElements[i]
			var previousIndex = i - 1

			while previousIndex >= 0 && sortedElements[previousIndex] > key {
				sortedElements[previousIndex + 1] = sortedElements[previousIndex]
				previousIndex = previousIndex - 1
			}
			sortedElements[previousIndex + 1] = key
		}

		return sortedElements
	}

	func heapSort(for elements: [Int]) -> [Int] {
		let elementsCount = elements.count
		var sortedElements = elements

		for i in (0...(elementsCount / 2 - 1)).reversed() {
			sortedElements = heapify(sortedElements, elementsCount, i)
		}

		for i in (0...(elementsCount - 1)).reversed() {
			sortedElements.swapAt(0, i)
			sortedElements = heapify(sortedElements, i, 0)
		}

		return sortedElements
	}

	func heapify(_ elements: [Int], _ length: Int, _ index: Int) -> [Int] {
		let left = 2 * index + 1
		let right = 2 * index + 2
		var largest = index
		var heapifiedElements = elements

		if (left < length && heapifiedElements[left] > heapifiedElements[largest]) {
			largest = left
		}

		if (right < length && heapifiedElements[right] > heapifiedElements[largest]) {
			largest = right
		}

		if largest != index {
			heapifiedElements.swapAt(index, largest)
			heapifiedElements = heapify(heapifiedElements, length, largest)
		}

		return heapifiedElements
	}
}


let sorter = Sorter()
let input = [12, 63, 450, 24, 65, 35, 66, 101, 381, 4, 10, 1, 2]
print("---------------- Input --------------------- \n \(input)")
let output = sorter.sort(input, using: .heapSort)
print("---------------- Output --------------------- \n \(output)")

