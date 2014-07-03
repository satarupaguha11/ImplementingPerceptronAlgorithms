ImplementingPerceptronAlgorithms
================================
Two-class Classification:

**********************************************************************************************************************************************************************
I have implemented two-class classification for the following algorithms:-
1) Single Sample Perceptron without margin
2) Single Sample Perceptron with margin
3) Batch Perceptron without margin
4) Batch Perceptron with margin
5) Batch Relaxation

TRAINING PHASE

In order to train the given MS2CD data with any one of the algorithms, we need to invoke the functions in the following way-
For Single Sample Perceptron without margin,

[a]=singleSamplePerceptron(testData,testLabel);

It returns a vector 'a', which is essentially the coefficient vector of the decision boundary. The input parameters are the train data, labels and the margin b, which in this case is 0, since there is no margin here.

Similarly for Single Sample Perceptron with margin,

[a]=singleSamplePerceptron_margin(testData,testLabel,margin);

For Batch Perceptron with margin
[a]=batchPerceptron(testData,testLabel,b);

For Batch Relaxation
[a]=batchRelaxation(testData,testLabel);

Each of the functions works in the following 3 steps:-
Preprocessing- The each data point consists of 2 coordinates. We augment each data point vector with '1'. So after this, each data point is basically a vector having 3 dimensions. Let the two classes be class 0 and class 1. We then negate the coordinate values of those points whose label is equal to 1.

Computation of the 'a' vector- This step varies with each algorithm.

Plotting- From the a vector, we compute and plot the decision boundary. The figure is displayed.

TESTING PHASE
The testing function is invoked in the following way:-
[accuracy] = testing( a, testData, testLabel )
It takes as input the 'a' vector that we obtain from the training phase, the test data and the test labels. It returns the accuracy of the classifier. This function is common for all the algorithms.
If we want to find train accuracy, we can invoke the function in this way-
[accuracy] = testing( a, trainData, trainLabel )
***************************************************************************************
Multi-class Classification
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
