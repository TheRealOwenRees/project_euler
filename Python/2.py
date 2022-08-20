phi = (1 + 5 ** 0.5) / 2
even_fib = 2
result = 0

while result < 4000000:
    even_fib = round(even_fib * (phi ** 3))
    result += even_fib

print(int(result))
