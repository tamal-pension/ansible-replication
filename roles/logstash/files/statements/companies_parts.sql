SELECT cp.company_part_id
	, cp.company_part_key
	, cp.company_id
	, cp.modify_date
	, cp.company_part_name
	, cp.cm_id
	, c.company_portfolio_id
	, a.accountant_id
	, a.accountant_key
	, a.user_id
	, cm.cm_id
	, cmk.cm_key
 FROM companies_parts cp
  JOIN companies c ON c.company_id = cp.company_id
   JOIN accountants a ON a.accountant_id = c.accountant_id
   LEFT JOIN companies_masters cm ON cm.cm_id = cp.cm_id
 LEFT JOIN companies_masters_keys cmk ON cmk.cm_id = cm.cm_id
 WHERE cp.modify_date > :sql_last_value