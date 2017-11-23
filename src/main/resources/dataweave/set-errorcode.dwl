%dw 1.0
%output application/java
---
{
  errorCode: flowVars.ariaResults.error_code,
  errorMessage: flowVars.ariaResults.error_msg
}