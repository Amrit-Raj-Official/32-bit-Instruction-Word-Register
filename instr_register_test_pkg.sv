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

'include "class_files/transaction.svh"
'include “class_files/dividebyzero.svh"
'include “class_files/nodividebyzero.svh"
'include "class_files/component.svh"
'include "class_files/scoreboard.svh"
'include “class_files/monitor.svh"
'include “class_files/driver.svh"
'include "class_files/generator.svh"
'include "class_files/basetest.svh"

endpackage: instr_register_test_pkg