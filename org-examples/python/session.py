import math
from pprint import pprint

x = [round(math.log(i), 2) for i in range(1, 6)]
y = [round(math.sqrt(i), 2) for i in range(0, 5)]
kv = [{"point": {"x":xi, "y":yi}} for xi, yi in zip(x, y)]
pprint(kv)

def greet(name: str) -> str:
    return f"Hello {name}."

print(greet("geoff"))
