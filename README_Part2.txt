***************************************************************************************
I have implemented multi-class classification for the following algorithms:-
1) Single Sample Perceptron without margin
2) Single Sample Perceptron with margin
3) Batch Perceptron without margin
4) Batch Perceptron with margin
5) Batch Relaxation

There is a function called main that takes as input the following- name of the file that contains the testing data, and also a number in the range [1,5]. This number denotes which algorithm I am going to run my program on. I have assigned values for the algorithms in order as listed above. This function returns the list of predicted labels corresponding to the testing data.


TRAINING PHASE

Before testing, we first train the classifier on the given subsample MNIST dataset with any one of the algorithms(according to the number taken as input in the main program), we need to invoke the functions in the following way-
For Single Sample Perceptron without margin,
[v]=multiclass_singleSamplePerceptron(testData,testLabel);
It returns a vector 'a', which is essentially the coefficient vector of the decision boundary. The input parameters are the train data, labels and the margin b, which in this case is 0, since there is no margin here.

Similarly for Single Sample Perceptron with margin,

[v]=multiclass_singleSamplePerceptron(testData,testLabel,margin);

For Batch Perceptron with margin
[v]=multiclass_batchMargin(testData,testLabel,margin);

For Batch Relaxation
[v]=multiclass_batchRelaxation(testData,testLabel, margin);

Each of the functions works in the following steps:-
Preprocessing- The each data point consists of 784 coordinates. We augment each data point vector with '1'. So after this, each data point is basically a vector having 785 dimensions.
Now, for each of the 10 digits, we then negate the coordinate values of those points whose label is equal to that digit.
Then for each of the 10 digits, we compute the 'a' vector that is the coordinate vector of the decision boundary separating this digit from the rest of the digits. The 10 'a' vectors are stored in a 'v' vector that we return from this function.


TESTING PHASE
The testing function is invoked in the following way:-
[labels] = multiclass_testingNew( v, testingData )
It takes as input the 'v' vector that we obtain from the training phase, along with the testing data that we take as input in the main program. It returns the list of predicted labels for the testing data. 
***************************************************************************************