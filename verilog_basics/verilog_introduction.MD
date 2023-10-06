# What is Verilog

## Terminology

Verilog is an HDL(Hardware Description Language), it is used to model a piece of hardware. Circuits may be modeled in two 
ways, by their behavior or by there structure.
* **Behavior Modeling:** A component is described by its input/output response
* **Structured Modeling:** A component is described by its interconnecting lower-level components

### Behavior Modeling

In Behavior Modeling, you define only the functionality of the circuit, in the following example, there are the
implementation of a 2 to 4 decoder using this method of Modeling:

```verilog
module decoder_2x4 (
    input wire [1:0] A,
    output wire [3:0] Y
);

    assign Y[0] = (A == 2'b00) ? 1'b1 : 1'b0;
    assign Y[1] = (A == 2'b01) ? 1'b1 : 1'b0;
    assign Y[2] = (A == 2'b10) ? 1'b1 : 1'b0;
    assign Y[3] = (A == 2'b11) ? 1'b1 : 1'b0;

endmodule
```

### Structural Modeling

In Structural Modeling, both the functionalities, and structure of the code are specified, it can be seen in the 
following example:

```verilog
module decoder_2x4 (
    input wire [1:0] A,
    output wire [3:0] Y
);

    always @(*) begin
        case (A)
            2'b00: Y = 4'b0001;
            2'b01: Y = 4'b0010;
            2'b10: Y = 4'b0100;
            2'b11: Y = 4'b1000;
            default: Y = 4'b0000;
        endcase
    end

endmodule
```

**It is common to find elements of both Structural and Behavior Modeling in the same project**

### RTL (Register Transfer Level)

**What is it?**
* It is a common term that describes a style of Behavior Modeling. It defines the input-output relationships in 
dataflow operations inside your model.

After their creation, RTL constructs are Synthesizable.

**What is Synthesis?**
* Synthesis refers to the translation and optimization of a HDL code into a circuit of a particular technology
* So, RTL Systhesis refers to the translation of an RTL model into a optimized gate level implementation

## Syntax

* Verilog is case-sensitive 
* All keywords are lower case 
* Statements end with a semicolon ';'
* Single line comments begin with "//"
* Multi line comments begin with a "/*" and end with "*/"
* Empty spaces are used for readability


Modules starts with the keyword **module** and ends with **endmodule**. Every module is comprised of several parts,
the **port declarations**, the **data type declarations**, the **circuit functionality** and the **timing 
specifications**

### Module and port declaration

A module begins with the keyword **module**, followed by the name of the module, then there is the port list. The port 
list contains all the inputs, outputs and bidirectional connections to a module, the port list is in the parenthesis
right after the module name. 

After the port list is the port declaration section, which associates each of the ports with the port type, that could 
be: input, output or inout.
* input is used to input ports
* output is used to output ports
* inout is used to bidirectional ports

Port declarations are made in the following way:
* **<port_type> <port_name>;**

While declaring a bus, it is needed to add brackets containing the bus size, example: 
* **output [31..0] out;** 

Example of a declaration of an ULA:
```verilog
module ALU(
    input [31:0] A,         // 31-bit input A
    input [31:0] B,         // 31-bit input B
    input [3:0] function,   // 4-bit control signals for operation selection
    output reg [31:0] result,  // 31-bit result
    output reg Z,           // Zero flag
    output reg N            // Negative flag
);
(...)
endmodule
```

### Data type declaration

There are two types of data, nets and variable.
* Nets represent physical interconnections between functional blocks, they need to be driver continuously and do not 
store values
* Variables are used to store data, very similar to variables in high-level languages like C. They may be Synthesized
into flip-flops or registers or even combinatorial nodes

Variables data types need to be assigned inside a procedure, a task or a function 


| Net Data Type | What it represent    | 
|---------------|----------------------|
| wire          | node or a connection |
| tri           | tri-state node       | 
| supply0       | logic 0              |
| supply1       | logic 1              |

Examples of declaration:

```verilog
wire [7..0] out;
tri enable;
```

| Variable Data Type | What it represent                 | 
|--------------------|-----------------------------------|
| reg                | unsigned variable of any bit size |
| integer            | signed 32bit variable             | 
| real               | no synthesis support              |
| time               | no synthesis support              |
| realtime           | no synthesis support              |

* Observation, you can use **reg signed** for a signed implementation
* **real**, **time** and **realtime** are for simulation purposes only

Examples of declaration:

```verilog
reg [7..0] N;
integer count;
```

### Module Instantiation

Once a module is declared, it can be instantiated at a higher level module by using the following syntax:

```verilog
<component_name> #<delay> <instance_name> (port_list);
```

* **<component_name>** is the module name of your lower-level component
* **#<delay>** is used if you wish to express time delay through the module (simulation only)
* **<instance_name>** is the name of the component (needs to be unique), applied to the component instance
* **(port_list)** is a list of signals you want to connect to the inputs or outputs of the lower level component

By instantiating modules, you can create designs with multiple levels of hierarchy to achieve easies maintainability.
Modern designs typically have many layers per hierarchy.

When connecting signals to a lower level module port, they can be defined by **ordered list** or by **name**

#### Ordered List

In this model, you are connecting higher level signals to a lower level module ports by listing them in the same order 
as the port list are in the lower level module declaration. It is important to remember that the order **does matter**
in this case. 
* Only used in modules with few ports

#### Name

Ports are connected by defining their name (you name which wires connects with each port), the order of the ports
connected does not matter, and you may leave empty if you do not want to connect to a port.
* This is the preferred method because it makes easier to see how the connections are made without having to dive into
the declaration of the lower level module

### Port Connections Rules 

Connections into and out of modules must obey certain rules. Ports of a module and the connections to a module can only
be declared of certain data types. When declaring a module, signals of a variable type can not be used as inputs or 
inout ports, while the net data type can be used in all situations.
Implicitly, inputs and outputs are default to wires if there type is not specified. When connecting a signal to a lower 
level module port, variables can not be connected to the outputs or inout of the module, while the net data type can be 
used in all situations.

### Parameters

Parameters are used to associate a value with a symbolic name. 

