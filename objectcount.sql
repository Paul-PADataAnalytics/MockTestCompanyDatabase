SELECT count(*) val, 'customers' TableName FROM customer UNION ALL
SELECT Count(*) val, 'CustomerBooking' TableName FROM customerbooking UNION ALL
SELECT count(*) val, 'customerPayment' TableName FROM customerpayment UNION ALL
SELECT count(*) val, 'customertestpartresult' TableName FROM customertestpartresult UNION ALL
SELECT count(*) val, 'customervisit' TableName FROM customervisit UNION ALL
SELECT count(*) val, 'presentedIdentification' TableName FROM presentedidentification;