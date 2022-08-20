n = 100

def sum_of_squares(n):
    return (n * (n+1) * (2 * n + 1)) / 6

def square_of_sum(n):
    return (n * (n + 1) / 2) ** 2

def difference_of_squares(n):
    print(f"The difference between 'square of sum' and 'sum of squares' = {int(square_of_sum(n) - sum_of_squares(n))}")

difference_of_squares(n)
