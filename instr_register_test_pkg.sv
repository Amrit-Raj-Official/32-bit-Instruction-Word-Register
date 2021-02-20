package instr_register_test_pkg;

timeunit 1ns; timeprecision Ins;
import instr_register_pkg: :*;
export instr_register_pkg: :*;

virtual tb_ife v_io; // available to all classes in package

typedef class Transaction;
typedef class DivideByZero;
typedef class NoDivideByZero;
typedef class Component ;
typedef class Scoreboard;
typedef class Monitor;
typedef class Driver;
typedef class Generator;
typedef class BaseTest;

'include "class_files/Class_Transaction.svh"
'include “class_files/Class_DivideByZero.svh"
'include “class_files/Class_NoDividedByZero.svh"
'include "class_files/Class_Component.svh"
'include "class_files/Class_Scoreboard.svh"
'include “class_files/Class_Monitor.svh"
'include “class_files/Class_Driver.svh"
'include "class_files/Class_Generator.svh"
'include "class_files/Class_Base_Test.svh"

endpackage: instr_register_test_pkg