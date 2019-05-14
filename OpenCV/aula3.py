import numpy as np
import cv2

img = cv2.imread('fotos\logo2.jpg', 1)
cv2.line(img, (0,0), (150,150), (255,0,0), 15)
cv2.rectangle(img, (500,0),(640,400),(130,140,130), 5)
cv2.imshow('image', img)
cv2.waitKey(0)
cv2.destroyAllWindows()