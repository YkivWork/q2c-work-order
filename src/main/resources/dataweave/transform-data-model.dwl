%dw 1.0
%output application/json
---
payload map {
  client_sku: $.Client_SKU__c,
  units: $.Units__c,
  amount: $.Amount__c,
  client_order_id: $.Name,
  description: $.Description__c,
  created_at: $.CreatedDate,
  sfdc_project: $.DatasiteOne_Project__c
}