# Guide: Capturing correlation data

## Success Criteria

This challenge does not have any specific deliverables. Instead, the challenge should conclude with a discussion between you and team. The team should present how they propose to capture correlation data when the application encounters an error.

Some things to remember:

* The team should determine what data should be captured. Part of this is determining the data that is most relevant. Capturing _all_ data without a specific reason can be counterproductive as too much data will increase storage costs and complexity in interpretation.

* The data should be queryable and, if necessary, reportable. Therefore, the recommended storage mechanism should allow both.

* No PII should be stored. The team will need to determine a way to associate the stored data with the user that encountered the error.

* The team will need a strategy for validating any issues that are encountered in the customer's application. Additionally, the team will need to present a mechanism for designing test cases so that Woodgrove Bank can perform proper regression testing.

## Hints/Suggestions

* Application Insights identifies each request with an unique identifier. The unique identifier can then be passed between services. For HTTP requests, the team may suggest adding the following header `X-Correlation-Id: aa094a45-afc4-45e6-b557-e0ed98674d66` (the unique identifier would be supplied by Application Insights). The _X-Correlation-Id_ is not a standard, but it is a common practice.

* The team will need to enable and capture tracing among services. OpenTracing provides a standard tracing definition and can be utilized with a number of programming languages, and there is a logging provider for Application Insights.

* Storing a user's GUID when an error is encountered is one way to keep PII out of error logs.

* Azure DevOps is an ideal environment for creating backlogs and test cases. Developers can squash bugs in the backlog while quality assurance analysts can create test cases. Additionally, developers can identify any additional automated unit tests that should be created in order to reduce the necessary scope for manual regression testing.

## References

_None specific to coaches._

## Step-By-Step

_Not applicable._
