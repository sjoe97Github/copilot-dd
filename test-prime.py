import unittest
from prime import is_prime  # assuming your function is in a file named prime.py

class TestIsPrime(unittest.TestCase):
    def test_prime_numbers(self):
        self.assertTrue(is_prime(2), "2 is a prime number")
        self.assertTrue(is_prime(3), "3 is a prime number")
        self.assertTrue(is_prime(5), "5 is a prime number")
        self.assertTrue(is_prime(7), "7 is a prime number")
        self.assertTrue(is_prime(11), "11 is a prime number")

    def test_non_prime_numbers(self):
        self.assertFalse(is_prime(1), "1 is not a prime number")
        self.assertFalse(is_prime(4), "4 is not a prime number")
        self.assertFalse(is_prime(6), "6 is not a prime number")
        self.assertFalse(is_prime(8), "8 is not a prime number")
        self.assertFalse(is_prime(9), "9 is not a prime number")

    def test_negative_numbers(self):
        self.assertFalse(is_prime(-1), "-1 is not a prime number")
        self.assertFalse(is_prime(-2), "-2 is not a prime number")
        self.assertFalse(is_prime(-3), "-3 is not a prime number")

if __name__ == '__main__':
    unittest.main()