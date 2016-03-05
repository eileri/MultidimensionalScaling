%% Multidimensional Scaling 
% CLPS 1291 Assignment 4
% Due March 8, 9:00 AM
% Last Updated: February 2016

%% 1. Perceived Similarity of Colors

% Multidimensional scaling (MDS) can be used to represent
% the perceived similarity (or dissimilarity!) of items. Using this algorithm,
% we can use a set of dissimilarity ratings (i.e., pairwise distances between 
% individual items) to reconstruct a plot representing the relative arrangement
% of items in psychological space. MDS assumes that, as perceptual
% similarity between a pair of items INCREASES, their physical separation
% in psychological space DECREASES. 

% Here, we will run MDS on a sets of dissimilarity judgments about
% colors and animals! 

%% 1. a) Load color dataset
% 
% One of the datasets we will be using in this assignment is contained in a 
% file called 'colors.mat'. This contains a structure with two fields: 
% (1) names = 1x14 cell array containing the wavelengths of 14 colors (To 
%     get an idea of what colors these wavelengths correspond to, look at
%     the table at http://en.wikipedia.org/wiki/Color).
% (2) dsim = 14x14 matrix of perceived dissimilarities between each color, 
%     as determined by human judgments. These values have been adjusted to 
%     be on a scale from 0 to 1. A value of 1 means that two elements are
%     the most dissimilar, while a value of 0 means that they are identical.

% Load the file 'colors.mat' and save it as a variable.

% -- Your code here -- % 

dsimColors = load ('colors.mat', 'dsim');
namesColors = load ('colors.mat', 'names');
dsimAnimals = load ('animals.mat', 'dsim');
namesAnimals = load ('animals.mat', 'names');

% -------------------- % 

% Now, save the fields within this structure as their own variables -- this
% will make them easier to work with later.
% HINT: Search 'access data in a structure array' in Mathworks if you are
% not familiar with this type of array. 

% -- Your code here -- % 

dsimAnimals = dsimAnimals.dsim;
namesAnimals = namesAnimals.names;
dsimColors = dsimColors.dsim;
namesColors = namesColors.names;

% -------------------- % 

%% 1. b) Visualize color dissimilarity matrix 
% 
% In order to visualize the dissimilarity matrix, you will need to use the
% following set of functions: 
% (1) 'figure': creates a new figure window 
% (2) 'imagesc': displays your data as a color map
%     (with one pure color representing the highest value, another pure color
%     representing the lowest value, and a gradient of in-between colors
%     representing the in-between values). 
% (3) 'colorbar': makes sure a color scale (like a figure legend) appears 
%     next to your dissimilarity matrix.

% Now, put all these commands together to plot your matrix! 

% -- Your code here -- % 

PerceivedColorSimilarity = figure()
imagesc(dsimColors)
colorbar

% -------------------- % 

% You still need to label your x and y axes! Give the axes descriptive labels, 
% and plot the color names on the x and y axes using the 'set' function.
% Remember: type 'help set' in the command window if you're confused!

% -- Your code here -- %



% -------------------- % 

% Finally, give your matrix a descriptive title. 

% -- Your code here -- %


% -------------------- % 

% Add this figure to 'results.pdf.' 

%% 1. c) Run Multidimensional Scaling

% Now, we will run MDS to try to recover people's psychological spaces.
% There is a function you can use to complete this task -- see if
% you can figure out what it is!

% -- Your code here -- % 


% -------------------- % 

% HINT: If you've done this correctly, the function should create a 10x2 matrix
% of values between -1 and 1. Make sure that you have this before trying to
% plot your results! 

%% 1. d) Plot MDS Results 

% Now, we can visualize our MDS results! This time, we want to create a
% scatter plot that will act as a 2-dimensional representation of the
% dissimilarity between the colors. 

% First, create a new figure window (like we did before). Then, you should
% use the 'scatter' function to plot the MDS results (with column 1 of your
% MDS output as the x axis, and column 2 as the y axis). Each point on this
% plot will represent the position of a given color in
% psychological space. 

% -- Your code here -- % 


% -------------------- % 

% Now, we need to add labels to our scatter plot. We'll need a few things: 
% (1) Use the 'text' function to add labels to each individual data point.
%     Think about what these points are supposed to represent! 
% (2) Label the x and y axes.
% (3) Give your scatter plot a descriptive title. 

% -- Your code here -- % 


% -------------------- % 

% What do you notice about the relative locations of these data points?
% Does the scatter plot remind you of anything (if so, what and why)?
% Add this figure and your response to the above questions to 'results.pdf.'

%% 1. e) Calculate Pairwise Distances by Hand 

% Now, we need to compute the Euclidean distance between each pair of
% objects in our data matrix. The 'Euclidean distance' is the shortest
% straight-line distance that can be drawn between two points in 2D space.
% In order to compute this, we just need need to use the distance formula 
% (same as the Pythagorian theorem). 

% Use this formula to calculate the pairwise distances between each point
% in your dissimilarity matrix. 

% We also want to time how long it takes Matlab to run these calculations.
% In order to measure the elapsed time between the start and end of a
% calculation, simply write the word 'tic' before the chunk of code
% containing your calculations, and the word 'toc' at the end. When you run
% this script, the elapsed time it took for the script to run from 'tic' to
% 'toc' will appear in the command window. 

% -- Your code here -- % 


% -------------------- % 

%% 1. f) Calculate Pairwise Distances Using 'pdist'

% In order to make our computation run faster, we want to compute the
% pairwise distances between our observations using the built-in function
% 'pdist' to generate a vector of the Euclidean pairwise distances between
% each datapoint in our scatter plot. 
% HINT: When using this function, make sure you are asking for the
% EUCLIDEAN distance! Use 'help' to check that you're doing this correctly.

% Add 'tic' and 'toc' commands immediately before and after calling the pdist 
% function, to time how long it takes Matlab to perform this calculation. 

% -- Your code here -- % 


% -------------------- % 

% After running the script, check the elapsed time in the command window.
% How does this compare to the time it took to compute the pairwise
% distances by hand? Why do you think this is? Add you response and the
% elapsed times from parts 1. e) and e. f) to 'results.pdf.'

%% 1. g) Create Distance and Similarity Matrices

% The 'pdist' function should output a row vector. However, we'll
% need to transform this vector into something we can plot more easily.
% First, use the function 'squareform' to convert the vector output of
% 'pdist' into a symmetric, square matrix.

% -- Your code here -- %


% -------------------- % 

% Then, convert the above distance matrix and your dissimilarity matrix
% into column vectors, so we can plot them easily. 
% HINT: There is a simple operator that allows you to convert a matrix into
% a vector. See if you can figure out what it is! 

% -- Your code here -- % 


% -------------------- % 

%% 1. h) Experimental similarity measures vs. Recovered distances in psychological space

% Now, we can plot the experimental similarity measures (i.e., those
% obtained via human judgements) against the calculated distances between
% those same items in psychological space. Create a new figure, and use
% 'scatter' to generate another scatter plot.
% REMEMBER: We are trying to plot SIMILARITY measures, but your
% experimental measures are currently in terms of DISSIMILARITY! To go from
% a dissimilarity to a similarity matrix, you just need to subtract the
% former from 1.

% -- Your code here -- % 


% -------------------- % 

% Label your x and y axes and give your scatter plot a descriptive title.

% -- Your code here -- % 


% -------------------- % 

% What do you notice about the relationship between empirical measures of
% similarity and distance in psychological space? How might these results
% relate to Shepard's universal law of generalizations? 
% Add this figure and your response to the above questions to 'results.pdf.'

%% 2. Perceived Similarity of Animals 
% Now, we will essentially repeat all the steps we took with the color dataset,
% but using a dataset comparing the similarity of animals! 

%% 2. a) Loading animal dataset
% 
% The animal dataset is contained within a file called 'animals.mat'. 
% This contains two saved variables (much like 'colors.mat'): 
% (1) names = 10x1 cell array containing the names of 10 animals.
% (2) dsim = 10x10 matrix of perceived dissimilarities between each animal, 
%     as determined by human judgments. These values have also been adjusted to 
%     be on a scale from 0 to 1, just like the colors dsim matrix. 

% Load the file 'animals.mat' and save it as a variable, then save the fields 
% within this structure as their own variables.

% -- Your code here -- %


% -------------------- % 

%% 2. b) Visualize animal dissimilarity matrix 

% Create a new figure that visualizes your animal dissimilarity matrix as a
% color map (make sure to include a colorbar!). 

% -- Your code here -- %


% -------------------- % 

% Use the animal names to label your x and y axes, and give your figure a
% descriptive title.

% -- Your code here -- % 



% -------------------- % 

%% 2. c) Run Multidimensional Scaling and Plot Results 

% Use the same function as before to run MDS on the animal dissimilarity matrix.

% -- Your code here -- %


% -------------------- % 

% Now, visualize the MDS results as a scatter plot (just like before!). Here, 
% our scatter plot will act as a 2-dimensional representation of the dissimilarities 
% between each animal. 

% -- Your code here -- %


% -------------------- % 

% Label each individual data point (again, use the 'text' function) and your x
% and y axes, and give your scatter plot a descriptive title.

% -- Your code here -- %


% -------------------- % 

% Describe the relative arrangement of these data points. Do you notice any
% patterns or groups emerging (and if so, why do you think that is)? How
% does this plot compare with your color plot? 
% Add this figure and your response to the above questions to 'results.pdf.'

%% 2. d) Create Distance and Similarity Matrices 

% Here, you'll be repeating all the steps from 1. e), using your animal data. 
% Generate a vector of the Euclidean pairwise distances between each datapoint 
% in our scatter plot, and transform this vector (and your dissimilarity matrix)
% into vectors we can plot later. 

% -- Your code here -- %


% -------------------- % 

%% 2. e) Experimental similarity measures vs. Recovered distances in psychological space

% Again, we'll plot the experimental similarity measures against the calculated 
% distances between those same items in psychological space. 
% Create a new figure, and use 'scatter' to generate a scatter plot. Make
% sure to label your x and y axes and add a title! Remember, we want to
% plot SIMILARITY measures (not dissimilarity!). 

% -- Your code here -- %


% -------------------- % 

% Is this relationship similar to the one you observed with the color data? 
% If you see any differences, why do you think they exist? 
% Add this figure and your response to the above questions to 'results.pdf.'

%% EXTRA CREDIT! 

% This is your chance to run MDS on additional data sets! The following
% website contains lots of sets of similarity data you can choose from:
% http://faculty.sites.uci.edu/mdlee/similarity-data/

% Pick a couple of data sets that you're interested in, and go through the
% same steps you did for the color and animal data above. 

% Fair warning: Some of these datasets can be a little messy! You'll need
% to be very careful in checking whether the matrices represent SIMILARITY
% or DISSIMILARITY. If you aren't sure, visualize the data as a color map.
% If the diagonal of the matrix = 0, it's a DISSIMILARITY matrix. If the
% diagonal = 1, it's a SIMILARITY matrix. If the matrix you have isn't in
% the form you want, subtract it from 1! 

% How well does the psychological space recovered by MDS seem to agree with
% your expectations for how the data should be organized? Are the points
% you think are similar located close together in the map? If not, why do
% you think that is? Is there a better way to represent the data you chose?

% Add all of your figures and responses to the questions above to 'results.pdf.' 
