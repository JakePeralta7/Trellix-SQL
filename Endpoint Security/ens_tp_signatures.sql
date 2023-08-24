SELECT
	[IPS_SignatureTextXlateMT].[SignatureName] AS [signature],
	[IPS_SignatureTextXlateMT].[SignatureID] AS [signature_id],
	[IPS_SignatureMT].[SigType] AS [type],
	[IPS_SignatureTextXlateMT].[SignatureStat] AS [description],
	[IPS_SignatureTextXlateMT].[SignatureFP] AS [false_positive],
	[IPS_SignatureMT].[cveLink] AS [cve_link]
FROM [IPS_SignatureTextXlateMT]
/* Filter to en-us language */
INNER JOIN [IPS_SignatureMT] ON [IPS_SignatureMT].[SignatureID] = [IPS_SignatureTextXlateMT].[SignatureID]
WHERE [LanguageID] = 1033