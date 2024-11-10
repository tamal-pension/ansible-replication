SELECT 	c.company_id,
	c.company_name,
	c.company_portfolio_id,
	c.modify_date,
	a.accountant_id,
	a.accountant_key,
	a.user_id
FROM companies c
JOIN accountants a ON a.accountant_id = c.accountant_id
WHERE c.company_id > :sql_last_value
ORDER BY c.company_id
LIMIT 1000