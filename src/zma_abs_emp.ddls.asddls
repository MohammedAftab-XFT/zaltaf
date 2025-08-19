define abstract entity ZMA_ABS_EMP
{
   key emp_id : abap.int4;
   emp_name : abap.string(256);
   dept :abap.char(10);
   document : abap.string;
   //test: association to zma_abs_doc on 1 = 0;
  
}
