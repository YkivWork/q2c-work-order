%dw 1.0
%output application/java
---
flatten payload map {
	ariaAcct: $.id_val,
	split: $.split
}