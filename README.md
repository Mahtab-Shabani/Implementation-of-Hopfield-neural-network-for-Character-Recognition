# Implementation-of-Hopfield-neural-network-for-Character-Recognition

**Goal: Recognition of six first uppercase English letters by Hopfield neural network (even if they are noisy)**

**training set: the characters A, B, C, D, E, F, and Z**

**test set: noisy images**

🚀 How to Run:
===========
### 1-     Open MATLAB.

### 2-     Run the main GUI file: 
```
hop
```
### 3-     In the GUI:


#### I. Click "Create Network" to initialize the network with training patterns.
#### II. Enter a test character (e.g., A, B, ..., Z) in the textbox.

![image](https://user-images.githubusercontent.com/21992001/186536489-0b466d51-001c-48a2-b09e-6cb07adafba1.png)

#### III. Click "Add Noise" to corrupt the input pattern.(It's Optional) 
```
a = a + 0.1 * randn(size(a));
```
![image](https://user-images.githubusercontent.com/21992001/186536659-76094bc5-5332-428a-9eb1-ce6a872f5bf2.png)

#### IV. Click "Run"
![image](https://user-images.githubusercontent.com/21992001/186536708-f734e390-1f49-4184-b537-f55f140fab8b.png)

(This image is an example of the noisy given input “A”, the network attempts pattern recovery within a set number of steps, and the output at each step will be plotted in real-time, revealing the recovery process.)

License
===========
You can view this project on open-source projects. You may fully use it for personal purposes, and it is licensed under the MIT License. You can share, alter, or modify it in any way you like.

