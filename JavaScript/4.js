function palindromeProduct() {
    const UPPER_BOUND = 999
    const LOWER_BOUND = 100

    let maxPalindromeProduct = Number.MIN_SAFE_INTEGER

    for (let i = UPPER_BOUND; i >= LOWER_BOUND; i--) {
        for (let j = i; j >= LOWER_BOUND; j--) {
            const product = i * j
            
            if (isPalindrome(product) && product > maxPalindromeProduct)
                maxPalindromeProduct = product
        }
    }

    return maxPalindromeProduct
}

const isPalindrome = (num) => String(num) === String(num).split('').reverse().join('')

console.log(palindromeProduct())