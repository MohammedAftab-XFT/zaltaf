CLASS zma_cl_rap_read DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_rap_query_provider .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZMA_CL_RAP_READ IMPLEMENTATION.


  METHOD if_rap_query_provider~select.
    IF io_request->is_data_requested( ).

      DATA: lt_cds TYPE TABLE OF zma_emp_cds,
            ls_cds TYPE zma_emp_cds.

      DATA(lv_top)     = io_request->get_paging( )->get_page_size( ).
      IF lv_top < 0.
        lv_top = 1.
      ENDIF.

      DATA(lv_skip)    = io_request->get_paging( )->get_offset( ).

      DATA(lt_sort)    = io_request->get_sort_elements( ).

      DATA : lv_orderby TYPE string.
      LOOP AT lt_sort INTO DATA(ls_sort).
        IF ls_sort-descending = abap_true.
          lv_orderby = |'{ lv_orderby } { ls_sort-element_name } DESCENDING '|.
        ELSE.
          lv_orderby = |'{ lv_orderby } { ls_sort-element_name } ASCENDING '|.
        ENDIF.
      ENDLOOP.
      IF lv_orderby IS INITIAL.
        lv_orderby = 'emp_name'.
      ENDIF.


      DATA(lv_conditions)     =  io_request->get_filter( )->get_as_sql_string( ).

    data(lv_extra_param) = io_request->get_parameters(  ).
      "SELECT * FROM zma_db_emp into table @data(lt_original).

      "delete from zma_emp_draft.

      "INSERT zma_emp_draft from table @lt_original.

*         TRY.
*
*        DATA:
*          lv_rec_id   TYPE string,
*          ls_appl_01  TYPE /xfc/draft_appl,
*          ls_appl_02  TYPE /xfc/draft_appl,
*          lo_draft_01 TYPE REF TO /xfc/cl_draft_2,
*          lo_draft_02 TYPE REF TO /xfc/cl_draft_2.
*
*************************************************************************************
*************************************************************************************
*
*
*        ls_appl_01-appl_id = 'ZKE_001'.
*        ls_appl_01-appl_key = '11111111'.
*
**        ls_appl_02-appl_id = 'ZKE_002'.
**        ls_appl_02-appl_key = '11111111'.
*
*        IF /xfc/cl_draft_2=>get_instance( iv_appl_id  = CONV #( ls_appl_01-appl_id ) iv_appl_key = CONV #( ls_appl_01-appl_key ) )->/xfc/if_draft~is_connected( ) <> abap_true.
*
*          lo_draft_01 = /xfc/cl_draft_2=>get_instance( iv_appl_id  = CONV #( ls_appl_01-appl_id ) iv_appl_key = CONV #( ls_appl_01-appl_key ) ).
*
*          IF lo_draft_01->/xfc/if_draft~is_connected( ).
*            RAISE EXCEPTION TYPE /xfc/cx_draft
*              MESSAGE ID '/XFC/BASE_DRAFT' TYPE 'E' NUMBER '005'.
*          ENDIF.
*
*          lo_draft_01->/xfc/if_draft~connect( ).
*"        /xfc/cl_system=>/xfc/if_system_luw~commit_entities( ).
*
*        ENDIF.
*
*        lo_draft_01 = /xfc/cl_draft_2=>get_instance( iv_appl_id  = CONV #( ls_appl_01-appl_id ) iv_appl_key = CONV #( ls_appl_01-appl_key ) ).
*
*        IF lo_draft_01->/xfc/if_draft~is_connected( ) <> abap_true.
*          RAISE EXCEPTION TYPE /xfc/cx_draft
*            MESSAGE ID '/XFC/BASE_DRAFT' TYPE 'E' NUMBER '001'.
*        ENDIF.
*
**        lo_draft_01->/xfc/if_draft~disconnect(  ).
*
*        DATA(lv_data01) = lo_draft_01->/xfc/if_draft_data~get_data( 'ZDATA01' ).
*        "IF lv_data01 IS INITIAL.
*          lo_draft_01->/xfc/if_draft_data~set_data(
*            iv_data_id    = 'ZDATA01'
*            iv_data_value = '&&&&22222---'  ).
**        ELSEIF lv_data01 = '111111'.
**          lo_draft_01->/xfc/if_draft_data~set_data(
**                iv_data_id    = 'ZDATA01'
**                iv_data_value = '222222'  ).
*        "ENDIF.
*
*        /xfc/cl_system=>/xfc/if_system_luw~commit_entities( ).
**        CATCH /xfc/cx_base.
**        CATCH /xfc/cx_base.

*      CATCH /xfc/cx_base INTO DATA(lo_exc_base).
**        DATA(lv_text) = lo_exc_base->/xfc/if_cx_base_message~get_text( ).
**        out->write(  lv_text ).
*    ENDTRY.


      SELECT * FROM zma_emp_draft INTO TABLE @DATA(lt_records).

      io_response->set_total_number_of_records( lines( lt_records ) ).
      io_response->set_data( lt_records ).



    ENDIF.

  ENDMETHOD.
ENDCLASS.
