%dw 1.0
%output application/java 
---
(flowVars.orgMDR map ((outerPay,outerIndex) ->{
	(flowVars.projMDR map ((innerPay,innerIndex) ->{
		(ariaAcct:innerPay.ariaAcct),		
		(ariaMPI: innerPay.ariaMPI),
		(split:outerPay.split),
		(amount: (outerPay.split as :number /100.00 * flowVars.sfdcResponse.amount)  as :string {format: '.##'} as :number)
	} when (outerPay.ariaAcct) == (innerPay.ariaAcct) and (outerPay.split != "0.00") otherwise {} as :object))
})) - {} as :object