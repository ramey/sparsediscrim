% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mdmp.r
\name{mdmp}
\alias{mdmp}
\alias{mdmp.default}
\alias{mdmp.formula}
\alias{predict.mdmp}
\title{The Minimum Distance Rule using Moore-Penrose Inverse (MDMP) classifier}
\usage{
mdmp(x, ...)

\method{mdmp}{default}(x, y, prior = NULL, eigen_pct = 0.95, ...)

\method{mdmp}{formula}(formula, data, prior = NULL, ...)

\method{predict}{mdmp}(object, newdata, ...)
}
\arguments{
\item{x}{matrix containing the training data. The rows are the sample
observations, and the columns are the features.}

\item{...}{additional arguments}

\item{y}{vector of class labels for each training observation}

\item{prior}{vector with prior probabilities for each class. If NULL
(default), then equal probabilities are used. See details.}

\item{eigen_pct}{the percentage of eigenvalues kept}

\item{formula}{A formula of the form \code{groups ~ x1 + x2 + ...} That is,
the response is the grouping factor and the right hand side specifies the
(non-factor) discriminators.}

\item{data}{data frame from which variables specified in \code{formula} are
preferentially to be taken.}

\item{object}{trained mdmp object}

\item{newdata}{matrix of observations to predict. Each row corresponds to a new observation.}
}
\value{
\code{mdmp} object that contains the trained MDMP classifier

list predicted class memberships of each row in newdata
}
\description{
Given a set of training data, this function builds the MDMP classifier from
Srivistava and Kubokawa (2007). The MDMP classifier is an adaptation of the
linear discriminant analysis (LDA) classifier that is designed for
small-sample, high-dimensional data. Srivastava and Kubokawa (2007) have
proposed a modification of the standard maximum likelihood estimator of the
pooled covariance matrix, where only the largest 95% of the eigenvalues and
their corresponding eigenvectors are kept. The value of 95% is the default
and can be changed via the \code{eigen_pct} argument.

The MDMP classifier from Srivistava and Kubokawa (2007) is an adaptation of the
linear discriminant analysis (LDA) classifier that is designed for
small-sample, high-dimensional data. Srivastava and Kubokawa (2007) have
proposed a modification of the standard maximum likelihood estimator of the
pooled covariance matrix, where only the largest 95% of the eigenvalues and
their corresponding eigenvectors are kept.
}
\details{
The matrix of training observations are given in \code{x}. The rows of \code{x}
contain the sample observations, and the columns contain the features for each
training observation.

The vector of class labels given in \code{y} are coerced to a \code{factor}.
The length of \code{y} should match the number of rows in \code{x}.

An error is thrown if a given class has less than 2 observations because the
variance for each feature within a class cannot be estimated with less than 2
observations.

The vector, \code{prior}, contains the \emph{a priori} class membership for
each class. If \code{prior} is NULL (default), the class membership
probabilities are estimated as the sample proportion of observations belonging
to each class. Otherwise, \code{prior} should be a vector with the same length
as the number of classes in \code{y}. The \code{prior} probabilities should be
nonnegative and sum to one.
}
\examples{
n <- nrow(iris)
train <- sample(seq_len(n), n / 2)
mdmp_out <- mdmp(Species ~ ., data = iris[train, ])
predicted <- predict(mdmp_out, iris[-train, -5])$class

mdmp_out2 <- mdmp(x = iris[train, -5], y = iris[train, 5])
predicted2 <- predict(mdmp_out2, iris[-train, -5])$class
all.equal(predicted, predicted2)
}
\references{
Srivastava, M. and Kubokawa, T. (2007). "Comparison of
Discrimination Methods for High Dimensional Data," Journal of the Japanese
Statistical Association, 37, 1, 123-134.

Srivastava, M. and Kubokawa, T. (2007). "Comparison of
Discrimination Methods for High Dimensional Data," Journal of the Japanese
Statistical Association, 37, 1, 123-134.
}

