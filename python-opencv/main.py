import logging

import cv2

logger = logging.getLogger(__name__)


print("Script launched...")
image = cv2.imread("./image.jpg")

# Check if image loading was successful
if image is None:
    logger.error("Error: Could not read image!")
    exit(1)

# Convert the image to grayscale
grayscale_image = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

# Apply Canny edge detection
edges = cv2.Canny(grayscale_image, 100, 200)

# Specify the output filename (replace "output_image.jpg" with your desired name)
output_filename = "output.jpg"

# Save the edge-detected image
cv2.imwrite(output_filename, edges)

logger.info(f"Image created {output_filename}")
print("Script finished!")
