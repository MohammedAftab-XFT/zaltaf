@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Test for parallel request'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZMA_PARALLEL_REQ as select from zma_db_emp

{
    
    key emp_id as EmpId,
    emp_name as EmpName,
    dept as Dept
}
