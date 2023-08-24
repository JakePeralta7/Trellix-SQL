SELECT
	[EPORepositoryStatus].[name] AS [repository_name],
	[EPORepositoryStatus].[id] AS [repository_id],
	[EPORepository].[Type] AS [type],
	[EPORepository].[Protocol] AS [protocol],
	[EPORepositoryStatus].[lastreplication] AS [last_replication],
CASE
	WHEN [EPORepositoryStatus].[status] = 0 THEN 'Needs first update'
	WHEN [EPORepositoryStatus].[status] = 2 THEN 'Last replication failed'
	WHEN [EPORepositoryStatus].[status] = 4 THEN 'Main Repository idle'
    ELSE 'unknown'
END AS [status]
FROM [EPORepositoryStatus]
INNER JOIN [EPORepository] ON [EPORepository].[RepositoryID] = [EPORepositoryStatus].[id]