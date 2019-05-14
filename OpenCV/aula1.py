import cv2
import numpy as np
import matplotlib.pyplot as plt

img = cv2.imread('fotos\logo2.jpg', 0)

#cv2.imshow('image', img)

plt.imshow(img, cmap='gray',interpolation='bicubic')
plt.show()
cv2.waitKey(0)
cv2.destroyAllWindows()