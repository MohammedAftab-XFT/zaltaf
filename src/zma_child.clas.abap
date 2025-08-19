CLASS zma_child DEFINITION
  PUBLIC
  INHERITING FROM zma_parent

  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    methods zma_pub_check redefinition.
  PROTECTED SECTION.
    methods zma_chec_3 redefinition.
    methods zma_check2 redefinition.
    methods zma_check redefinition.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZMA_CHILD IMPLEMENTATION.


method zma_check.

endmethod.


method zma_check2.

endmethod.


method zma_chec_3.

endmethod.


method zma_pub_check.

endmethod.
ENDCLASS.
