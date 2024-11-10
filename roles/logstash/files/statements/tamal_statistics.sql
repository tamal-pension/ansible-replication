SELECT 	ts.tm_id,
		rep_a.accountant_id AS reported_accountant_id,
		rep_a.accountant_key AS reported_accountant_key,
		ts.employee_id,
		ts.period_id as salary_period_id,
		ts.company_part_id,
		cp.company_part_name,
		c.company_id,
		c.company_portfolio_id,
		c.company_name,
		a.accountant_id,
		a.accountant_key,
		a.user_id,
		ts.modify_date,
		ts.is_sent,
		ts.reporting_period_id as period_id,
		ts.insert_date,
		DAY(ts.insert_date) AS ts_day,
		MONTH(ts.insert_date) AS ts_month,
		YEAR(ts.insert_date) AS ts_year,
		DATE_FORMAT(ts.insert_date,'%Y-%m') AS yearmonth,
		ts.statistic_count,
		ts.is_valid_for_count,
		ts.transaction_key,
		ts.has_pro_category,
		ts.reporting_id
FROM tamal_statistics ts
JOIN companies_parts cp ON ts.company_part_id = cp.company_part_id
JOIN companies c ON c.company_id = cp.company_id
JOIN accountants a ON a.accountant_id = c.accountant_id
LEFT JOIN accountants rep_a ON rep_a.accountant_id = ts.accountant_id
WHERE ts.modify_date > :sql_last_value AND is_valid_for_count = 1