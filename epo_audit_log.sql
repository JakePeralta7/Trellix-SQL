SELECT
	[OrionAuditLog].[AutoId],
	[OrionAuditLog].[UserName] AS [user],
	[OrionAuditLog].[CmdName] AS [signature],
	[OrionAuditLog].[Message],
	[OrionAuditLog].[StartTime],
	[OrionAuditLog].[EndTime],
CASE
	WHEN [OrionAuditLog].[Success] = 0 THEN 'failure'
	WHEN [OrionAuditLog].[Success] = 1 THEN 'success'
    ELSE 'unknown'
END AS [status],
CASE
	WHEN [OrionAuditLog].[Priority] = 1 THEN 'High'
	WHEN [OrionAuditLog].[Priority] = 2 THEN 'Medium'
	WHEN [OrionAuditLog].[Priority] = 3 THEN 'Low'
    ELSE 'unknown'
END AS [priority]
FROM [OrionAuditLog]