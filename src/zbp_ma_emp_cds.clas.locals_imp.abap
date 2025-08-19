CLASS lcl_buffer_data DEFINITION.
  PUBLIC SECTION.

    CLASS-DATA gt_save TYPE TABLE OF zma_emp_draft.
    CLASS-DATA gv_mode TYPE char9.

    CLASS-DATA gt_cds TYPE TABLE OF zma_emp_draft.
    CLASS-DATA gt_init TYPE TABLE OF zma_emp_draft.


ENDCLASS.

CLASS lhc_zma_emp_cds DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE zma_emp_cds.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zma_emp_cds.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zma_emp_cds.

    METHODS read FOR READ
      IMPORTING keys FOR READ zma_emp_cds RESULT result.

    METHODS fi_normal FOR MODIFY
      IMPORTING keys FOR ACTION zma_emp_cds~fi_normal RESULT result.

    METHODS fi_downloaddoc FOR READ
      IMPORTING keys FOR FUNCTION zma_emp_cds~fi_downloaddoc RESULT result.

    METHODS fi_submit FOR MODIFY
      IMPORTING keys FOR ACTION zma_emp_cds~fi_submit RESULT result.

    METHODS fi_initialize FOR MODIFY
      IMPORTING keys FOR ACTION zma_emp_cds~fi_initialize RESULT result.

    METHODS createobjinfosession FOR MODIFY
      IMPORTING keys FOR ACTION zma_emp_cds~createobjinfosession RESULT result.


    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zma_emp_cds RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK zma_emp_cds.


ENDCLASS.

CLASS lhc_zma_emp_cds IMPLEMENTATION.

  METHOD create.
    DATA: lt_cds  TYPE TABLE OF zma_emp_draft.

    lt_cds = VALUE #( ( emp_id   = cl_system_uuid=>create_uuid_x16_static( )
                        emp_name = entities[ 1 ]-emp_name
                        dept     = entities[ 1 ]-dept ) ).

    lcl_buffer_data=>gt_cds = lt_cds.

    "INSERT zma_emp_draft FROM TABLE @lt_cds.

  ENDMETHOD.

  METHOD update.
*    DATA: lt_cds  TYPE TABLE OF zma_emp_draft.
*
*    lt_cds = VALUE #( ( emp_id = entities[ 1 ]-emp_id
*                        emp_name = entities[ 1 ]-emp_name
*                        dept =  entities[ 1 ]-dept   ) ).
*
*    UPDATE zma_emp_draft FROM TABLE @lt_cds.
*

  ENDMETHOD.

  METHOD delete.

*    DATA: ls_draft TYPE zma_emp_draft.
*
*    LOOP AT keys INTO DATA(ls_keys).
*      ls_draft-emp_id = ls_keys-emp_id.
*      UPDATE zma_emp_draft SET mark_delete = 'X' WHERE emp_id = @ls_keys-emp_id.
*
*    ENDLOOP.

  ENDMETHOD.

  METHOD read.
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
*            iv_data_value = '22222---'  ).
**        ELSEIF lv_data01 = '111111'.
**          lo_draft_01->/xfc/if_draft_data~set_data(
**                iv_data_id    = 'ZDATA01'
**                iv_data_value = '222222'  ).
*        "ENDIF.
*
*"        /xfc/cl_system=>/xfc/if_system_luw~commit_entities( ).
**        CATCH /xfc/cx_base..
**        CATCH /xfc/cx_base.
*
*      CATCH /xfc/cx_base INTO DATA(lo_exc_base).
**        DATA(lv_text) = lo_exc_base->/xfc/if_cx_base_message~get_text( ).
**        out->write(  lv_text ).
*    ENDTRY.


  ENDMETHOD.

  METHOD fi_normal.

    DATA(lv_id) =  keys[ 1 ]-%param-id.
    DATA(lv_doc) = keys[ 1 ]-%param-document.

*    UPDATE zma_emp_draft
*   SET document = @lv_doc
*   WHERE emp_id = @lv_id.



  ENDMETHOD.

  METHOD fi_downloaddoc.
*    DATA(lv_id) = keys[ 1 ]-%param-emp_id.
*
*    SELECT * FROM zma_emp_draft
*    WHERE emp_id = @lv_id
*    INTO TABLE @DATA(lt_attachment).
*
*    result = VALUE #( ( %param-id       = lt_attachment[ 1 ]-emp_id
*                        %param-document = lt_attachment[ 1 ]-document ) ).

  ENDMETHOD.

  METHOD fi_submit.

*    DATA: lt_draft TYPE TABLE OF zma_emp_draft.
*
*    SELECT * FROM zma_emp_draft INTO TABLE @lt_draft.
*
*    lcl_buffer_data=>gt_save =  lt_draft .
*
*    lcl_buffer_data=>gv_mode = 'save'.

  ENDMETHOD.

  METHOD fi_initialize.

*    DATA:ls_draft TYPE zma_emp_draft,
*         lt_draft TYPE TABLE OF zma_emp_draft.
*
*    SELECT * FROM zma_db_emp INTO TABLE @DATA(lt_original).
*
*    DELETE FROM zma_emp_draft.
*
*    LOOP AT lt_original INTO DATA(ls_org).
*      ls_draft-emp_id = ls_org-emp_id.
*      ls_draft-document = ls_org-document.
*      ls_draft-emp_name = ls_org-emp_name.
*      ls_draft-dept = ls_org-dept.
*      APPEND ls_draft TO lt_draft.
*    ENDLOOP.
*
*    INSERT zma_emp_draft FROM TABLE @lt_draft.
*
*    lcl_buffer_data=>gt_init = lt_draft.

  ENDMETHOD.
  METHOD createobjinfosession.

*    lt_ctx_param = VALUE /xfc/tt_string_nv( ( name  = /xft/if_hr_ref_constant=>gc_object_info-appl_ctx_param-caller_id
*                                              value = /xft/if_hr_ref_constant=>gc_object_info-caller_id-agent_maintenance )
*                                            ( name  = /xft/if_hr_ref_constant=>gc_object_info-appl_ctx_param-caller_agent_role
*                                              value = lv_own_agent_role )
*                                            ( name  = /xft/if_hr_ref_constant=>gc_object_info-appl_ctx_param-agent_maintenance_agent_role
*                                              value = im_agent_role ) ).
    TRY.
        " create session

        DATA(lv_session_id) = /xfc/cl_ui5_obj_info=>create_session(
          iv_object_type = /xfc/if_ui5_obj_info_constant=>object_type-bc-user
    "     im_appl_context      = lt_ctx_param
    "     im_object_ids  = VALUE #( ( object_id = CONV #( im_agent_id ) ) )
          iv_multi_input = abap_false
          iv_required    = abap_true
          iv_readonly    = abap_false
          iv_appl_layer  = '' ).
        result = VALUE #( BASE result ( VALUE #(
                                                 %cid   = keys[ 1 ]-%cid
                                                 %param = VALUE #( sessionid = lv_session_id ) ) ) ).





      CATCH /xfc/cx_base INTO DATA(lo_cx_base).
        failed-zma_emp_cds = VALUE #( ( %tky        = CORRESPONDING #( keys[ 1 ] )
                                        %cid        = keys[ 1 ]-%cid
                                        %fail-cause = if_abap_behv=>cause-unspecific ) ).
        reported-zma_emp_cds = VALUE #( ( %tky = CORRESPONDING #( keys[ 1 ] )
                                          %cid = keys[ 1 ]-%cid
                                          %msg = lo_cx_base->/xfc/if_cx_base~get_as_behv_message( ) ) ).
    ENDTRY.
  ENDMETHOD.
  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD lock.

    TRY.
        DATA(lock) = cl_abap_lock_object_factory=>get_instance( iv_name = 'EZLOCKSTUDENT' ).
      CATCH cx_abap_lock_failure INTO DATA(exception).
        RAISE SHORTDUMP exception.
    ENDTRY.

  ENDMETHOD.

ENDCLASS.

CLASS lsc_zma_emp_cds DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.


ENDCLASS.

CLASS lsc_zma_emp_cds IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.

    "have a case and if buffer is filled then commit to real DB

*    IF lines( lcl_buffer_data=>gt_cds ) >= 1.
*      INSERT zma_emp_draft FROM TABLE @lcl_buffer_data=>gt_cds.
*
*    ENDIF.
*
*    IF lines( lcl_buffer_data=>gt_init ) >= 1.
*      DELETE FROM zma_emp_draft.
*      INSERT zma_emp_draft FROM TABLE @lcl_buffer_data=>gt_init.
*
*    ENDIF.


    DATA lo_operation       TYPE REF TO if_bgmc_op_single_tx_uncontr.
    DATA lo_process         TYPE REF TO if_bgmc_process_single_op.
    DATA lo_process_factory TYPE REF TO if_bgmc_process_factory.
    DATA lx_bgmc            TYPE REF TO cx_bgmc.

    lo_operation = NEW zke_cl_test_bgpf( 'Try-4' ).

    TRY.
        lo_process_factory = cl_bgmc_process_factory=>get_default( ).

        lo_process = lo_process_factory->create( ).

        lo_process->set_name( 'Test process 2'
          )->set_operation_tx_uncontrolled( lo_operation ).

        lo_process->save_for_execution( ).

        "commit entities calls commit work, if entity is changed/saved
        "So it works only, if other entity data is saved
*        COMMIT ENTITIES.
        " COMMIT WORK.

        "out->write(  'Test' ).


      CATCH cx_bgmc INTO lx_bgmc.
        " out->write( lx_bgmc->get_longtext( ) ).

        "ROLLBACK WORK.

    ENDTRY.

*
*    CASE lcl_buffer_data=>gv_mode.
*
*      WHEN 'save'.
*
*        IF lines( lcl_buffer_data=>gt_save ) >= 1.
*
*          DATA: ls_org TYPE zma_db_emp,
*                lt_org TYPE TABLE OF zma_db_emp.
*
*          DATA(lt_data) = lcl_buffer_data=>gt_save.
*
*          LOOP AT lt_data INTO DATA(ls_data).
*            IF ls_data-mark_delete = 'X'.
*              DELETE FROM zma_db_emp
*               WHERE emp_id = @ls_data-emp_id.
*                DELETE FROM zma_emp_draft
*               WHERE emp_id = @ls_data-emp_id.
*            ELSE.
*              ls_org-emp_id = ls_data-emp_id.
*              ls_org-dept = ls_data-dept.
*              ls_org-document = ls_data-document.
*              ls_org-emp_name = ls_data-emp_name.
*
*              APPEND ls_org TO lt_org.
*            ENDIF.
*          ENDLOOP.
*
*          MODIFY zma_db_emp FROM TABLE @lt_org.
*          CLEAR lcl_buffer_data=>gt_save.
*          CLEAR lcl_buffer_data=>gv_mode.
*
*        ENDIF.
*    ENDCASE.


  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
