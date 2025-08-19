@ClientHandling.type: #CLIENT_DEPENDENT
@AbapCatalog.deliveryClass: #APPLICATION_DATA
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Table entity test'
define table entity ZMA_T_TEST
{
  key test_id : abap.int4;
      Name     : abap.char(100);
      Dept : abap.char(10);
      
}
