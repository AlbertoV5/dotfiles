# [[file:../temp.org::best_fare_price.py][best_fare_price.py]]
import numpy as np
import matplotlib.pyplot as plt
from pathlib import Path

plt.style.use('bmh')
# Creating lines from Urban to Suburban
drivers = np.linspace(490, 2405, 100)
fare_per_ride = np.linspace(30.97, 24.53, 100)
fare_per_driver = np.linspace(39.50, 16.57, 100)
# Expecting the amount of Rides to be independent of Drivers
rides = 1625
rides_per_driver = rides / drivers

# Find the index of the max total fare
total_fares = drivers * fare_per_driver
m = np.argmax(total_fares)
point = rides_per_driver[m], fare_per_driver[m]
driver_count = drivers[m]
best_fare = total_fares[m]

# Plotting
files = ["the_best_fare_per_driver.png"]
plt.plot(rides_per_driver, fare_per_driver, label="Urban to Suburban")
plt.plot(point[0], point[1], "ko")
plt.text(
    1, 20,
    (f"Drivers: {driver_count:,.0f}\nFare: ${point[1]:,.2f}"
     f"\nTotal Fare: ${best_fare:,.2f}"),
    fontsize=12,
    bbox = dict(facecolor="white", alpha=0.8),
)
plt.title(f"Best Fare per Driver for Urban cities", fontsize=16)
plt.ylabel("Fare per Driver")
plt.xlabel("Rides per Driver at 1,625 Rides")
plt.legend()
plt.tight_layout()
plt.savefig(files[0], dpi=200)
plt.close()
print(files, end="")
# best_fare_price.py ends here
