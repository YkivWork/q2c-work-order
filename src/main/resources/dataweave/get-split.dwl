%dw 1.0
%output application/java
---
flatten payload filter ($.project_id == flowVars.sfdcResponse.sfdcProjectId) map {
	split_val: payload.billing_split
}