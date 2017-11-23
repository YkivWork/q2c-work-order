%dw 1.0
%output application/java
---
payload filter ($.IdentifierTypeKey == "Aria_Acct") map {
    id_val : $.IdentifierValue,
    split: flowVars.split.split_val[0]
    }