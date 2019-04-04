-------------------------------------------------------------------------------------------------
--Copyright Information: (C) Copyright 2009 IBM Corporation All Rights Reserved.   
--This software is the confidential and proprietary information of IBM Corporation.
--("Confidential Information"). Redistribution of source code or binary form of the source code
--is prohibited without prior authorization from IBM Corporation.
-------------------------------------------------------------------------------------------------

CREATE OR REPLACE PACKAGE xx_bom_rtg_cnv_pkg
AS
/*
------------------------------------------------------------------------------------------------------
Package Name    : xx_bom_rtg_cnv_pkg
Author's Name   : Ayan Choudhury
Date Written    : 16-OCT-2008
RICEW Object id : XXBOMCNV02
Purpose         : Package Specification for Routing Data Conversion
Program Style   :
Maintenance History
Date            Issue#                 Name                  Remarks
-----------     ----------------      -----------------    -------------
16-OCT-2008     1.0                    Ayan Choudhury      Initial version
--------------------------------------------------------------------------------------------------------
*/
/* Public Constant Declaration Section */
  g_program_type       xx_emf_message_headers.program_type%TYPE := 'CONC_PRGM'; 
  g_return_value       NUMBER;
  g_warning_flag       VARCHAR2(1);
  --Flag to capture warning ('W')
  g_output_message     VARCHAR2 (1000);
  --stores the message returned from external routines 
  
/*
Global Variable Declaration Section
*/
  g_debug_level        NUMBER                                     := 50;
  -- 50 is default, that is all messages(logged at level 10,20..50)
  -- would be visible
  g_retention_period   NUMBER                                     := 30;
  -- This is the number of days for which error records are going
  -- to be retained in the EMF tables
  g_err_col1_width     NUMBER                                     := 10;
  g_err_col2_width     NUMBER                                     := 30;
  g_err_col3_width     NUMBER                                     := 10;
  g_err_col4_width     NUMBER                                     := 10;
  g_err_col5_width     NUMBER                                     := 10;
  g_err_col6_width     NUMBER                                     := 20;
  g_err_col7_width     NUMBER                                     := 10;
  g_err_col8_width     NUMBER                                     := 10;

  -- These 8 should add up to 100 for best display, you can use
  -- as many columns as you want, adding up to 100, leaving the rest as 0.

  /*
  -----------------------------------------------------------
Public Procedure/Function Declaration Section
Purpose-Main calling Procedure to Import Purchase quotations
-----------------------------------------------------------
*/
 
  PROCEDURE main (
    x_errbuf     OUT      VARCHAR2
  , x_retcode    OUT      VARCHAR2
  , p_run_mode   IN       VARCHAR2
  );
  
  PROCEDURE control_validation (
  io_error_flag IN OUT VARCHAR2
  );
  
  PROCEDURE insert_into_preint (
  io_error_flag IN OUT VARCHAR2
  );
  
  PROCEDURE business_validation (
  io_error_flag IN OUT VARCHAR2
  );
  
  PROCEDURE import_api_bom (
    io_error_flag IN OUT VARCHAR2
  );
  
 
END xx_bom_rtg_cnv_pkg;
/

