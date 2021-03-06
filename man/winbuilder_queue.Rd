% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/winbuilder_queue.R
\name{winbuilder_queue}
\alias{winbuilder_queue}
\title{Show the win-builder queue}
\usage{
winbuilder_queue(
  pkg = NULL,
  folders = c("R-release", "R-devel", "R-oldrelease")
)
}
\arguments{
\item{pkg}{Optionally provide a vector of package names to limits the
results to these packages.}

\item{folders}{Which folders of the win-builder queue do you want to
inspect? Default: the 3 architectures win-builder provides.}
}
\value{
A \code{tibble} with the following columns:
\describe{
\item{package}{package name}
\item{version}{package version}
\item{folder}{the folder indicating the R version that will be used to perform the checks}
\item{time}{the date and time at which the package tarball was uploaded on win-builder}
\item{size}{the size of the package tarball}
}
}
\description{
Check whether your package is in the win-builder queue.
}
\details{
To check whether your package has successfully been submitted to
win-builder, or to check whether there is unusual delay in processing
packages submitted to win-builder, \code{winbuilder_queue} allows you to inspect
the packages that are in the queue to be processed by the win-builder
service.
}
\examples{
\dontrun{
  ## Get all the packages in the win-builder queue
  winbuilder_queue()
  ## Check if the 'dplyr' package is in the win-builder queue
  winbuilder_queue(pkg = "dplyr")
  ## Check which packages are in the R-devel queue
  winbuilder_queue(folders = "R-devel")
}
}
\references{
\itemize{
\item Maëlle Salmon, 2020. "Everything you should know about WinBuilder" \url{https://blog.r-hub.io/2020/04/01/win-builder/}
\item Uwe Ligges. Building and checking R source packages for Windows. \url{https://win-builder.r-project.org/}
}
}
