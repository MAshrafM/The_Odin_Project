def merge_sort(arr)
  return arr if arr.length == 1
  half = arr.length/2
  arr1 = merge_sort(arr[0..half-1])
  arr2 = merge_sort(arr[half..-1])
  merge(arr1,arr2)
end

def merge(arr1, arr2, res=[])
  idx1, len1 = 0, arr1.length
  idx2, len2 = 0, arr2.length
  while idx1<len1 && idx2 <len2
    if arr1[idx1] < arr2[idx2]
	  res << arr1[idx1]
	  idx1 += 1
	else
	  res << arr2[idx2]
	  idx2 += 1
	end
  end
  if idx1 < len1
    res += arr1[idx1..-1]
  elsif idx2< len2
    res += arr2[idx2..-1]
  end
  res
end

arr1 = [10,9,8,7,6,5,4,3,2,1]
arr2 = [323,14111,425,1231,41,2]
arr3 = [555,777,222]

p merge_sort(arr1)
p merge_sort(arr2)
p merge_sort(arr3)