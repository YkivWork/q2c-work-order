%dw 1.0
%output application/java
---
flatten payload filter ($.IdentifierTypeKey == "Aria_MPI") map {
	ariaAcct: $.Qualifier1Value,
	ariaMPI: $.IdentifierValue
}