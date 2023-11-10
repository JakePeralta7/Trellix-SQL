SELECT
	[EPORepositoryStatus].[name] AS [repository_name],
	[EPORepositoryStatus].[id] AS [repository_id],
	[EPORepository].[Type] AS [type],
	[EPORepository].[Protocol] AS [protocol],
	[EPORepositoryStatus].[lastreplication] AS [last_replication],
CASE
	WHEN [EPORepositoryStatus].[status] = 0 THEN 'Needs first update'
	WHEN [EPORepositoryStatus].[status] = 1 THEN 'Repository busy'
	WHEN [EPORepositoryStatus].[status] = 2 THEN 'Last replication failed'
	WHEN [EPORepositoryStatus].[status] = 3 THEN 'Last replication succeeded'
	WHEN [EPORepositoryStatus].[status] = 4 THEN 'Main Repository idle'
	WHEN [EPORepositoryStatus].[status] = 5 THEN 'Main Repository corrupt'
    ELSE 'unknown'
END AS [status]
FROM [EPORepositoryStatus]
INNER JOIN [EPORepository] ON [EPORepository].[RepositoryID] = [EPORepositoryStatus].[id]
