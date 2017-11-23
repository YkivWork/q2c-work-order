%dw 1.0
%output application/java
---
{
	api_name: payload.api_name,
	error_message: payload.error_msg,
	error_code: payload.error_code
}