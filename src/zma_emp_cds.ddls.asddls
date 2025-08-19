@EndUserText.label: 'CDS entity for employee data'
@ObjectModel:{
    query:{
     implementedBy: 'ABAP:ZMA_CL_RAP_READ'
    }
}
define root custom entity ZMA_EMP_CDS
{
   key emp_id : abap.int4;
   emp_name : abap.string(256);
   dept :abap.char(10);
   document : abap.string;
   mark_delete: abap.char(1);
    _child : association to ZMA_EMP_CHILD on _child.emp_id = ZMA_EMP_CDS.emp_id;
}
