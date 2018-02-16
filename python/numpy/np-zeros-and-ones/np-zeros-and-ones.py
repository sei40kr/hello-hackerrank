import numpy as np

sizes = tuple(map(int, input().split()))
print(np.zeros(sizes, dtype=np.int))
print(np.ones(sizes, dtype=np.int))
