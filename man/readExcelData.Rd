% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/main.R
\name{readExcelData}
\alias{readExcelData}
\title{Read Excel Data}
\usage{
readExcelData(
  excelFile,
  dictionary,
  dataSheet = "DataEntry",
  saveWarnings = FALSE,
  setErrorsMissing = FALSE,
  use_labels = TRUE,
  range,
  origin
)
}
\arguments{
\item{excelFile}{path and filename of the data file}

\item{dictionary}{A data frame returned by readDataDict}

\item{dataSheet}{name of the data entry sheet within the file, defaults to
'DataEntry'}

\item{saveWarnings}{Boolean, if TRUE and there are any warnings then the
function will return a list with the data frame and the import warnings}

\item{setErrorsMissing}{Boolean, if TRUE all values out of range will be set
to NA}

\item{use_labels}{should variable descriptions be added as variable label
attributes, default is TRUE}

\item{range}{Optional, Range of Excel sheet to restrict import to (ie.
range="A1:F6")}

\item{origin}{Optional, the date origin of Excel dates, defaults to 30
December 1899}
}
\value{
A data frame containing the imported data
}
\description{
This function reads in an excel data table created by the dictionary.xlsm
template file according to the specifications in the dictionary
}
\details{
Prior to reading in the data, the dictionary file must be imported using
readDataDict.

Warning: If SetErrorsMissing = TRUE then a subsequent call to checkData will
not return any errors, because the errors have been set to missing.

NOTE: This function will only read in those columns present in the dictionary
}
\examples{
exampleDataFile <- system.file("extdata", "exampleData.xlsx", package = "exceldata")
dictionary <- readDataDict(exampleDataFile, dictionarySheet = 'DataDictionary')
data <- readExcelData(exampleDataFile,dictionary,dataSheet='DataEntry')
}
