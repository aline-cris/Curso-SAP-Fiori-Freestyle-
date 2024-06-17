class ZCL_ZOV_ALINE_MPC_EXT definition
  public
  inheriting from ZCL_ZOV_ALINE_MPC
  create public .

public section.

  types:
    BEGIN OF Ty_ordem_item,
        ordemid     TYPE i,
        datacriacao TYPE timestamp,
        criadopor   TYPE c LENGTH 20,
        clienteid   TYPE i,
        totalitens  TYPE p LENGTH 8 DECIMALS 2,
        totalfrete  TYPE p LENGTH 8 DECIMALS 2,
        totalordem  TYPE p LENGTH 8 DECIMALS 2,
        status      TYPE c LENGTH 1,
        toOVItem    TYPE TABLE OF ts_ovItem WITH DEFAULT KEY,
      END OF Ty_ordem_item .

  methods DEFINE
    redefinition .
protected section.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_ZOV_ALINE_MPC_EXT IMPLEMENTATION.


  METHOD define.
    DATA lo_entity_type TYPE REF TO /iwbep/if_mgw_odata_entity_typ.

    super->define( ).

    lo_entity_type = model->get_entity_type( iv_entity_name = 'OVCab' ).
    lo_entity_type->bind_structure( iv_structure_name = 'ZCL_ZOV_ALINE_MPC_EXT=>TY_ORDEM_ITEM' ).
  ENDMETHOD.
ENDCLASS.
