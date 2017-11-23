%dw 1.0
%output application/java
%var size = flowVars.outsize
%var count = flowVars.counter
%var totalAmount = flowVars.sfdcResponse.amount
%var totalSplitAmount = (flowVars.totalSplitAmount + payload.amount) as :string {format: '.##'} as :number
%var cmp1 = totalAmount - totalSplitAmount
%var cmp2 = totalSplitAmount - totalAmount
---
{
	ariaAcct: payload.ariaAcct,	
	ariaMPI: payload.ariaMPI,
	split: payload.split,
	addedSplitAmount: totalSplitAmount,
	amount: (payload.amount - cmp2) when ((totalSplitAmount > totalAmount) and (size == count)) otherwise (payload.amount + cmp1) when ((totalSplitAmount < totalAmount) and (size == count)) otherwise payload.amount
	}