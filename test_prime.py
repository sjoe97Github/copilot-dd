import unittest
from prime import is_prime

class PrimeTestCase(unittest.TestCase):
    def test_prime_numbers(self):
        self.assertTrue(is_prime(2))
        self.assertTrue(is_prime(3))
        self.assertTrue(is_prime(5))
        self.assertTrue(is_prime(7))
        self.assertTrue(is_prime(11))
        self.assertTrue(is_prime(13))
        self.assertTrue(is_prime(17))
        self.assertTrue(is_prime(19))
        self.assertTrue(is_prime(23))
        self.assertTrue(is_prime(29))

    def test_non_prime_numbers(self):
        self.assertFalse(is_prime(0))
        self.assertFalse(is_prime(1))
        self.assertFalse(is_prime(4))
        self.assertFalse(is_prime(6))
        self.assertFalse(is_prime(8))
        self.assertFalse(is_prime(9))
        self.assertFalse(is_prime(10))
        self.assertFalse(is_prime(12))
        self.assertFalse(is_prime(14))
        self.assertFalse(is_prime(15))

if __name__ == '__main__':
    unittest.main()import math

def is_prime(n):
    if n < 2:
        return False
    for i in range(2, int(math.sqrt(n))+1):
        if n % i == 0:
            return False
    return True

# Test cases
assert is_prime(2) == True
assert is_prime(3) == True
assert is_prime(5) == True
assert is_prime(7) == True
assert is_prime(11) == True
assert is_prime(13) == True
assert is_prime(17) == True
assert is_prime(19) == True
assert is_prime(23) == True
assert is_prime(29) == True
assert is_prime(31) == True

assert is_prime(0) == False
assert is_prime(1) == False
assert is_prime(4) == False
assert is_prime(6) == False
assert is_prime(8) == False
assert is_prime(9) == False
assert is_prime(10) == False
assert is_prime(12) == False
assert is_prime(14) == False
assert is_prime(15) == False
assert is_prime(16) == False