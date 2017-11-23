%dw 1.0
%output application/java
---
{
  address1: payload.Address_1__c,
  address2: payload.Address_2__c,
  address3: payload.Address_3__c,
  amount: payload.Amount__c,
  billImmediately: 0,
  clientOrderId: payload.Name,
  clientSku: payload.Client_SKU__c,
  city: payload.City__c,
  companyName: payload.Company_Name__c,
  country: payload.Country__c,
  description: payload.Description__c,
  firstName: payload.First_Name__c,
  lastName: payload.Last_Name__c,
  postal: payload.Postal_Code__c,
  sfdcProjectId: payload.DatasiteOne_Project__c,
  stateProvince: payload.State_Province__c,
  units: payload.Units__c
}