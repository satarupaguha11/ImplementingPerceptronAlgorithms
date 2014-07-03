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
