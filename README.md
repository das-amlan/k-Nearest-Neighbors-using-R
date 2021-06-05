# k-Nearest-Neighbors-using-R
The k-nearest neighbors (KNN) algorithm is a simple, supervised machine learning algorithm that can be used to solve both classification and regression problems. 

It's very easy to implement. Only has two parameter - K and the distance measure. Also can work with any number of classes.

But it is also known as a lazy learner. Because in the trining phase KNN algorithm just store the data and it does not perform any calculation. Also it does not work well with
High dimension data.

Here we use R to implement KNN. The data set is from the ISLR package. It is called Caravan. 
Caravan is a customer data. It has data of 6000 customers and 80 features/variables. We check based on the features if they purchased insurance or not from Caravan Insurance Company.
