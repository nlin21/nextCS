This is an interactive sketch of the resize function that image processing programs like Photoshop and GIMP come with. The creation and deletion of pixels when resizing an image is handled by applying linear interpolation to both the X and Y dimension. As a result, a "stretched" or “compressed” image, unbounded by aspect ratio, can be displayed.

![image](https://user-images.githubusercontent.com/44385887/150802529-6edd7106-38dd-4c12-9240-b4572af7560e.png)

Upon clicking the "Run" button, a 400 by 600 image of a flower will appear on the 1200 by 800 display window. 

![image](https://user-images.githubusercontent.com/44385887/150802618-a56c6d60-17d3-4674-b59a-99bb9ada1de7.png)

The BRC controls, which can be accessed via http://127.0.0.1:10002/ after running the sketch, consists of two sliders: 

![image](https://user-images.githubusercontent.com/44385887/150802773-e04c701d-257c-4bfb-a1bc-4b806277bedc.png)

The new width of the resized image can be controlled by the "New Width" slider, and the new height of the resized image can be controlled by the "New Height" slider.

For example, a resized image with new width 750px and new height 500px:

![image](https://user-images.githubusercontent.com/44385887/150802817-c804e807-2a65-4fce-b5df-5e2db38d0e2e.png)

Known Issues/Bugs
- Dragging the slider bar results in the image resize taking considerably longer time (possibly due to the amount of calculations). Clicking, rather than dragging, on various positions of the slider avoids this.
