%dw 1.0
%output application/java
---
{
	billing_company_id: payload.Billing_Company__c,
	billing_address_id: payload.Billing_Address__c,
	billing_split: payload.Billing_Split__c,
	project_id: payload.DatasiteOne_Project__c
}