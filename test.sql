SELECT count(*) val, 'customers' TableName FROM mocktestcompany.customer UNION ALL
SELECT Count(*) val, 'CustomerBooking' TableName FROM mocktestcompany.customerbooking UNION ALL
SELECT count(*) val, 'customerPayment' TableName FROM mocktestcompany.customerpayment UNION ALL
SELECT count(*) val, 'customertestpartresult' TableName FROM mocktestcompany.customertestpartresult UNION ALL
SELECT count(*) val, 'customervisit' TableName FROM mocktestcompany.customervisit UNION ALL
SELECT count(*) val, 'presentedIdentification' TableName FROM mocktestcompany.presentedidentification;