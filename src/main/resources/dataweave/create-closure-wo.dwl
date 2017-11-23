%dw 1.0
%output application/xml
%namespace soap http://schemas.xmlsoap.org/soap/envelope/
%var isClosureCreate = flowVars.closureCreate default false

// cdm == Canonical Data Model - I couldn't think of a better name
%var cdm = flowVars.sfdcResponse

%var units = cdm.units as :number when (cdm.units default 1) > 1 otherwise 1

%var amount = cdm.amount

%var clientOrderId = cdm.clientOrderId

%var ariaMPI = flowVars.ariaMPI
%var ariaAcct = flowVars.ariaAcct
---
{
  soap#Envelope: {
    soap#Header: {},
    soap#Body: {
      create_order_m @(xmlns:p('aria.namespace')):{
        client_no: p('aria.client_no'),
        auth_key: p('aria.auth_key'),
        acct_no: ariaAcct,

        (client_acct_id: '') when isClosureCreate,

        client_plan_instance_id: '' when isClosureCreate otherwise ariaMPI,
        (plan_instance_no: ariaMPI) when isClosureCreate,
        client_order_id: clientOrderId,

        order_comments: cdm.description,

        order_line_items: {
          order_line_items_row: {
            item_dest_contact_idx: 1 when flowVars.sfdcResponse.address1 != null otherwise null,
            client_item_svc_location_id: cdm.serviceLocation,
            client_sku: cdm.clientSku,
            units: units,
            amount: (amount / units)
          }
        },

        contacts: {
          contacts_row: {
            contact_idx: 1,
            first_name: cdm.firstName,
            last_name: cdm.lastName,
            company_name: cdm.companyName,
            address1: cdm.address1,
            address2: cdm.address2,
            address3: cdm.address3,
            city: cdm.city,
            state_prov: cdm.stateProvince,
            country: cdm.country,
            postal_cd: cdm.postal
          }
        }
      }
    }
  }
}