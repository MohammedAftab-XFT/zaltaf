@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Test view for flight data'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Search.searchable: true
define view entity ZMA_FLIGHT_DATA as select from ztf_cms_001
{
key crep_id as CrepId,

@Search.defaultSearchElement: true
@Search.fuzzinessThreshold: 0.7
appldest as Appldest
}
