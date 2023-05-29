# Implementation-of-Hopfield-neural-network-for-Character-Recognition

### Goal: Recognition of uppercase English letters by Hopfield neural network (even if they are noisy)

## STEPS:

### 1. Create Network:
```
[handles.X handles.T]=prprob();
handles.Letters='ABCDEFZ';
handles.LettersIndex=double(handles.Letters)-64;
handles.P=handles.X(:,handles.LettersIndex);
handles.net=newhop(handles.P);
```
![image](https://user-images.githubusercontent.com/21992001/186536489-0b466d51-001c-48a2-b09e-6cb07adafba1.png)

### 2. Add Noise:
![image](https://user-images.githubusercontent.com/21992001/186536659-76094bc5-5332-428a-9eb1-ce6a872f5bf2.png)

### 3. Test and RUN!
![image](https://user-images.githubusercontent.com/21992001/186536708-f734e390-1f49-4184-b537-f55f140fab8b.png)
