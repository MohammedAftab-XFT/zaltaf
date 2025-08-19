@AbapCatalog.sqlViewName: 'ZMACHILDCDS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS test for Child App'
@Metadata.ignorePropagatedAnnotations: true
define view ZMA_CDS_CHILD as select from ztf_cms_001
{
key crep_id as CrepId,
appldest as Appldest
}
