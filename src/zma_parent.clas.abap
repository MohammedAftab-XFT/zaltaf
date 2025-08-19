CLASS zma_parent DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
methods zma_pub_check.

INTERFACES zma_i_test.

  PROTECTED SECTION.
    METHODS zma_check.
    METHODS zma_check2.
    methods zma_chec_3.
  PRIVATE SECTION.
  methods zma_p_check.
ENDCLASS.



CLASS ZMA_PARENT IMPLEMENTATION.


method zma_check.
if 1 = 2. ENDIF.
endmethod.


method zma_check2.
if 1 = 2. ENDIF.
endmethod.


METHOD zma_chec_3.

ENDMETHOD.


METHOD zma_i_test~test1.

ENDMETHOD.


method zma_pub_check.

ENDMETHOD.


method zma_p_check.

ENDMETHOD.
ENDCLASS.
