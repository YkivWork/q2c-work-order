%dw 1.0
%output application/java
%namespace env http://schemas.xmlsoap.org/soap/envelope/
%namespace aria urn:client:api:wsdl:document/literal_wrapped:vers:10.0:aria_complete_m_api
%var responseElement = payload.env#Envelope.env#Body.aria#create_order_mResponseElement
---
{
	error_msg: responseElement.error_msg,
	error_code: responseElement.error_code,
	order_no: responseElement.order_no,
	transaction_id: responseElement.transaction_id
	
}